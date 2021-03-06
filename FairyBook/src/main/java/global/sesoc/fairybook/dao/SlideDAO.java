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
	
	//다른 아이의 동화를 누르면 다른 아이가 끝까지 진행한 동화들의 목록을 가져온다
		public ArrayList<MySelection> getYourStoryList(String id){
			ArrayList<MySelection> yourStoryList = null;
			SlideMapper mapper = sqlSession.getMapper(SlideMapper.class);
			yourStoryList = mapper.getYourStoryList(id);
			return yourStoryList;
		}
	
	// 해당 셀렉션넘의 씬들을 모두 가져온다
	public ArrayList<Integer> getSlide(int selectionNum){
		ArrayList<Integer> slideList = null;
		SlideMapper mapper = sqlSession.getMapper(SlideMapper.class);
		slideList = mapper.getSlide(selectionNum);
		return slideList;
	}
	
	// 해당 셀렉션넘의 마지막 씬을 가져온다
	public HashMap<String, Object> getLastScene(int selectionNum){
		HashMap<String, Object> lastScene = new HashMap<>();
		SlideMapper mapper = sqlSession.getMapper(SlideMapper.class);
		lastScene = mapper.getLastScene(selectionNum);
		return lastScene;
	}
}
