package global.sesoc.fairybook.dao;

import java.util.ArrayList;

import global.sesoc.fairybook.vo.StoryMaker;


/**
 * 	회원정보 및 로그인 관련 매퍼 인터페이스
 * @author 이한건 170322 ver.1
 *
 */

public interface IDMapper {

	//계정생성(회원가입)
	public int insert(StoryMaker maker);
	
	//특정회원정보꺼내오기
	public StoryMaker selectStoryMaker(String id);
	
	//전체회원정보꺼내오기
	public ArrayList<StoryMaker> infoAll();
	
	//계정삭제
	public int delete(String id);
	
	//계정정보 수정
	public int update(StoryMaker maker);
}
