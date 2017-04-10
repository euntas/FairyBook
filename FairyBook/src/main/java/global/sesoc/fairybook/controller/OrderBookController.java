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
