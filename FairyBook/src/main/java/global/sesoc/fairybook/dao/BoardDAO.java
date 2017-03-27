package global.sesoc.fairybook.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import global.sesoc.fairybook.mapper.BoardMapper;
import global.sesoc.fairybook.vo.PBoard;

@Repository
public class BoardDAO {

	@Autowired
	SqlSession sqlSession;
	
	//게시글 목록
	public ArrayList<PBoard> list(){
		ArrayList<PBoard> result = new ArrayList<>();
		BoardMapper mapper = sqlSession.getMapper(BoardMapper.class);
		result = mapper.list();
		return result;
	}
	
	//게시글 입력
	public int insertBoard(PBoard b){
		int result = 0;
		BoardMapper mapper = sqlSession.getMapper(BoardMapper.class);
		result = mapper.insertBoard(b);
		return result;
	}
	
	//게시글 개수
	public int count(){
		int result = 0;
		BoardMapper mapper = sqlSession.getMapper(BoardMapper.class);
		result = mapper.count();
		return result;
	}
	
}
