package global.sesoc.fairybook.vo;

/**
 * 동화 회차 상세 정보 - 거쳐간 씬 내용들이 저장되어 있다.  
 * 
 * @author 이은지(2017.04.06 - ver1)
 *
 */

public class SelectionDetail {
	private int selectionNum;		// 회차 번호
	private int sceneNum;			// 씬 번호
	private int myAnswer;			// 내가 선택한 선택지 번호
	private String inputDate;		// 이 씬이 시작될 때 시간
	private String item;			// 선택한 아이템 이름
	
	public SelectionDetail() {
		// TODO Auto-generated constructor stub
	}

	public SelectionDetail(int selectionNum, int sceneNum, int myAnswer, String inputDate, String item) {
		super();
		this.selectionNum = selectionNum;
		this.sceneNum = sceneNum;
		this.myAnswer = myAnswer;
		this.inputDate = inputDate;
		this.item = item;
	}

	public int getSelectionNum() {
		return selectionNum;
	}

	public void setSelectionNum(int selectionNum) {
		this.selectionNum = selectionNum;
	}

	public int getSceneNum() {
		return sceneNum;
	}

	public void setSceneNum(int sceneNum) {
		this.sceneNum = sceneNum;
	}

	public int getMyAnswer() {
		return myAnswer;
	}

	public void setMyAnswer(int myAnswer) {
		this.myAnswer = myAnswer;
	}

	public String getInputDate() {
		return inputDate;
	}

	public void setInputDate(String inputDate) {
		this.inputDate = inputDate;
	}

	public String getItem() {
		return item;
	}

	public void setItem(String item) {
		this.item = item;
	}

	@Override
	public String toString() {
		return "SelectionDetail [selectionNum=" + selectionNum + ", sceneNum=" + sceneNum + ", myAnswer=" + myAnswer
				+ ", inputDate=" + inputDate + ", item=" + item + "]";
	}

	

}
