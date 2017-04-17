package global.sesoc.fairybook.controller;

import java.io.FileInputStream;
import java.io.IOException;
import java.net.URLEncoder;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import global.sesoc.fairybook.dao.OrderBookDAO;
import global.sesoc.fairybook.util.FileService;
import global.sesoc.fairybook.vo.OrderBook;
import global.sesoc.fairybook.vo.StoryMaker;

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
	 * 책 주문 페이지로 이동 - 주문완료 되지 않으면 만들어놓은 표지 유지
	 * @param selectionnum
	 * @param model
	 * @return order.jsp
	 */
	@RequestMapping(value="order", method=RequestMethod.POST)
	public String order(
			@RequestParam(value="selectionnum",defaultValue="-1")int selectionnum
			,@RequestParam(value="ordernum",defaultValue="-1")int ordernum
			, Model model
			//,@SessionAttribute("loginUser") StoryMaker maker
			){
		logger.info("order selectionnum:{}",selectionnum);
		logger.info("order ordernum:{}",ordernum);
		Map<String, Integer> num = new HashMap<>();
		num.put("selectionnum", selectionnum);
		num.put("ordernum", ordernum);
		OrderBook orderBook = dao.getOrder(num);
		logger.info("order orderBook:{}",orderBook);
		if (ordernum != -1) {	//표지 만들고 돌아온 경우
			String title = dao.getStoryTitle(orderBook.getSelectionnum());
			orderBook.setTitle(title);
			model.addAttribute("order", orderBook);
			return "orderBook/order";
		}
		//storyPlay에서 책만들기 버튼 눌러서 들어온 경우
		//제목
		String title = dao.getStoryTitle(selectionnum);
		if (orderBook == null) {
			ordernum = dao.setOrdernum();
			logger.info("오더번호:{}",ordernum);
			OrderBook newob = new OrderBook(ordernum, selectionnum, title, "ryan", "default", "default", "default", 0);
			logger.info("order neworderbook: {}", newob);
			dao.saveOrder(newob);
			orderBook = newob;
		}
		logger.info("order orderbook: {}", orderBook);
		
		model.addAttribute("order", orderBook);
		return "orderBook/order";
	}
	
	@ResponseBody
	@RequestMapping(value="getLastBookCover") //selectionnum
	public ArrayList<Integer> getLastBookCover(int selectionnum){
		logger.info("bookcovers selectionnum:{}",selectionnum);
		String id="ryan";
		ArrayList<Integer> bookcovers = new ArrayList<>();
		Map<String, Object> data = new HashMap<>();
		data.put("selectionnum", selectionnum);
		data.put("id", id);
		bookcovers = dao.lastBookCover(data);
		return bookcovers;
	}
	
	@ResponseBody
	@RequestMapping(value="setCover", method=RequestMethod.POST)
	public void setCover(int myordernum, int coverordernum){
		Map<String, Integer> num = new HashMap<>();
		num.put("selectionnum", -1);
		num.put("ordernum", myordernum);
		OrderBook myorder = dao.getOrder(num);
		num.put("ordernum", coverordernum);
		OrderBook cover = dao.getOrder(num);
		myorder.setBookcover(cover.getBookcover());
		logger.info("setcover myorder:{}",myorder);
		dao.updateOrder(myorder);
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
		logger.info("save Cover ordernum:{}",ordernum);
		Map<String, Integer> num = new HashMap<>();
		num.put("ordernum", ordernum);
		num.put("selectionnum", -1);
		//db에 표지 저장 - 이미 저장된 파일이 있으면 update
        //이미 저장된 파일있어?
        OrderBook ob = dao.getOrder(num);
        logger.info("save Cover ob:{}",ob);
        logger.info("save Cover bookcover:{}",ob.getBookcover());
        FileService.deleteFile(uploadPath+"/"+ob.getBookcover()); //파일 삭제
		
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
        }
    	ob.setBookcover(coverPath);
    	ob.setCurrentstate("표지");
    	logger.info("save cover updated:{}",ob);
        int result = dao.updateOrder(ob);
        

        return mav;
	}
	
	/**
	 * order.jsp의 책표지 불러오기
	 * @param response
	 * @param ordernum
	 * @return
	 * @throws IOException
	 */
	@RequestMapping(value="getBookCover",method=RequestMethod.GET)
	public String getBookCover(HttpServletResponse response, int ordernum) throws IOException{
		//db에서 표지와 스토리 및 개인정보 불러오기
		logger.info("getcover ordernum:{}",ordernum);
		Map<String, Integer> num = new HashMap<>();
		num.put("ordernum", ordernum);
		num.put("selectionnum", -1);
		OrderBook ob = dao.getOrder(num);
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
	
	/**
	 * 주문하기 또는 장바구니 담기
	 * @param ordernum
	 * @param price
	 * @param currentstate 'addToCart','makeOrder'
	 */
	@ResponseBody
	@RequestMapping(value="updateOrder",method=RequestMethod.POST)
	public void updateOrder(int ordernum, int price, String currentstate
			,@RequestParam(value="bookcover", defaultValue="") String bookcover
			){
		logger.info("update:{},{},{}",ordernum,price,currentstate);
		OrderBook ob = new OrderBook(ordernum, 0,"","", "",bookcover, currentstate, price);
		int result = dao.updateOrder(ob);
	}
	
	@RequestMapping(value="orderCart")
	public String orderCart(){
		return "orderBook/orderCart";
	}
	
	@RequestMapping(value="orderList")
	public String orderList(){
		return "orderBook/orderList";
	}
	
	@ResponseBody
	@RequestMapping(value="cartList",method=RequestMethod.GET)
	public ArrayList<OrderBook> cartList(/*@SessionAttribute("loginUser") StoryMaker maker*/){
		String id = "ryan";
		ArrayList<OrderBook> cart = new ArrayList<>();
		cart = dao.cartList(id);
		for (OrderBook orderBook : cart) {
			String title = dao.getStoryTitle(orderBook.getSelectionnum());
			orderBook.setTitle(title);
			logger.info("cartList ob: {}",orderBook);
		}
		return cart;
	}
}
