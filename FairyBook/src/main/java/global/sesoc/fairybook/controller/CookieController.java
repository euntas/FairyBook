package global.sesoc.fairybook.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import global.sesoc.fairybook.dao.AvatarDAO;

/**
 * @author 하성걸
 * 과자집 색칠을 관리하는 컨트롤러입니다
 */
@Controller
@RequestMapping(value="objectMaker")
public class CookieController {
	
	private static final Logger logger = LoggerFactory.getLogger(CookieController.class);
	
	@Autowired
	AvatarDAO dao;
	
	/**
	 * 과자집 색칠하기 버튼을 눌렀을시
	 */
	@RequestMapping(value = "cookieHouse", method = RequestMethod.GET)
	public String cookieHouse() {
		return "objectMaker/cookieHouse";
	}
	
	
}
