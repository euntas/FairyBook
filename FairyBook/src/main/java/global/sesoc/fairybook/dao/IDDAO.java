package global.sesoc.fairybook.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import global.sesoc.fairybook.mapper.IDMapper;
import global.sesoc.fairybook.vo.StoryMaker;

/**
 * 	회원정보 및 로그인 관련 디에이오
 * @author 이한건 170322 ver.1
 *
 */
@Repository
public class IDDAO {
	@Autowired
	SqlSession sqlSession;
	
	/**
	 * 회원정보저장
	 * @param maker 사용자가 입력한 개인정보
	 * @return 저장성공은 1, 실패는 0
	 */
	public int insert(StoryMaker maker){
		System.out.println("DAO: "+maker);
		IDMapper mapper = sqlSession.getMapper(IDMapper.class);
		int result = mapper.insert(maker);
		return result;
	}
	
	/**
	 * 특정회원정보 선택
	 * @param id 검색할 아이디
	 * @return 검색한 회원의 회원정보
	 */
	public StoryMaker selectStoryMaker(String id){
		IDMapper mapper = sqlSession.getMapper(IDMapper.class);
		StoryMaker maker = mapper.selectStoryMaker(id);
		return maker;
	}
	
	public StoryMaker selectStoryMaker1(String cNick){
		IDMapper mapper = sqlSession.getMapper(IDMapper.class);
		StoryMaker maker = mapper.selectStoryMaker1(cNick);
		return maker;
	}
	
	public StoryMaker selectStoryMaker2(String pNick){
		IDMapper mapper = sqlSession.getMapper(IDMapper.class);
		StoryMaker maker = mapper.selectStoryMaker2(pNick);
		return maker;
	}
	
	/**
	 * 전체회원정보 열람
	 * @return 전체회원정보
	 */
	public ArrayList<StoryMaker> infoAll(){
		IDMapper mapper = sqlSession.getMapper(IDMapper.class);
		ArrayList<StoryMaker> allUser = mapper.infoAll();
		return allUser;
	}

	/**
	 * 회원정보 삭제
	 * @param id 삭제할 회원의 계정
	 * @return 삭제 성공은 1, 실패는 0
	 */
	public int delete(String id){
		IDMapper mapper = sqlSession.getMapper(IDMapper.class);
		int result = mapper.delete(id);
		return result;
	}
	
	/**
	 * 회원정보 수정
	 * @param maker 기존내역에서 수정할 정보
	 * @return 수정 성공은 1, 실패는 0
	 */
	public int update(StoryMaker maker){
		IDMapper mapper = sqlSession.getMapper(IDMapper.class);
		int result = mapper.update(maker);
		return result;
	}
	
	/**
	 * 로그인
	 * @param id
	 * @param pw
	 * @return 어린이 로그인 1, 부모로그인 2, ID없음 3, PW불일치 4
	 */
	public int login(String id, String pw){
		StoryMaker sm = findID(id);
		System.out.println(sm);
		if (sm == null) {
			return 3;
		}
		if (pw.equals(sm.getPassword2())) {
			return 2;
		}else if(pw.equals(sm.getPassword1())){
			return 1;
		}else{
			return 4;
		}
	}
	
	/**
	 * ID검색
	 * @param id
	 * @return StoryMaker VO
	 */
	public StoryMaker findID(String id){
		StoryMaker result = new StoryMaker();
		IDMapper mapper = sqlSession.getMapper(IDMapper.class);
		result = mapper.findID(id);
		return result;
	}
	
	
}
