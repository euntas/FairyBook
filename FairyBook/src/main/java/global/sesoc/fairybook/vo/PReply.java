package global.sesoc.fairybook.vo;

import java.util.Date;
/**
 * PReplyVO
 * @author 이한건 170320 ver.1
 *
 */
public class PReply {
	
	private String id;			//댓글 작성자 아이디
	private int boardNum;		//댓글이 달리는 게시물 번호
	private String text;		//댓글 내용
	private Date inputdate;		//댓글 입력날짜, 시간
	
	public PReply() {
		// TODO Auto-generated constructor stub
	}

	public PReply(String id, int boardNum, String text, Date inputdate) {
		super();
		this.id = id;
		this.boardNum = boardNum;
		this.text = text;
		this.inputdate = inputdate;
	}

	public PReply(String id, int boardNum, String text) {
		super();
		this.id = id;
		this.boardNum = boardNum;
		this.text = text;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public int getBoardNum() {
		return boardNum;
	}

	public void setBoardNum(int boardNum) {
		this.boardNum = boardNum;
	}

	public String getText() {
		return text;
	}

	public void setText(String text) {
		this.text = text;
	}

	public Date getInputdate() {
		return inputdate;
	}

	public void setInputdate(Date inputdate) {
		this.inputdate = inputdate;
	}

	@Override
	public String toString() {
		return "PReply [id=" + id + ", boardNum=" + boardNum + ", text=" + text + ", inputdate=" + inputdate + "]";
	}
	
	

}
