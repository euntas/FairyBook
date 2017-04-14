package global.sesoc.fairybook.mapper;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import global.sesoc.fairybook.vo.Fairytale;
import global.sesoc.fairybook.vo.MySelection;
import global.sesoc.fairybook.vo.Quiz;
import global.sesoc.fairybook.vo.Scene;
import global.sesoc.fairybook.vo.SelectionDetail;

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
	
	//selectionNum을 가져온다.
	public int getSelectionNum(HashMap<String, Object> myselection);
	
	//selectionDEtail을 업데이트한다.
	public int updateSelectiondetail(HashMap<String, Object> updateSD);
	
	// 사용자가 선택한 동화가 처음 시작인지 진행중인지 판단한다. 만일 진행중이면 해당 객체를 가져온다.
	public MySelection getLatestMySelection(HashMap<String, Object> myinfo);
	
	// selectionDetail을 가져온다.
	public ArrayList<SelectionDetail> getSelectionDetailAll(int selectionNum);
	
	// selectionDetail 한 항목을 가져온다.
	public  SelectionDetail getSelectionDetailBySceneNum(HashMap<String, Object> myinfo);
	
	// 종료 업데이트
	public int updateFinished(HashMap<String, Object> myinfo);
	
	// 씬넘버를 주어 해당 페이지 번호를 가져온다
	public int getPageNum(int sceneNum);
	
	// selectionDetail 한 항목을 가져온다. pagenum 이용
	public SelectionDetail getSelectionDetailByPageNum(HashMap<String, Object> myinfo);
	
	// sceneNum 을 가져온다. storyNum과 pageNum 이용
	public int getSceneNumByPageNum(HashMap<String, Object> myinfo);
	
	// 한 사용자의 selectionNum 리스트를 전부 가져온다.(완료된 동화 회차만 해당)
	public ArrayList<Integer> getSelectionNumListById(String id);

}
