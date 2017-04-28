package global.sesoc.fairybook;

import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import global.sesoc.fairybook.dao.SlideDAO;
import global.sesoc.fairybook.vo.MySelection;
import global.sesoc.fairybook.vo.StoryMaker;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {

	@Autowired
	SlideDAO dao;
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model, HttpSession session) {
		logger.info("Welcome home! The client locale is {}.", locale);

		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);

		String formattedDate = dateFormat.format(date);

		model.addAttribute("serverTime", formattedDate);
		
		StoryMaker user = (StoryMaker) session.getAttribute("loginUser");
		if(user==null){
			// 이제 여기다가 로긴 안했을때 처리
		}
		else{
			String id = user.getId();
			ArrayList<MySelection> myStoryList = null;
			myStoryList = dao.getMyStoryList(id);
			model.addAttribute("myStoryList", myStoryList);			
		}

		return "main/home";
	}

	/**
	 * 동화선택
	 * 
	 * @return main/storySelect.jsp
	 */
	@RequestMapping(value = "menu/storySelect", method = RequestMethod.GET)
	public String storySelect() {
		return "main/storySelect";
	}

	
	/**
	 * 동화 감상을 누르면 내가 끝까지 진행한 동화들의 목록을 가져온다
	 * @param model 가져온 동화들을 담을 model
	 * @param session 아이디를 가져올 session
	 * @return slide/storyPlay.jsp 페이지로 이동
	 */
	@RequestMapping(value = "menu/storyPlay", method = RequestMethod.GET)
	public String storyPlay(Model model, HttpSession session) {
		StoryMaker user = (StoryMaker) session.getAttribute("loginUser");
		if(user==null){
			return "redirect:../id/login";
		}
		String id = user.getId();
		ArrayList<MySelection> myStoryList = null;
		myStoryList = dao.getMyStoryList(id);
		model.addAttribute("myStoryList", myStoryList);
		return "main/storyPlay";
	}

	/**
	 * 동화 감상 슬라이드쇼 시작
	 * @param session
	 * @param selectionNum
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "menu/storySlide", method = RequestMethod.GET)
	public String storyStart(HttpSession session, int selectionNum, Model model) {
		ArrayList<Integer> slideList = null;
		slideList = dao.getSlide(selectionNum);
		model.addAttribute("slideList", slideList);
		return "main/storySlide";
	}
	
	
	/**
	 * 문제풀기
	 * 
	 * @return main/quizSolve.jsp
	 *//*
	@RequestMapping(value = "quiz/quizList", method = RequestMethod.GET)
	public String quizList() {
		return "quiz/quizList";
	}*/

	/**
	 * 내아이동화감상
	 * 
	 * @return main/myChildStory.jsp
	 */
	@RequestMapping(value = "menu/myChildStory", method = RequestMethod.GET)
	public String myChildStory(Model model, HttpSession session) {
		StoryMaker user = (StoryMaker) session.getAttribute("loginUser");
		if(user==null){
			return "redirect:../id/login";
		}
		String id = user.getId();
		ArrayList<MySelection> myStoryList = null;
		myStoryList = dao.getMyStoryList(id);
		model.addAttribute("myStoryList", myStoryList);
		return "main/myChildStory";
	}

	/**
	 * 상담요청결과
	 * 
	 * @return main/counselResult.jsp
	 */
	@RequestMapping(value = "menu/counselResult", method = RequestMethod.GET)
	public String counselResult() {
		return "main/counselResult";
	}

	/**
	 * 책만들기
	 * 
	 * @return main/makebook.jsp
	 */
	@RequestMapping(value = "menu/makebook", method = RequestMethod.GET)
	public String makebook() {
		return "main/makebook";
	}
	
	@RequestMapping(value = "util/snsTest", method = RequestMethod.GET)
	public String snsTest() {
		return "util/snsTest2";
	}
	
	@RequestMapping(value = "pageForData", method = RequestMethod.GET)
	public String pageForData() {
		return "pageForData";
	}
	
}

