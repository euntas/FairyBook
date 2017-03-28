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
		int result = mapper.insertQuizTable(quizList);
		
		return result;
	}
	
	public void clearQuizTable(){
		System.out.println("클리어 퀴즈 테이블 안에 들어옴");
		ExcelMapper mapper = sqlSession.getMapper(ExcelMapper.class);
		mapper.clearQuizTable();
	}
}
