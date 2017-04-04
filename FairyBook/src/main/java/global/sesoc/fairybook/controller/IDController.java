package global.sesoc.fairybook.controller;

import java.util.ArrayList;
import java.util.Iterator;

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
import org.springframework.web.bind.support.SessionStatus;

import global.sesoc.fairybook.dao.IDDAO;
import global.sesoc.fairybook.util.FileService;
import global.sesoc.fairybook.vo.StoryMaker;

/**
 *  회원가입 및 로그인 컨트롤러
 * @author 이한건 170320 ver.1
 *
 */

@Controller
@RequestMapping(value="id")
public class IDController {
	@Autowired
	IDDAO dao;
	
	private static final Logger logger = LoggerFactory.getLogger(IDController.class);
	final String uploadPath = "/boardfile"; // 파일 업로드 경로
	
	
	/**
	 * 회원가입 버튼 클릭시
	 * @param model
	 * @return 조인폼으로 이동!
	 */
	@RequestMapping(value = "join", method = RequestMethod.GET)
	public String join(Model model) {
		StoryMaker maker = new StoryMaker();
		model.addAttribute("storymaker", maker); 
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
	
	/**
	 * 회원가입
	 * @param maker
	 * @return 가입이 완료되면 가입완료창이, 가입실패시 가입실패 경고창을 띄우고 조인폼 지속적으로 보여줌
	 */
	@RequestMapping(value = "join", method = RequestMethod.POST)
	public String join(String cBirthYear, String cBirthMonth, String cBirthDate, 
			String phone1, String phone2, String phone3, 
			String email, String email2,
			@ModelAttribute("storymaker") StoryMaker maker
			, MultipartFile upload, Model model) {
		logger.debug("가입데이터 : {}", maker);	
		//검증, DB저장
		if (!upload.getOriginalFilename().equals("")) {
			String savedFile = FileService.saveFile(upload, uploadPath);

			// 원래 파일명과 저장된 파일명을 board객체에 담아 DB에 저장
			maker.setOriginalProfile(upload.getOriginalFilename());
			maker.setSavedProfile(savedFile);
		}
		int result = 0;
		
		try{
		String cBirthday = cBirthYear+ "-" + cBirthMonth + "-" + cBirthDate;
		maker.setcBirth(cBirthday);
		String phone = phone1 + "-" + phone2 + "-" + phone3;
		maker.setPhone(phone);
		String fullmail = email + "@" + email2;
		maker.setEmail(fullmail);
		System.out.println(maker);
		model.addAttribute("storymaker", maker); 
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
	
	/**
	 * 가입완료창
	 * @param maker
	 * @param status
	 * @param model
	 * @return 가입완료시 가입성공 메세지를 보여줌
	 */
	@RequestMapping(value="joinComplete", method=RequestMethod.GET)
	public String joinComplete(
			@ModelAttribute("storymaker") StoryMaker maker
			, SessionStatus status
			, Model model){
		logger.info("maker:{}",maker);
		model.addAttribute("joinedid", maker.getId());
		status.setComplete();
		return "joinComplete";
	}
	
	/**
	 * 회원정보창
	 * @param session
	 * @return 로그인이 된 경우 회원정보를 보여주고 비정상적으로 접근시 로그인폼으로 강제 이동
	 */
	@RequestMapping(value = "userInfo", method = RequestMethod.GET)
	public String userInfo(HttpSession session) {
		StoryMaker user = (StoryMaker)session.getAttribute("loginUser");
		
		if(user!=null){
		session.setAttribute("info", user);
		
		
		return "userInfo";
		}else{
			return "loginForm";
		}
	}

	
	/**
	 * 수정하기버튼 클릭시
	 * @param session
	 * @return 수정폼으로 이동, 역시 비정상적접근시 로그인폼으로 강제이동 
	 */
	@RequestMapping(value = "update", method = RequestMethod.GET)
	public String userUpdate(HttpSession session) {
		StoryMaker user = (StoryMaker)session.getAttribute("info");
		if(user!=null){
		session.setAttribute("update", user);
		return "updateForm";
		}else{
			return "loginForm";
		}
	}
	
	/**
	 * 회원 정보 수정
	 * @param phone1
	 * @param phone2
	 * @param phone3
	 * @param email
	 * @param email2
	 * @param maker
	 * @param upload
	 * @param model
	 * @param session
	 * @return 수정완료시 회원정보창에 수정된 정보를 보여줌, 오류발생시 메세지 띄우고 수정폼에 잔류
	 */
	@RequestMapping(value = "update", method = RequestMethod.POST)
	public String userUpdate(
			String phone1, String phone2, String phone3, 
			String email, String email2,
			StoryMaker maker
			, MultipartFile upload
			,Model model
			,HttpSession session) {
		logger.info("birth:{}",maker);
		
		if (!upload.getOriginalFilename().equals("")) {
			String savedFile = FileService.saveFile(upload, uploadPath);

			// 원래 파일명과 저장된 파일명을 board객체에 담아 DB에 저장
			maker.setOriginalProfile(upload.getOriginalFilename());
			maker.setSavedProfile(savedFile);
		}
		int result = 0;
		try{
		String phone = phone1 + "-" + phone2 + "-" + phone3;
		maker.setPhone(phone);
		String fullmail = email + "@" + email2;
		
		maker.setEmail(fullmail);
		
		result=dao.update(maker);
		}catch(Exception e){
			e.printStackTrace();
		}
		if(result == 0){
			model.addAttribute("errorMsg", "수정 실패");
			return "updateForm";
		}
		session.removeAttribute("info");
		logger.info("update:{}",maker);
		session.setAttribute("loginUser", maker);
		return "redirect:userInfo";
	}
	
	/**
	 * 회원 삭제
	 * @param model
	 * @param session
	 * @return 삭제시 삭제완료창 보여줌
	 */
	@RequestMapping(value = "delete", method = RequestMethod.GET)
	public String userDelete(Model model, HttpSession session) {
		StoryMaker maker = (StoryMaker)session.getAttribute("loginUser");
		String id = maker.getId();
		int result = 0;
		result = dao.delete(id);
		if(result == 0){
			model.addAttribute("errorMsg", "삭제 실패");
			return "userInfo";
		}
		
		return "redirect:deleteComplete";
	}
	
	/**
	 * 삭제완료창
	 * @param session
	 * @return 삭제완료창
	 */
	@RequestMapping(value="deleteComplete", method=RequestMethod.GET)
	public String deleteComplete(HttpSession session){
		session.invalidate();
		return "deleteComplete";
	}
	
	/**
	 * 로그인버튼 클릭시
	 * @return 로그인폼 보여준다
	 */
	@RequestMapping(value = "login", method = RequestMethod.GET)
	public String login() {
		return "loginForm";
	}
	
	/**
	 * 아이디와 비밀번호를 입력받아 로그인 한다.
	 * @param id
	 * @param pw
	 * @param session
	 * @return 유저타입에 따라 로그인한다.
	 */
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
	
	/**
	 * 로그아웃
	 * @param session
	 * @return 세션 정보 삭제 후 로그아웃하고 메인화면으로 간다.
	 */
	@RequestMapping(value = "logout", method = RequestMethod.GET)
	public String logout(HttpSession session) {
		session.removeAttribute("loginUser");
		session.removeAttribute("userType");
		return "redirect:/";

	}
}
