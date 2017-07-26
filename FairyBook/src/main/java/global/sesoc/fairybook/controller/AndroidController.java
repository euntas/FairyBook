package global.sesoc.fairybook.controller;

import org.json.simple.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.databind.ObjectMapper;

import global.sesoc.fairybook.dao.IDDAO;

@Controller
@RequestMapping("app")
public class AndroidController {

	@Autowired
	IDDAO loginDao;
	
	private static final Logger logger = LoggerFactory.getLogger(StoryController.class);
	
	@ResponseBody
	@RequestMapping(value="login", method=RequestMethod.POST)
	public String jsontext(@RequestBody JSONObject loginStr){
		
	    System.out.println("전송받은 문자열   = " + loginStr);
	    
	    String id = loginStr.get("id").toString();
	    String password = loginStr.get("password").toString();
	        
	    System.out.println("읽은 id : " + id + " 읽은 password: " + password);
	    
	    //어린이 로그인 1, 부모로그인 2, ID없음 3, PW불일치 4
	    int result = loginDao.login(id, password);
	    
	    // 로그인 성공시 true, 실패시 false 반환
	    if(result == 1 || result == 2)
	    	return "true";
	        
	    return "false";
	}

	
}