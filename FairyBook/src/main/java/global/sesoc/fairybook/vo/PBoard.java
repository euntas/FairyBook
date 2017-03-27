package global.sesoc.fairybook.vo;

import java.util.Date;

/**
 * 게시판 VO
 * @author 이한건 170320 ver.1
 *
 */
public class PBoard {
	
	private int boardnum; 		//게시글 번호
	private String id;			//작성자 아이디
	private String title;		//게시글 제목
	private String content;		//게시글 내용
	private String inputdate;	//게시글 작성시간 
	private int hit;			//게시글 추천수
	
	public PBoard() {
		// TODO Auto-generated constructor stub
	}

	public PBoard(int boardnum, String id, String title, String content, String inputdate, int hit) {
		super();
		this.boardnum = boardnum;
		this.id = id;
		this.title = title;
		this.content = content;
		this.inputdate = inputdate;
		this.hit = hit;
	}

	public int getBoardnum() {
		return boardnum;
	}

	public void setBoardnum(int boardnum) {
		this.boardnum = boardnum;
	}

	public PBoard(String id, String title, String content) {
		super();
		this.id = id;
		this.title = title;
		this.content = content;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getInputdate() {
		return inputdate;
	}

	public void setInputdate(String inputdate) {
		this.inputdate = inputdate;
	}

	public int getHit() {
		return hit;
	}

	public void setHit(int hit) {
		this.hit = hit;
	}

	@Override
	public String toString() {
		return "PBoard [boardnum=" + boardnum + ", id=" + id + ", title=" + title + ", content=" + content
				+ ", inputdate=" + inputdate + ", hit=" + hit + "]";
	}

}
