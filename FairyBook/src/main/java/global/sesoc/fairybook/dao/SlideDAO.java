package global.sesoc.fairybook.dao;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import global.sesoc.fairybook.mapper.AvatarMapper;
import global.sesoc.fairybook.mapper.SlideMapper;
import global.sesoc.fairybook.mapper.StoryMapper;
import global.sesoc.fairybook.vo.Fairytale;
import global.sesoc.fairybook.vo.MySelection;
import global.sesoc.fairybook.vo.Quiz;
import global.sesoc.fairybook.vo.Scene;

@Repository
public class SlideDAO {

	@Autowired
	SqlSession sqlSession;
	
	//동화 감상을 누르면 내가 끝까지 진행한 동화들의 목록을 가져온다
	public ArrayList<MySelection> getMyStoryList(String id){
		ArrayList<MySelection> myStoryList = null;
		SlideMapper mapper = sqlSession.getMapper(SlideMapper.class);
		myStoryList = mapper.getMyStoryList(id);
		return myStoryList;
	}
	
	
	public ArrayList<Integer> getSlide(int selectionNum){
		ArrayList<Integer> slideList = null;
		SlideMapper mapper = sqlSession.getMapper(SlideMapper.class); 
		return slideList;
	}
}
