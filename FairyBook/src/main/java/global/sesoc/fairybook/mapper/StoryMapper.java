package global.sesoc.fairybook.mapper;

import java.util.HashMap;
import java.util.Map;

import global.sesoc.fairybook.vo.Fairytale;
import global.sesoc.fairybook.vo.Quiz;
import global.sesoc.fairybook.vo.Scene;

public interface StoryMapper {

	// 퀴즈 번호에 따른 퀴즈를 가져온다.
	public Quiz getQuiz(int quizNum);
	// 씬 번호와 스토리 번호에 따른 씬을 가져온다.
	public Scene getScene(Map map);
	// 동화를 생성한다.
	public int insertFairytale(Fairytale fairytale);
	//selectionDetail을 저장한다.
	public int saveSD(HashMap<String, Object> selection);
	//myselection을 저장한다.
	public int insertMySelection(HashMap<String, Object> myselection);

}
