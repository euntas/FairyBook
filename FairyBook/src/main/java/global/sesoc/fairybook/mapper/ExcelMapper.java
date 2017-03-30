package global.sesoc.fairybook.mapper;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import global.sesoc.fairybook.vo.Fairytale;
import global.sesoc.fairybook.vo.Quiz;
import global.sesoc.fairybook.vo.Scene;

public interface ExcelMapper {

	public void clearQuizTable();
	
	public int insertQuizTable(Quiz quizList);
	
	public void clearSceneTable();
	
	public int insertSceneTable(Scene sceneList);
}
