package global.sesoc.fairybook.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import global.sesoc.fairybook.dao.AvatarDAO;
import global.sesoc.fairybook.dao.StoryDAO;
import global.sesoc.fairybook.util.PoiForData;
import global.sesoc.fairybook.vo.Fairytale;
import global.sesoc.fairybook.vo.Item;
import global.sesoc.fairybook.vo.Quiz;
import global.sesoc.fairybook.vo.Scene;
import global.sesoc.fairybook.vo.StoryMaker;

/**
 * 스토리 진행을 위한 콘트롤러
 * 
 * @author 이은지(2017.03.20 - ver1)
 *
 */

@Controller
@RequestMapping(value="story")
public class StoryController {
	
	@Autowired
	StoryDAO dao;

	private static final Logger logger = LoggerFactory.getLogger(StoryController.class);
	
	@RequestMapping(value = "storyStart", method = RequestMethod.GET)
	public String storyStart(HttpServletRequest request, Model model, HttpSession session) {
	
		int storyNum = Integer.parseInt(request.getParameter("storyNum"));
		logger.debug("반아온 스토리 번호는 : {}" + storyNum);
		System.out.println("받아온 스토리 번호 : " + storyNum);
		// 현재 진행하고 있는 스토리 번호를 세션에 저장한다.
		//session.setAttribute("currentStoryNum", storyNum);
		
		return "story/storyStart";
	}
	
	@ResponseBody 
	@RequestMapping(value = "sceneLoading", method = RequestMethod.GET)
	public Scene sceneLoading(int storyNum, int sceneNum, Model model) {
		// 해당 씬을 가지고 온다.
		Scene scene = dao.getScene(storyNum, sceneNum); 
		
		return scene;
	}
	
	@ResponseBody 
	@RequestMapping(value = "quizLoading", method = RequestMethod.GET)
	public Quiz quizLoading(int storyNum, int sceneNum, Model model) {
		Scene scene = dao.getScene(storyNum, sceneNum); 
		// 해당 씬의 퀴즈를 가져온다
		Quiz quiz = dao.getQuiz(scene.getQuizNum());
		
		return quiz;
	}
	
	@ResponseBody 
	@RequestMapping(value = "quizValidCheck", method = RequestMethod.GET)
	public int quizValidCheck(int storyNum, int sceneNum, Model model) {
		// 퀴즈를 가지고 있으면 1 반환, 없으면 0 반환
		int check = 0;
		
		Scene scene = dao.getScene(storyNum, sceneNum);
		
		// 해당 씬이 퀴즈를 가지고 있는지 검사. (퀴즈가 없는 경우 퀴즈 번호가 -1이다.) 
		if(scene.getQuizNum() == -1){
			check = 0;
		}
		
		else{
			check = 1;
		}
		System.out.println("체크 : " + check);
		return check;
	}
	
	@RequestMapping(value = "saveItem", method = RequestMethod.GET)
	public void saveItem(int selectionNum, Item newItem) {
	
	}
	
	@RequestMapping(value = "saveSelection", method = RequestMethod.GET)
	public void saveSelection() {
	
	}
	
	// 현재 씬 번호와 선택지 번호에 따른 다음 씬의 페이지 번호를 알아낸다.
	@ResponseBody 
	@RequestMapping(value = "getNextSceneNum", method = RequestMethod.GET)
	public int getSceneNum(int currentSceneNum, int answerNum, HttpSession session) {
		// 현재 진행중인 동화 번호
		int storyNum = (int) session.getAttribute("currentStoryNum");
		
		// 현재 씬을 가져온다.
		Scene currentScene = dao.getScene(storyNum, currentSceneNum);
		
		// 다음 씬 번호를 가져온다. (없으면 -1)
		int nextSceneNum = -1;
		
		if(answerNum == 1)
			nextSceneNum = currentScene.getNextScene1();
		else if(answerNum == 2)
			nextSceneNum = currentScene.getNextScene2();
		else if(answerNum == 3)
			nextSceneNum = currentScene.getNextScene3();
		else if(answerNum == 4)
			nextSceneNum = currentScene.getNextScene4();
		
		return nextSceneNum;
	}
	
	// ----- fairytale 테이블에 저장하기 테스트용
	@ResponseBody 
	@RequestMapping(value = "saveft", method = RequestMethod.GET)
	public int saveft() {
		int result = -1;
		
		Fairytale ft = new Fairytale("테스트용동화입니다.");
		result = dao.insertFairyTale(ft);
		
		return result;
	}
	
	//selectionDetail 테이블 저장 테스트용
	@ResponseBody 
	@RequestMapping(value = "saveSD", method = RequestMethod.GET)
	public int saveSD(HttpSession session, int sceneNum) {
		int result = -1;
		int selectionNum = (int) session.getAttribute("myselectionNum");
		HashMap<String, Object> selection = new HashMap<>();
		selection.put("selectionNum", selectionNum);
		selection.put("sceneNum", sceneNum);
		
		result = dao.saveSD(selection);
		
		return result;
	}
	
	//myselection 테이블 저장 테스트용
		@ResponseBody 
		@RequestMapping(value = "insertMySelection", method = RequestMethod.GET)
		public int insertMySelection(HttpSession session) {
			int result = -1;
			StoryMaker loginUser = (StoryMaker) session.getAttribute("loginUser");
			String id = loginUser.getId();
			int storyNum = (int) session.getAttribute("currentStoryNum");
			HashMap<String, Object> myselection = new HashMap<>();
			myselection.put("selectionNum", 104);
			myselection.put("id", id);
			myselection.put("storyNum", storyNum);
			myselection.put("finished", "N");
			result = dao.insertMySelection(myselection);
			return result;
		}
		
		//타이틀 페이지로 이동
		@RequestMapping(value = "storyTitle", method = RequestMethod.GET)
		public String goTitle(int storyNum, Model model, HttpSession session) {
//			model.addAttribute("storyNum", storyNum);
			session.setAttribute("currentStoryNum", storyNum);

			return "story/storyTitle";
		}
		
		
		@ResponseBody 
		@RequestMapping(value = "getSelectionNum", method = RequestMethod.GET)
		public int getSelectionNum(HttpSession session) {
			int result = -1;
			StoryMaker loginUser = (StoryMaker) session.getAttribute("loginUser");
			int storyNum = (int) session.getAttribute("currentStoryNum");
			String id = loginUser.getId();
			HashMap<String, Object> myselection = new HashMap<>();
			myselection.put("id", id);
			myselection.put("storyNum", storyNum);
			myselection.put("finished", "N");
			result = dao.getSelectionNum(myselection);
			session.setAttribute("myselectionNum", result);
			return result;
		}
		
		@ResponseBody 
		@RequestMapping(value = "updateSelectiondetail", method = RequestMethod.GET)
		public int updateSelectiondetail(HttpSession session, int sceneNum, int answerNum) {
			int result = -1;
			int selectionnum = (int) session.getAttribute("myselectionNum");
			HashMap<String, Object> updateSD = new HashMap<>();
			updateSD.put("selectionnum", selectionnum);
			updateSD.put("sceneNum", sceneNum);
			updateSD.put("myAnswer", answerNum);
			result=dao.updateSelectiondetail(updateSD);
			System.out.println("aaaaaaaaaaaaaaaaaaaa" + result);
			return result;
		}
	
}
