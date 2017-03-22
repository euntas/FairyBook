package global.sesoc.fairybook.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import global.sesoc.fairybook.vo.StoryMaker;

/**
 * 	회원정보 및 로그인 관련 디에이오
 * @author 이한건 170322 ver.1
 *
 */

public class IDDAO {
	@Autowired
	SqlSession sqlSession;
	
	/**
	 * 회원정보저장
	 * @param customer 사용자가 입력한 개인정보
	 * @return 저장성공은 1, 실패는 0
	 */
	public int insert(StoryMaker maker){
		IDMapper mapper = sqlSession.getMapper(IDMapper.class);
		int result = mapper.insert(maker);
		return result;
	}
	
	public StoryMaker selectStoryMaker(String id){
		IDMapper mapper = sqlSession.getMapper(IDMapper.class);
		StoryMaker maker = mapper.selectStoryMaker(id);
		return maker;
	}
	
	public ArrayList<StoryMaker> infoAll(){
		IDMapper mapper = sqlSession.getMapper(IDMapper.class);
		ArrayList<StoryMaker> allUser = mapper.infoAll();
		return allUser;
	};
	
	public int delete(String id){
		IDMapper mapper = sqlSession.getMapper(IDMapper.class);
		int result = mapper.delete(id);
		return result;
	};
	
	public int update(StoryMaker maker){
		IDMapper mapper = sqlSession.getMapper(IDMapper.class);
		int result = mapper.update(maker);
		return result;
	};
	
	
	
	
}
