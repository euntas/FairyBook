package global.sesoc.fairybook.mapper;

import java.util.ArrayList;

import global.sesoc.fairybook.vo.MySelection;

public interface SlideMapper {

	//동화 감상을 누르면 내가 끝까지 진행한 동화들의 목록을 가져온다
	public ArrayList<MySelection> getMyStoryList(String id);
	
	public ArrayList<Integer> getSlide(int selectionNum);

	
}
