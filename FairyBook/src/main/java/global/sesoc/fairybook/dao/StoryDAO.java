package global.sesoc.fairybook.dao;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import global.sesoc.fairybook.mapper.AvatarMapper;
import global.sesoc.fairybook.mapper.StoryMapper;
import global.sesoc.fairybook.vo.Fairytale;
import global.sesoc.fairybook.vo.MySelection;
import global.sesoc.fairybook.vo.Quiz;
import global.sesoc.fairybook.vo.Scene;
import global.sesoc.fairybook.vo.SelectionDetail;

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
	
	public int saveSD(HashMap<String, Object> selection){
		StoryMapper mapper = sqlSession.getMapper(StoryMapper.class);
		int result = mapper.saveSD(selection);
		return result;
	}
	
	public int insertMySelection(HashMap<String, Object> myselection){
		StoryMapper mapper = sqlSession.getMapper(StoryMapper.class);
		int result = mapper.insertMySelection(myselection);
		return result;
	}
	
	public int getSelectionNum(HashMap<String, Object> myselection){
		StoryMapper mapper = sqlSession.getMapper(StoryMapper.class);
		int result = mapper.getSelectionNum(myselection);
		return result;
	}
	
	public int updateSelectiondetail(HashMap<String, Object> updateSD) {
		StoryMapper mapper = sqlSession.getMapper(StoryMapper.class);
		int result = mapper.updateSelectiondetail(updateSD);
		return result;
	}
	
	public MySelection getLatestMySelection(String id, int storyNum){
		StoryMapper mapper = sqlSession.getMapper(StoryMapper.class);
		
		MySelection result = null;
		
		HashMap<String, Object> myinfo = new HashMap<>();
		myinfo.put("id", id);
		myinfo.put("storyNum", storyNum);
		
		result = mapper.getLatestMySelection(myinfo);
		
		return result;
	}
	
	public ArrayList<SelectionDetail> getSelectionDetail(int selectionNum){
		StoryMapper mapper = sqlSession.getMapper(StoryMapper.class);
		ArrayList<SelectionDetail> result = new ArrayList<>();
		result = mapper.getSelectionDetailAll(selectionNum);
		
		return result;
	}
	
	public int getLatestSceneNum(int selectionNum){
		StoryMapper mapper = sqlSession.getMapper(StoryMapper.class);
		ArrayList<SelectionDetail> sdlist = new ArrayList<>(); 
		sdlist = mapper.getSelectionDetailAll(selectionNum);
		
		// 디폴트 씬 번호 지정해둔다.
		int result = 0;
		
		System.out.println("리스트 사이즈 : " + sdlist.size());
		
		if(sdlist.size() != 0)
			result = (sdlist.get(sdlist.size()-1)).getSceneNum();
		
		return result;
	}
	
	public  SelectionDetail getSelectionDetailBySceneNum(int selectionNum, int sceneNum){
		StoryMapper mapper = sqlSession.getMapper(StoryMapper.class);
		SelectionDetail result = null;
		
		HashMap<String, Object> myinfo = new HashMap<>();
		myinfo.put("selectionNum", selectionNum);
		myinfo.put("sceneNum", sceneNum);
		
		result = mapper.getSelectionDetailBySceneNum(myinfo);
		
		return result;
	}
	
	public int updateFinished(int selectionNum, String id, int storyNum){
		StoryMapper mapper = sqlSession.getMapper(StoryMapper.class);
		int result = -1;
		
		HashMap<String, Object> myinfo = new HashMap<>();
		myinfo.put("selectionNum", selectionNum);
		myinfo.put("id", id);
		myinfo.put("storyNum", storyNum);
		
		result = mapper.updateFinished(myinfo);
		
		return result;
	}
	
	public int getPageNum(int sceneNum){
		StoryMapper mapper = sqlSession.getMapper(StoryMapper.class);
		int pageNum = -1;
		
		pageNum = mapper.getPageNum(sceneNum);
		
		return pageNum;
	}
	
	public SelectionDetail getSelectionDetailByPageNum(int selectionNum, int pageNum){
		StoryMapper mapper = sqlSession.getMapper(StoryMapper.class);
		SelectionDetail result = null;
		
		HashMap<String, Object> myinfo = new HashMap<>();
		myinfo.put("selectionNum", selectionNum);
		myinfo.put("pageNum", pageNum);
		
		result = mapper.getSelectionDetailByPageNum(myinfo);
		
		return result;
	}
	
	public int getSceneNumByPageNum(int storyNum, int pageNum){
		StoryMapper mapper = sqlSession.getMapper(StoryMapper.class);
		int sceneNum = -1;
		
		HashMap<String, Object> myinfo = new HashMap<>();
		myinfo.put("storyNum", storyNum);
		myinfo.put("pageNum", pageNum);
		
		sceneNum = mapper.getSceneNumByPageNum(myinfo);
		
		return sceneNum;
	}
	
	public ArrayList<Integer> getSelectionNumListById(String id){
		StoryMapper mapper = sqlSession.getMapper(StoryMapper.class);
		
		ArrayList<Integer> result = new ArrayList<>();
		result = mapper.getSelectionNumListById(id);
		
		return result;
	}
}
