package global.sesoc.fairybook.controller;

import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * 아바타를 관리하는 컨트롤러
 */
@Controller
public class AvatarController {
	
	private static final Logger logger = LoggerFactory.getLogger(AvatarController.class);
	
	/**
	 * 아바타 만들기 버튼을 눌렀을시
	 */
	@RequestMapping(value = "avatar", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		return "objectmaker/avatar";
	}
	
	
	
}
