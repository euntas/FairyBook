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
import org.springframework.web.bind.annotation.ResponseBody;
import global.sesoc.fairybook.dao.StoryDAO;
import global.sesoc.fairybook.vo.MySelection;
import global.sesoc.fairybook.vo.Quiz;
import global.sesoc.fairybook.vo.Scene;
import global.sesoc.fairybook.vo.SelectionDetail;
import global.sesoc.fairybook.vo.StoryMaker;

/**
 * QuizController
 * 
 * @author 이지나 3/20 scene에 맞는 문제 보여주기, 사용자가 선택한 selection항목 db에 저장하기 아이 회원으로 로그인
 *         되어 있을때만
 */
@Controller
@RequestMapping("quiz")
public class QuizController {

	@Autowired
	StoryDAO dao;

	private static final Logger logger = LoggerFactory.getLogger(QuizController.class);

	/**
	 * Quiz Print 씬에 맞는 문제 보여주기-Ajax
	 * 
	 * @param quizNum
	 */
	@ResponseBody
	@RequestMapping(value = "quizPrint", method = RequestMethod.GET)
	public void quizPrint(int quizNum) {
		logger.debug("{}번 퀴즈 불러오기", quizNum);

		// Quiz 테이블에서 quizNum의 Quiz객체 가져와서 jsp에 출력

	}

	@RequestMapping(value = "quizList", method = RequestMethod.GET)
	public String quizList() {
		return "quiz/quizList";
	}

	@RequestMapping(value = "quizSolve", method = RequestMethod.GET)
	public String quizSolve(HttpSession session, Model model, int storyNum) {

		session.setAttribute("currentStoryNum", storyNum);
		ArrayList<MySelection> selectionList = getFinishedSelectionList(session, model);
		model.addAttribute("selectionList", selectionList);

		return "quiz/quizSolve";
	}

	@ResponseBody
	@RequestMapping(value = "quiz", method = RequestMethod.GET)
	public ArrayList<Quiz> quiz(int selectionNum, HttpSession session, Model model) {

		int storynum = (int) session.getAttribute("currentStoryNum");
		ArrayList<SelectionDetail> getSelectionDetail = new ArrayList<>();

		getSelectionDetail = dao.getSelectionDetail(selectionNum);

		ArrayList<Scene> sceneList = new ArrayList<>();
		ArrayList<Quiz> quizList = new ArrayList<>();
		Quiz quiz = new Quiz();

		for (SelectionDetail selectionDetail : getSelectionDetail) {
			Scene getScene = dao.getScene(storynum, selectionDetail.getSceneNum());
			sceneList.add(getScene);
		}

		for (Scene scene : sceneList) {
			quiz = dao.getQuiz(scene.getQuizNum());
			if (scene.getQuizNum() != -1) {
				if (quiz.getAnswer() != -1) {
					quizList.add(quiz);
				}
			}
		}
		System.out.println(selectionNum + "        " + quizList);
		model.addAttribute("quizList", quizList);
		return quizList;
	}

	// 임시 보류
	/*
	 * @RequestMapping(value = "quizSolve", method = RequestMethod.GET) public
	 * String quizSolve(HttpSession session, Model model) {
	 * ArrayList<MySelection> selectionList = getFinishedSelectionList(session,
	 * model); ArrayList<Integer> getSelectionNum = new ArrayList<>();
	 * ArrayList<Integer> getStoryNum = new ArrayList<>();
	 * ArrayList<SelectionDetail> getSelectionDetail = new ArrayList<>();
	 * ArrayList<ArrayList<SelectionDetail>> getSelectionDetailList = new
	 * ArrayList<>();
	 * 
	 * for (MySelection mySelection : selectionList) {
	 * getSelectionNum.add(mySelection.getSelectionNum());
	 * getStoryNum.add(mySelection.getStoryNum()); for (Integer selectionNum :
	 * getSelectionNum) { getSelectionDetail =
	 * dao.getSelectionDetail(selectionNum);
	 * getSelectionDetailList.add(getSelectionDetail); } }
	 * 
	 * ArrayList<Scene>SceneList = new ArrayList<>(); Scene getScene = new
	 * Scene(); for (Integer storyNum : getStoryNum) { for
	 * (ArrayList<SelectionDetail> arrayList : getSelectionDetailList) {
	 * System.out.println(arrayList); for (SelectionDetail selectionDetail :
	 * arrayList) { getScene = dao.getScene(storyNum,
	 * selectionDetail.getSceneNum()); } } }
	 * 
	 * int quizNum = getScene.getQuizNum(); Quiz quiz = dao.getQuiz(quizNum);
	 * model.addAttribute("quiz", quiz); return "quiz/quizSolve"; }
	 */
	// 임시 보류

	/**
	 * Quiz Selection 사용자가 선택한 selection항목 db에 저장하기-Ajax
	 * 
	 * @param sceneNum
	 *            -
	 * @param selection
	 *            - jsp에서 받아온 선택지 int로 받아오기
	 */
	@ResponseBody
	@RequestMapping(value = "quizSelection", method = RequestMethod.POST)
	public void quizSelection(int sceneNum, int selection) {
		logger.debug("{}번 씬 문제의 답변: {}", sceneNum, selection);

		// sceneNum을 이용해서 storyNum찾기
		// storyNum과 ID를 이용해서 MySelection테이블의 selectionNum 찾기

		// SelectionDetail 테이블에서 sceneNum, selectionNum, selection 저장하기
		// insert into SELECTIONDETAIL (SCENENUM, SELECTIONNUM, SELECTION)
		// values (?,?,?);

	}

	/**
	 * 현재 사용자의 완료된 동화 목록을 불러온다.
	 * 
	 * @param session
	 * @param model
	 */
	@ResponseBody
	@RequestMapping(value = "getFinishedSelectionList", method = RequestMethod.POST)
	public ArrayList<MySelection> getFinishedSelectionList(HttpSession session, Model model) {
		StoryMaker user = (StoryMaker) session.getAttribute("loginUser");
		ArrayList<MySelection> selectionNumList = new ArrayList<>();
		selectionNumList = dao.getSelectionNumListById(user.getId());

		return selectionNumList;
	}

}
