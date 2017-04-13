package global.sesoc.fairybook.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.UUID;

import javax.servlet.ServletContext;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.codec.binary.Base64;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mock.web.MockMultipartFile;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import global.sesoc.fairybook.dao.OrderBookDAO;
import global.sesoc.fairybook.util.FileService;
import global.sesoc.fairybook.vo.OrderBook;

/**
 * 책 주문 Controller
 * @author 이지나
 *
 */
@Controller
@RequestMapping("orderBook")
public class OrderBookController {

	@Autowired ServletContext servletContext;
	@Autowired OrderBookDAO dao;
	
	private static final Logger logger = LoggerFactory.getLogger(OrderBookController.class);
	private final String uploadPath = "/FairyBook/bookCover"; //파일 업로드 경로
	
	/**
	 * 책 주문 페이지로 이동
	 * @param selectionnum
	 * @param model
	 * @return order.jsp
	 */
	@RequestMapping(value="order", method=RequestMethod.POST)
	public String order(
			int selectionnum, Model model
			//,@SessionAttribute("loginUser") StoryMaker maker
			){
		logger.info("order selectionnum:{}",selectionnum);
		//제목
		String title = dao.getStoryTitle(selectionnum);
		//db에서 표지와 스토리 및 개인정보 불러오기
		OrderBook ob = dao.existCover(selectionnum);
		int ordernum = 0;
		logger.info("order???ㅠㅠㅠ orderbook: {}", ob);
		if (ob == null) {
			ordernum = dao.setOrdernum();
			logger.info("오더번호:{}",ordernum);
			OrderBook newob = new OrderBook(ordernum, selectionnum, "ryan", "default", "default", "default", 0);
			logger.info("order neworderbook: {}", newob);
			dao.saveOrder(newob);
			ob = newob;
		}
		logger.info("order orderbook: {}", ob);
		
		model.addAttribute("title",title);
		model.addAttribute("order", ob);
		return "orderBook/order";
	}
	
	/**
	 * 책 표지 만드는 화면으로 전환
	 * @param selectionNum
	 * @param model -selectionnum 담아주기
	 * @param maker -주문자
	 * @return makeCover JSP
	 */
	@RequestMapping(value="makeCover", method=RequestMethod.GET)
	public String makeCover(int ordernum, Model model
			//,@SessionAttribute("loginUser") StoryMaker maker
			){
		model.addAttribute("ordernum", ordernum);
		return "orderBook/makeCover";
	}
	
	/**
	 * 표지 파일로 저장&DB저장
	 * @param request
	 * @param maker
	 * @param selectionnum
	 * @return
	 * @throws IOException
	 */
	@ResponseBody
	@RequestMapping(value="saveCover",method=RequestMethod.POST)
	public ModelAndView captureAndSave(HttpServletRequest request,
			String imgSrc, Model model
			//,@SessionAttribute("loginUser") StoryMaker maker
			) throws IOException{
		String coverPath="";
		String binaryData = request.getParameter("imgSrc");
		int ordernum = Integer.parseInt(request.getParameter("ordernum"));
		
		//db에 표지 저장 - 이미 저장된 파일이 있으면 update
        //이미 저장된 파일있어?
        OrderBook ob = dao.getOrder(ordernum);
        logger.info("savecover ob:{}",ob);
        if (ob != null) { //저장된 표지 있으면 삭제하고 새로 저장
			dao.deleteBookCover(ordernum); //db에서 삭제
			FileService.deleteFile(uploadPath+"/"+ob.getBookcover()); //파일 삭제
		}
		
        ModelAndView mav = new ModelAndView();
        mav.setViewName("jsonView");        
        try{
            System.out.println("binary file   "  + binaryData);
            if(binaryData == null || binaryData=="") {
                throw new Exception();    
            }
            
            binaryData = binaryData.replaceAll("data:image/png;base64,", "");
            byte[] file = Base64.decodeBase64(binaryData);
            System.out.println("file  :::::::: " + file + " || " + file.length);
            String name=  UUID.randomUUID().toString()+".png";
            
            Path path = Paths.get(uploadPath+name);
            String contentType = "image/png";
            MultipartFile mf = new MockMultipartFile(name, name, contentType, file);
            if (!mf.isEmpty()) {
    			String savedFile = FileService.saveFile(mf, uploadPath);
    			//db에 넣어줄 path
    			coverPath = savedFile;
    		}
            
            System.out.println("파일 작성 완료");
            mav.addObject("msg","ok");
        }catch(Exception e){
            System.out.println("파일이 정상적으로 넘어오지 않았습니다");
            mav.addObject("msg","no");
            return mav;
        }finally{
	        //OrderBook b = new OrderBook(selectionnum, maker.getId(), "", coverPath, "");
	        OrderBook b = new OrderBook(0,ordernum, "ryan", "", coverPath, "표지",0);
	        int result = dao.updateOrder(b);
        }

        return mav;
	}
	
	/**
	 * order.jsp의 책표지 불러오기
	 * @param response
	 * @param ordernum
	 * @return
	 * @throws IOException
	 */
	@RequestMapping(value="getBookCover")
	public String getBookCover(HttpServletResponse response, int ordernum) throws IOException{
		//db에서 표지와 스토리 및 개인정보 불러오기
		logger.info("getcover ordernum:{}",ordernum);
		OrderBook ob = dao.getOrder(ordernum);
		logger.info("getcover orderbook: {}", ob);
		if (ob.getBookcover().equals("default")) {
			return null;
		}
		//책 표지 이미지 가져오기
		//원래의 파일명을 보여줄 준비. 
		response.setHeader("Content-Disposition", "attachment;filename="
				+URLEncoder.encode(ob.getBookcover(),"UTF-8"));
		//서버에 저장된 파일을 읽어서
		String savefile = uploadPath + "/" + ob.getBookcover(); //읽을 파일의 경로 제대로 확인!
		//클라이언트로 전달할 출력스트림으로 복사
		FileInputStream in = new FileInputStream(savefile);
		ServletOutputStream out = response.getOutputStream(); //reponse객체에서 client까지의 outputstream을 가져온다
		FileCopyUtils.copy(in, out);  //in으로 읽어서 out으로 내보내기
		in.close();
		out.close();
		return null;
	}
	
	
	@ResponseBody
	@RequestMapping(value="updateOrder",method=RequestMethod.POST)
	public void updateOrder(int ordernum, int cost, int count, int currentstate){
		
	}
}
