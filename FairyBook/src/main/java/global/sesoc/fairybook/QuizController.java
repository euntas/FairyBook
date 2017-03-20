package global.sesoc.fairybook;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * QuizController
 * @author ������ 3/20
 * scene�� �´� ���� �ҷ�����, �Ƶ��� ������ ����� db�� �����ϱ�
 */
@Controller
public class QuizController {

	private static final Logger logger = LoggerFactory.getLogger(QuizController.class);
	
	/**
	 * Quiz Print ���� �ҷ�����-Ajax
	 * @param quizNum
	 */
	@ResponseBody
	@RequestMapping(value="quizPrint", method=RequestMethod.GET)
	public void quizPrint(int quizNum){
		logger.debug("{}�� ���� �ҷ���",quizNum);
		
		//Quiz ���̺��� quizNum��ȸ. Quiz��ü�� ������ ������ ��� jsp�� ������
		
	}
	
	/**
	 * Quiz Selection ������ ���� �� �����ϱ�-Ajax
	 * @param sceneNum - 
	 * @param selection - jsp���� ������ ������� int�� number�� �����ϰ� ���õ� ���� ��������
	 */
	@ResponseBody
	@RequestMapping(value="quizSelection", method=RequestMethod.POST)
	public void quizSelection(int sceneNum, int selection){
		logger.debug("{}�� ���� ���� ��: {}",sceneNum, selection);

		//sceneNum���� storyNumã��
		//storyNum�� ID�� ������ MySelection���̺��� selectionNumã��
		
		//SelectionDetail ���̺��� sceneNum, selectionNum, selection ����
		//insert into SELECTIONDETAIL (SCENENUM, SELECTIONNUM, SELECTION) values (?,?,?);
		
	}
	
	
}
