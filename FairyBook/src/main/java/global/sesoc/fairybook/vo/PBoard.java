package global.sesoc.fairybook.vo;

import java.util.Date;

/**
 * PBoardVO
 * @author 이한건 170320 ver.1
 *
 */
public class PBoard {
	
	private String id;			//작성자 아이디
	private String title;		//게시글 제목
	private String content;		//게시글 내용
	private Date inputdate;		//게시글 작성시간 
	private int hit;			//게시글 추천수
	
	public PBoard() {
		// TODO Auto-generated constructor stub
	}

	public PBoard(String id, String title, String content, Date inputdate, int hit) {
		super();
		this.id = id;
		this.title = title;
		this.content = content;
		this.inputdate = inputdate;
		this.hit = hit;
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

	public Date getInputdate() {
		return inputdate;
	}

	public void setInputdate(Date inputdate) {
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
		return "PBoard [id=" + id + ", title=" + title + ", content=" + content + ", inputdate=" + inputdate + ", hit="
				+ hit + "]";
	}
	
	
	
}
