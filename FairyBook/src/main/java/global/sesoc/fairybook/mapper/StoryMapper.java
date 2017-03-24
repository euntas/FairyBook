package global.sesoc.fairybook.mapper;

import java.util.Map;

import global.sesoc.fairybook.vo.Quiz;
import global.sesoc.fairybook.vo.Scene;

public interface StoryMapper {

	public Quiz getQuiz(int quizNum);
	public Scene getScene(Map map);
}
