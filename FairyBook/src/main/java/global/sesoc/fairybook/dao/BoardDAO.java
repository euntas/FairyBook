package global.sesoc.fairybook.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
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
	public ArrayList<PBoard> list(int startRecored, int countPerPage){
		//일부분만 가져오기
		RowBounds rb = new RowBounds(startRecored, countPerPage);
		
		ArrayList<PBoard> result = new ArrayList<>();
		BoardMapper mapper = sqlSession.getMapper(BoardMapper.class);
		result = mapper.list(rb);
		return result;
	}
	
	//게시글 입력- 성공이면 1, 실패면 0
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

	//게시글 읽기
	public PBoard read(int boardnum) {
		BoardMapper mapper = sqlSession.getMapper(BoardMapper.class);
		PBoard board = mapper.read(boardnum);
		return board;
	}

	//게시글 삭제- 성공이면 1, 실패면 0
	public int delete(int boardnum) {
		int result = 0;
		BoardMapper mapper = sqlSession.getMapper(BoardMapper.class);
		result = mapper.delete(boardnum);
		return result;
	}

	//게시글 수정 - 성공이면 1, 실패면 0
	public int update(PBoard b) {
		int result = 0;
		BoardMapper mapper = sqlSession.getMapper(BoardMapper.class);
		result = mapper.update(b);
		return result;
	}
	
}
