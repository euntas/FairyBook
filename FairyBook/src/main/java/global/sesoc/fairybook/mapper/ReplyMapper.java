package global.sesoc.fairybook.mapper;

import java.util.ArrayList;

import global.sesoc.fairybook.vo.PReply;

public interface ReplyMapper {

	//댓글 달기
	public int replyInsert(PReply reply);

	//댓글목록
	public ArrayList<PReply> replyList(int boardnum);

	//댓글삭제
	public int replyDelete(PReply r);

	//댓글수정
	public int replyUpdate(PReply r);

}
