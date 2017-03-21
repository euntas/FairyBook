package global.sesoc.fairybook.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * QuizController
 * @author 이지나 3/20
 * scene에 맞는 문제 보여주기, 사용자가 선택한 selection항목 db에 저장하기
 * 아이 회원으로 로그인 되어 있을때만
 */
@Controller
public class QuizController {

	private static final Logger logger = LoggerFactory.getLogger(QuizController.class);
	
	/**
	 * Quiz Print 씬에 맞는 문제 보여주기-Ajax
	 * @param quizNum
	 */
	@ResponseBody
	@RequestMapping(value="quizPrint", method=RequestMethod.GET)
	public void quizPrint(int quizNum){
		logger.debug("{}번 퀴즈 불러오기",quizNum);
		
		//Quiz 테이블에서  quizNum의  Quiz객체 가져와서 jsp에 출력
		
	}
	
	/**
	 * Quiz Selection 사용자가 선택한 selection항목 db에 저장하기-Ajax
	 * @param sceneNum - 
	 * @param selection - jsp에서 받아온 선택지 int로 받아오기
	 */
	@ResponseBody
	@RequestMapping(value="quizSelection", method=RequestMethod.POST)
	public void quizSelection(int sceneNum, int selection){
		logger.debug("{}번 씬 문제의 답변: {}",sceneNum, selection);

		//sceneNum을 이용해서 storyNum찾기
		//storyNum과 ID를 이용해서  MySelection테이블의 selectionNum 찾기
		
		//SelectionDetail 테이블에서 sceneNum, selectionNum, selection 저장하기
		//insert into SELECTIONDETAIL (SCENENUM, SELECTIONNUM, SELECTION) values (?,?,?);
		
	}
	
	
}
