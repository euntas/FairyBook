package global.sesoc.fairybook.vo;

import java.util.Date;
/**
 * 댓글용 VO
 * @author 이한건 170320 ver.1
 *
 */
public class PReply {
	
	private int replynum;		//리플 번호
	private String id;			//댓글 작성자 아이디
	private int boardnum;		//댓글이 달리는 게시물 번호
	private String text;		//댓글 내용
	private String inputdate;		//댓글 입력날짜, 시간
	
	public PReply() {
		// TODO Auto-generated constructor stub
	}

	
	public PReply(int replynum, String id, int boardnum, String text, String inputdate) {
		super();
		this.replynum = replynum;
		this.id = id;
		this.boardnum = boardnum;
		this.text = text;
		this.inputdate = inputdate;
	}


	public int getReplynum() {
		return replynum;
	}


	public void setReplynum(int replynum) {
		this.replynum = replynum;
	}


	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public int getBoardNum() {
		return boardnum;
	}

	public void setBoardNum(int boardnum) {
		this.boardnum = boardnum;
	}

	public String getText() {
		return text;
	}

	public void setText(String text) {
		this.text = text;
	}

	public String getInputdate() {
		return inputdate;
	}

	public void setInputdate(String inputdate) {
		this.inputdate = inputdate;
	}


	@Override
	public String toString() {
		return "PReply [replynum=" + replynum + ", id=" + id + ", boardnum=" + boardnum + ", text=" + text
				+ ", inputdate=" + inputdate + "]";
	}

}
