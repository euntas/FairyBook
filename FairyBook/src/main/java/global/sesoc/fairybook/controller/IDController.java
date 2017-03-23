package global.sesoc.fairybook.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import global.sesoc.fairybook.dao.IDDAO;
import global.sesoc.fairybook.vo.StoryMaker;

/**
 *  회원가입 및 로그인 컨트롤러
 * @author 이한건 170320 ver.1
 *
 */

@Controller
public class IDController {
	@Autowired
	IDDAO dao;
	
	private static final Logger logger = LoggerFactory.getLogger(IDController.class);
	
	
	@RequestMapping(value = "join", method = RequestMethod.GET)
	public String join() {
		return "joinForm";
	}

	@RequestMapping(value="idCheck", method=RequestMethod.GET)
	public String idCheck(Model model){
		
		return "idCheck";
	}
	
	@RequestMapping(value="idCheck", method=RequestMethod.POST)
	public String idCheck(String searchId, Model model){
		
		
		StoryMaker c = dao.selectStoryMaker(searchId);
		boolean search = true;
		model.addAttribute("checkedGuy", c);
		model.addAttribute("search", search);
		model.addAttribute("whatda", searchId);
		return "idCheck";
	}
	
	@RequestMapping(value="cNickCheck", method=RequestMethod.GET)
	public String cNickCheck(Model model){
		
		return "cNickCheck";
	}
	
	@RequestMapping(value="cNickCheck", method=RequestMethod.POST)
	public String cNickCheck(String searchcNick, Model model){
		
		
		StoryMaker c = dao.selectStoryMaker(searchcNick);
		boolean search = true;
		model.addAttribute("checkedGuy", c);
		model.addAttribute("search", search);
		model.addAttribute("whatda", searchcNick);
		return "cNickCheck";
	}
	
	@RequestMapping(value="pNickCheck", method=RequestMethod.GET)
	public String pNickCheck(Model model){
		
		return "pNickCheck";
	}
	
	@RequestMapping(value="pNickCheck", method=RequestMethod.POST)
	public String pNickCheck(String searchpNick, Model model){
		
		
		StoryMaker c = dao.selectStoryMaker(searchpNick);
		boolean search = true;
		model.addAttribute("checkedGuy", c);
		model.addAttribute("search", search);
		model.addAttribute("whatda", searchpNick);
		return "pNickCheck";
	}

	@RequestMapping(value = "join", method = RequestMethod.POST)
	public String join(StoryMaker maker
			, Model model) {
		logger.debug("가입데이터 : {}", maker);	
		//검증, DB저장
		int result = 0;
		try{
		 result = dao.insert(maker);
		}catch (Exception e){
			e.printStackTrace();
		}
		if(result == 0){
			model.addAttribute("errorMsg", "가입 실패");
			return "joinForm";
		}
		return "redirect:joinComplete";
		
	}
	
	@RequestMapping(value="joinComplete", method=RequestMethod.GET)
	public String joinComplete(
			@ModelAttribute("storymaker") StoryMaker maker
			){
		
		return "joinComplete";
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
		return "loginForm";
	}

	@ResponseBody
	@RequestMapping(value = "login", method = RequestMethod.POST,
			produces="application/json;charset=UTF-8")
	public String login(String id, String pw, HttpSession session) {
		String message = "";
		logger.debug("ID: {}, PW: {}",id,pw);
		StoryMaker user = dao.findID(id);
		int result = dao.login(id, pw);
		//어린이 로그인 1, 부모로그인 2, ID없음 3, PW불일치 4
		switch (result) {
		case 1:
			message = user.getcName()+"님 로그인!";
			//아이 로그인 성공시 id와 userType:child 세션에 저장
			session.setAttribute("id", user.getId());
			session.setAttribute("userType", "child");
			break;
		case 2:
			message = user.getpName()+"님 로그인!";
			//부모 로그인 성공시 id와 userType:parent 세션에 저장
			session.setAttribute("id", user.getId());
			session.setAttribute("userType", "parent");
			break;
		case 3:
			message = "존재하지 않는 아이디입니다.";
			break;
		case 4:
			message = "일치하지 않는 비밀번호입니다.";
			break;
		}
		return message;
	}

	@RequestMapping(value = "logout", method = RequestMethod.GET)
	public String logout() {

		return "redirect:/";

	}
}
