package global.sesoc.fairybook.controller;

import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import global.sesoc.fairybook.dao.AvatarDAO;

/**
 * @author 하성걸
 * 집을 관리하는 컨트롤러입니다
 */
@Controller
public class HouseController {
	
	private static final Logger logger = LoggerFactory.getLogger(HouseController.class);
	
	@Autowired
	AvatarDAO dao;
	
	/**
	 * 아바타 만들기 종료 후 하우스로 이동
	 */
	@RequestMapping(value = "house", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		return "objectmaker/house";
	}
	
	
}
