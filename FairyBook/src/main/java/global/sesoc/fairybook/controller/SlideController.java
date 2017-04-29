package global.sesoc.fairybook.controller;

import java.util.ArrayList;

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
 * 스토리 감상을 위한 콘트롤러
 * 
 * @author 하성걸(2017.04.07 - ver1)
 *
 */

@Controller
@RequestMapping(value="slide")
public class SlideController {
	
	@Autowired
	SlideDAO dao;

	private static final Logger logger = LoggerFactory.getLogger(SlideController.class);
	
	/**
	 * 동화 감상을 누르면 내가 끝까지 진행한 동화들의 목록을 가져온다
	 * @param model 가져온 동화들을 담을 model
	 * @param session 아이디를 가져올 session
	 * @return slide/storyPlay.jsp 페이지로 이동
	 */
	@RequestMapping(value = "storyPlay", method = RequestMethod.GET)
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
	 * 실제로 슬라이드 쇼를 진행한다
	 */
	@RequestMapping(value = "storySlide", method = RequestMethod.POST)
	public String storySlide(int selectionNum, int storyNum, Model model) {
		ArrayList<Integer> slideList = null;
		slideList = dao.getSlide(selectionNum);
		model.addAttribute("slideList", slideList);
		model.addAttribute("selectionNum", selectionNum);
		model.addAttribute("storyNum", storyNum);
		return "main/storySlide";
	}
	
	/**
	 * 슬라이드 쇼가 끝났을 때 결과, 공유, 주문, PDF저장 할 수 있는 페이지로 이동한다
	 */
	@RequestMapping(value = "slideEnd", method = RequestMethod.POST)
	public String slideEnd(int selectionNum, int storyNum, Model model) {
		model.addAttribute("selectionNum", selectionNum);
		model.addAttribute("storyNum", storyNum);
		int lastScene = dao.getLastScene(selectionNum);
		model.addAttribute("lastScene", lastScene);
		return "main/slideEnd";
	}
}

