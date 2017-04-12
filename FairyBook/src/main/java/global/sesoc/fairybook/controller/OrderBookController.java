<<<<<<< HEAD
package global.sesoc.fairybook.controller;

import java.io.FileOutputStream;
import java.io.IOException;
import java.util.UUID;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.codec.binary.Base64;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.ModelAndView;

import global.sesoc.fairybook.dao.OrderBookDAO;
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

	private static final Logger logger = LoggerFactory.getLogger(OrderBookController.class);
		
	@Autowired ServletContext servletContext;
	@Autowired OrderBookDAO dao;

	/**
	 * 책 표지 만드는 화면으로 전환
	 * @param selectionNum
	 * @param model -selectionnum 담아주기
	 * @param maker -주문자
	 * @return makeCover JSP
	 */
	@RequestMapping(value="makeCover", method=RequestMethod.GET)
	public String makeCover(int selectionNum, Model model
			//,@SessionAttribute("loginUser") StoryMaker maker
			){
		model.addAttribute("selectionnum", selectionNum);
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
	public ModelAndView captureAndSave(HttpServletRequest request, Model model
			//,@SessionAttribute("loginUser") StoryMaker maker
			) throws IOException{
		String coverPath="";
		String binaryData = request.getParameter("imgSrc");
		int selectionnum = Integer.parseInt(request.getParameter("selectionnum"));
        FileOutputStream stream = null;
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
            String fileName=  UUID.randomUUID().toString();
            System.out.println(fileName);
            String path = servletContext.getRealPath("//resources");
            System.out.println(path);
            stream = new FileOutputStream(path+"/img/bookCover/"+fileName+".png");
            stream.write(file);
            stream.close();
            System.out.println("파일 작성 완료");
            mav.addObject("msg","ok");
            
            //db에 넣어줄 path
            coverPath = "/resources/img/bookCover/"+fileName+".png";
        }catch(Exception e){
            System.out.println("파일이 정상적으로 넘어오지 않았습니다");
            mav.addObject("msg","no");
        }finally{
            stream.close();
        }
        
        //db에 표지 저장
        //OrderBook b = new OrderBook(selectionnum, maker.getId(), "", coverPath, "");
        OrderBook b = new OrderBook(selectionnum, "ryan", "", coverPath, "");
        int result = dao.saveBookCover(b);
        return mav;
	}
	
	@RequestMapping(value="order", method=RequestMethod.POST)
	public String order(
			int selectionnum
			//,@SessionAttribute("loginUser") StoryMaker maker
			){
		logger.info("order selectionnum",selectionnum);
		//db에서 표지와 스토리 및 개인정보 불러오기
		OrderBook ob = dao.getOrder(selectionnum);
		logger.info("orderbook", ob);
		return "orderBook/order";
	}
}
=======
package global.sesoc.fairybook.controller;

import java.io.FileOutputStream;
import java.io.IOException;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.codec.binary.Base64;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("orderBook")
public class OrderBookController {

private static final Logger logger = LoggerFactory.getLogger(OrderBookController.class);
	
	@RequestMapping(value="makeCover", method=RequestMethod.GET)
	public String makeCover(){
		return "orderBook/makeCover";
	}
	
	@ResponseBody
	@RequestMapping(value="saveCover",method=RequestMethod.POST)
	public ModelAndView captureAndSave(HttpServletRequest request) throws IOException{
		 String binaryData = request.getParameter("imgSrc");
        FileOutputStream stream = null;
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
            String fileName=  UUID.randomUUID().toString();
            System.out.println(fileName);
            stream = new FileOutputStream("C:/Users/kita/Desktop/"+fileName+".png");
            stream.write(file);
            stream.close();
            System.out.println("파일 작성 완료");
            mav.addObject("msg","ok");
            
        }catch(Exception e){
            System.out.println("파일이 정상적으로 넘어오지 않았습니다");
            mav.addObject("msg","no");
            return mav;
        }finally{
            stream.close();
        }
        return mav;
	}
}
>>>>>>> refs/remotes/origin/master
