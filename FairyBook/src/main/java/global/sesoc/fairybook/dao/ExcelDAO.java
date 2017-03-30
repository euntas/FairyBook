package global.sesoc.fairybook.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import global.sesoc.fairybook.mapper.AvatarMapper;
import global.sesoc.fairybook.mapper.BoardMapper;
import global.sesoc.fairybook.mapper.ExcelMapper;
import global.sesoc.fairybook.mapper.StoryMapper;
import global.sesoc.fairybook.vo.Fairytale;
import global.sesoc.fairybook.vo.PBoard;
import global.sesoc.fairybook.vo.Quiz;
import global.sesoc.fairybook.vo.Scene;

@Repository
public class ExcelDAO {

	@Autowired
	SqlSession sqlSession;
	
	public int insertQuizTable(ArrayList<Quiz> quizList){
		
		ExcelMapper mapper = sqlSession.getMapper(ExcelMapper.class);
		
		int result = -1;
		
		for (Quiz quiz : quizList) {
			result = mapper.insertQuizTable(quiz);
		}
		
		return result;
	}
	
	public void clearQuizTable(){
		ExcelMapper mapper = sqlSession.getMapper(ExcelMapper.class);
		mapper.clearQuizTable();
	}
	
	public int insertSceneTable(ArrayList<Scene> sceneList){
		
		ExcelMapper mapper = sqlSession.getMapper(ExcelMapper.class);

		int result = -1;
		
		for (Scene scene : sceneList) {
			result = mapper.insertSceneTable(scene);
		}
		
		return result;
	}
	
	public void clearSceneTable(){
		ExcelMapper mapper = sqlSession.getMapper(ExcelMapper.class);
		mapper.clearSceneTable();
	}
}
