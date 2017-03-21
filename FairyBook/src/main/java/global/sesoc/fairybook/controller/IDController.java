package global.sesoc.fairybook.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


import global.sesoc.fairybook.vo.StoryMaker;

/**
 *  회원가입 및 로그인 컨트롤러
 * @author 이한건 170320 ver.1
 *
 */

@Controller
public class IDController {

	private static final Logger logger = LoggerFactory.getLogger(IDController.class);
	
	
	@RequestMapping(value = "join", method = RequestMethod.GET)
	public String join() {
		return "joinForm";
	}

	@RequestMapping(value = "idCheck", method = RequestMethod.GET)
	public String idCheck() {
		return "idCheck";
	}

	@RequestMapping(value = "idCheck", method = RequestMethod.POST)
	public void idCheck(String id) {

	}

	@RequestMapping(value = "join", method = RequestMethod.POST)
	public void join(StoryMaker maker) {

	}

	@RequestMapping(value = "update", method = RequestMethod.GET)
	public String userUpdate() {

		return "updateForm";
	}

	@RequestMapping(value = "update", method = RequestMethod.POST)
	public void userUpdate(StoryMaker maker) {

	}

	@RequestMapping(value = "delete", method = RequestMethod.GET)
	public String userDelete(String id) {

		return "redirect:/";
	}

	@RequestMapping(value = "login", method = RequestMethod.GET)
	public String login() {
		return "customer/loginForm";
	}

	@RequestMapping(value = "login", method = RequestMethod.POST)
	public void login(String id, String pw, Model model, HttpSession session) {

	}

	@RequestMapping(value = "logout", method = RequestMethod.GET)
	public String logout() {

		return "redirect:/";

	}
}
