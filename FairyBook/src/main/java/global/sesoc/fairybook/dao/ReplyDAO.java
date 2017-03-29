package global.sesoc.fairybook.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import global.sesoc.fairybook.mapper.ReplyMapper;
import global.sesoc.fairybook.vo.PReply;

@Repository
public class ReplyDAO {

	@Autowired
	SqlSession sqlSession;

	//리플 달기
	public int replyInsert(PReply reply) {
		ReplyMapper mapper = sqlSession.getMapper(ReplyMapper.class);
		int result = mapper.replyInsert(reply);
		return result;
	}

	//리플목록
	public ArrayList<PReply> replyList(int boardnum) {
		ReplyMapper mapper = sqlSession.getMapper(ReplyMapper.class);
		ArrayList<PReply> result = new ArrayList<>();
		result = mapper.replyList(boardnum);
		return result;
	}

	//리플삭제
	public int replyDelete(PReply r) {
		ReplyMapper mapper = sqlSession.getMapper(ReplyMapper.class);
		int result = mapper.replyDelete(r);
		return result;
	}

	//리플수정
	public int replyUpdate(PReply r) {
		ReplyMapper mapper = sqlSession.getMapper(ReplyMapper.class);
		int result = mapper.replyUpdate(r);
		return result;
	}
	
	
}
