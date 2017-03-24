package global.sesoc.fairybook.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.bind.annotation.ResponseBody;

import global.sesoc.fairybook.dao.IDDAO;
import global.sesoc.fairybook.util.FileService;
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
	final String uploadPath = "/boardfile"; // 파일 업로드 경로
	
	@RequestMapping(value = "join", method = RequestMethod.GET)
	public String join() {
		return "joinForm";
	}


	/**
	 * 아이디 중복검사
	 * @param id
	 * @return 아이디 사용가능 여부 메세지 리턴
	 */
	@ResponseBody
	@RequestMapping(value="idCheck", method=RequestMethod.POST,
					produces="application/json;charset=UTF-8")
	public String idCheck(String id){
		String message = null;
		
		StoryMaker c = dao.selectStoryMaker(id);
		if(c!=null){
			message = "false";
		}else{
			message = "true";
		}
		return message;
	}
	
	/**
	 * 아동 닉네임 중복 검사
	 * @param cNick
	 * @return 닉네임 사용가능 여부 메세지 리턴
	 */
	@ResponseBody
	@RequestMapping(value="cNickCheck", method=RequestMethod.POST,
					produces="application/json;charset=UTF-8")
	public String cNickCheck(String cNick){
		String message = null;
		
		StoryMaker c = dao.selectStoryMaker1(cNick);
		if(c!=null){
			message = "false";
		}else{
			message = "true";
		}
		return message;
	}
	
	/**
	 * 보호자 닉네임 중복 검사
	 * @param pNick
	 * @return 닉네임 사용가능 여부 메세지 리턴
	 */
	@ResponseBody
	@RequestMapping(value="pNickCheck", method=RequestMethod.POST,
					produces="application/json;charset=UTF-8")
	public String pNickCheck(String pNick){
		String message = null;
		
		StoryMaker c = dao.selectStoryMaker2(pNick);
		if(c!=null){
			message = "false";
		}else{
			message = "true";
		}
		return message;
	}

	@RequestMapping(value = "join", method = RequestMethod.POST)
	public String join(String cBirthYear, String cBirthMonth, String cBirthDate, 
			String phone1, String phone2, String phone3, StoryMaker maker
			, ArrayList<MultipartFile> upload, Model model) {
		logger.debug("가입데이터 : {}", maker);	
		//검증, DB저장
		if (upload.size() != 0) {
			for (MultipartFile file : upload) {
				String savedFile = FileService.saveFile(file, uploadPath);

				// 원래 파일명과 저장된 파일명을 board객체에 담아 DB에 저장
				maker.setOriginalProfile(file.getOriginalFilename());
				maker.setSavedProfile(savedFile);
			}
		}
		int result = 0;
		
		try{
		String cBirthday = cBirthYear+ "-" + cBirthMonth + "-" + cBirthDate;
		maker.setcBirth(cBirthday);
		String phone = phone1 + "-" + phone2 + "-" + phone3;
		maker.setPhone(phone);
		System.out.println(maker);
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
			session.setAttribute("loginUser", user);
			session.setAttribute("userType", "child");
			break;
		case 2:
			message = user.getpName()+"님 로그인!";
			//부모 로그인 성공시 id와 userType:parent 세션에 저장
			session.setAttribute("loginUser", user);
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
	public String logout(HttpSession session) {
		session.removeAttribute("loginUser");
		session.removeAttribute("userType");
		return "redirect:/";

	}
}
