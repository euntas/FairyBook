package global.sesoc.fairybook.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import global.sesoc.fairybook.mapper.AvatarMapper;
import global.sesoc.fairybook.mapper.StoryMapper;
import global.sesoc.fairybook.vo.Fairytale;
import global.sesoc.fairybook.vo.Quiz;
import global.sesoc.fairybook.vo.Scene;

@Repository
public class StoryDAO {

	@Autowired
	SqlSession sqlSession;
	
	public Quiz getQuiz(int quizNum){
		Quiz quiz = null;
		StoryMapper mapper = sqlSession.getMapper(StoryMapper.class); 
		quiz = mapper.getQuiz(quizNum);
		
		return quiz;
	}
	
	public Scene getScene(int storyNum, int sceneNum){
		Scene scene = null;
		StoryMapper mapper = sqlSession.getMapper(StoryMapper.class);
		
		HashMap<String, Integer> map = new HashMap<>();
		map.put("storyNum", storyNum);
		map.put("sceneNum", sceneNum);
		
		scene = mapper.getScene(map);
		
		return scene;
	}
	
	public int insertFairyTale(Fairytale fairytale){
		StoryMapper mapper = sqlSession.getMapper(StoryMapper.class);
		int result = mapper.insertFairytale(fairytale);
		return result;
	}
	
}
