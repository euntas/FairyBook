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
import global.sesoc.fairybook.vo.MySelection;
import global.sesoc.fairybook.vo.Quiz;
import global.sesoc.fairybook.vo.Scene;
import global.sesoc.fairybook.vo.SelectionDetail;
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
	
		//int storyNum = Integer.parseInt(request.getParameter("storyNum"));
		StoryMaker user = (StoryMaker) session.getAttribute("loginUser");
		int storyNum = (int) session.getAttribute("currentStoryNum");
		// 처음 나오는 페이지 번호
		int firstPageNum = 0;
		
		logger.debug("받아온 스토리 번호는 : {}" + storyNum);
		System.out.println("받아온 스토리 번호 : " + storyNum);
		
		// 디비에서 해당 동화의 기존 회차가 있는지 검색한다. 
		MySelection mySelection = null;
		mySelection = dao.getLatestMySelection(user.getId(), storyNum);
		System.out.println("가져온 회차 : " + mySelection);
		
		// 처음 시작하는 회차일 때
		if(mySelection == null){
			System.out.println("처음 회차");
			HashMap<String, Object> hm = new HashMap<>();
			hm.put("id", user.getId());
			hm.put("storyNum", storyNum);
			hm.put("finished", "N");
			
			dao.insertMySelection(hm);
			
			mySelection = dao.getLatestMySelection(user.getId(), storyNum);
			System.out.println("만든 회차 : " + mySelection);
		}
		// 기존 회차가 있을 때
		else{
			System.out.println("기존회차");
			firstPageNum = dao.getLatestSceneNum(mySelection.getSelectionNum());
			System.out.println("firstPageNum : " + firstPageNum);
		}
		
		session.setAttribute("myselectionNum", mySelection.getSelectionNum());
		
		// 처음 페이지 번호를 모델에 저장
		model.addAttribute("firstPageNum", firstPageNum);
		model.addAttribute("storyNo", storyNum);
		
		return "story/storyStart";
	}
	
	// 마지막 페이지일 때 이 메소드를 호출한다. myselection 수정.
	@ResponseBody 
	@RequestMapping(value = "storyEnd", method = RequestMethod.GET)
	public String storyEnd(Model model, HttpSession session) {
		int storyNum = (int) session.getAttribute("currentStoryNum");
		int selectionNum = (int) session.getAttribute("myselectionNum");
		StoryMaker user = (StoryMaker) session.getAttribute("loginUser");
		
		dao.updateFinished(selectionNum, user.getId(), storyNum);
		System.out.println("종료 저장함.");
		
		return "story/storyEndPage";
	}
	
	// 마지막 페이지일 경우, 종료 페이로 이동한다.
	@RequestMapping(value = "storyEndPage", method = RequestMethod.GET)
	public String storyEndPage(Model model, HttpSession session) {
		
		return "story/storyEnd";
	}
	
	@ResponseBody 
	@RequestMapping(value = "sceneLoading", method = RequestMethod.GET)
	public Scene sceneLoading(int storyNum, int sceneNum, Model model) {
		// 해당 씬을 가지고 온다.
		Scene scene = dao.getScene(storyNum, sceneNum); 
		System.out.println("가져온 씬: " + scene);
		
		return scene;
	}
	
	@ResponseBody 
	@RequestMapping(value = "quizLoading", method = RequestMethod.GET)
	public Quiz quizLoading(HttpSession session, int sceneNum, Model model) {
		int storyNum = (int) session.getAttribute("currentStoryNum");
		System.out.println("스토리넘버: " + storyNum + ", 씬넘버: " + sceneNum);
		Scene scene = dao.getScene(storyNum, sceneNum); 
		System.out.println("읽어온 씬: " + scene);

		Quiz quiz = null;
		
		// 해당 씬의 퀴즈를 가져온다 (퀴즈 번호가 -1일 경우 퀴즈가 없는 것으로 간주)
		if(scene.getQuizNum() != -1){
			quiz = dao.getQuiz(scene.getQuizNum());			
		}
		
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
		
		// 해당 씬 넘버가 selectionDetail 테이블에 있는지 조사
		SelectionDetail sdInDB = dao.getSelectionDetailBySceneNum(selectionNum, sceneNum);
		
		// 존재하지 않으면, 새로 생성
		if(sdInDB == null){
			System.out.println("생성!!!!!!!!!!");
			HashMap<String, Object> selection = new HashMap<>();
			selection.put("selectionNum", selectionNum);
			selection.put("sceneNum", sceneNum);
			
			result = dao.saveSD(selection);			
		}
		// 이미 존재하면, 업데이트
		else{
			System.out.println("업뎃!!!!!!!!!!");
			HashMap<String, Object> updateSD = new HashMap<>();
			updateSD.put("selectionnum", selectionNum);
			updateSD.put("sceneNum", sceneNum);
			updateSD.put("myAnswer", null);
			
			result = dao.updateSelectiondetail(updateSD);
		}
		
		
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
			return result;
		}
		
		@ResponseBody
		@RequestMapping(value="getAvatarText", method = RequestMethod.POST, produces="text/plain;charset=UTF-8")
		public String getAvatarText(HttpSession session, int currentSceneNum, Model model){
			int storyNum = (int) session.getAttribute("currentStoryNum");
			Scene currentScene = dao.getScene(storyNum, currentSceneNum);
			
			String avatarText = currentScene.getFBExplain();
			
			return avatarText;
		}
		
		// pageList 테이블에서 씬넘버에 해당하는 페이지 번호를 찾아온다.
		@ResponseBody
		@RequestMapping(value="getPageNum", method = RequestMethod.GET)
		public int getPageNum(HttpSession session, int currentSceneNum, Model model){
			
			int pageNum = dao.getPageNum(currentSceneNum);
			
			return pageNum;
		}
	
}
