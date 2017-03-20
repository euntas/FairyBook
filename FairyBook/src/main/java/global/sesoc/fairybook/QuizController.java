package global.sesoc.fairybook;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * QuizController
 * @author 이지나 3/20
 * scene에 맞는 퀴즈 불러오기, 아동이 선택한 퀴즈답 db에 저장하기
 */
@Controller
public class QuizController {

	private static final Logger logger = LoggerFactory.getLogger(QuizController.class);
	
	/**
	 * Quiz Print 퀴즈 불러오기-Ajax
	 * @param quizNum
	 */
	@ResponseBody
	@RequestMapping(value="quizPrint", method=RequestMethod.GET)
	public void quizPrint(int quizNum){
		logger.debug("{}번 퀴즈 불러옴",quizNum);
		
		//Quiz 테이블에서 quizNum조회. Quiz객체로 문제와 선택지 담아 jsp로 보내기
		
	}
	
	/**
	 * Quiz Selection 선택한 퀴즈 답 저장하기-Ajax
	 * @param sceneNum - 
	 * @param selection - jsp에서 선택지 순서대로 int값 number를 지정하고 선택된 값을 가져오기
	 */
	@ResponseBody
	@RequestMapping(value="quizSelection", method=RequestMethod.POST)
	public void quizSelection(int sceneNum, int selection){
		logger.debug("{}번 씬의 퀴즈 답: {}",sceneNum, selection);

		//sceneNum으로 storyNum찾기
		//storyNum과 ID를 가지고 MySelection테이블에서 selectionNum찾기
		
		//SelectionDetail 테이블에서 sceneNum, selectionNum, selection 저장
		//insert into SELECTIONDETAIL (SCENENUM, SELECTIONNUM, SELECTION) values (?,?,?);
		
	}
	
	
}
