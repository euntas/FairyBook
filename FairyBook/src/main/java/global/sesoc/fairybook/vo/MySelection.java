package global.sesoc.fairybook.vo;

/**
 * 동화 회차 정보 -  
 * 
 * @author 이은지(2017.04.06 - ver1)
 *
 */

public class MySelection {
	private int selectionNum;		// 회차 번호
	private String id;				// 사용자 아이디
	private int storyNum;			// 스토리 번호
	private String startDate;		// 이 회차 시작한 시각
	private String endDate;			// 이 회차 끝낸 시각( 중간 종료일 경우도 그 시각으로 저장한다. )
	private String finished;		// 이 회차를 끝냈을 때 : Y , 아직 진행중일 경우 : N
	
	public MySelection() {
		// TODO Auto-generated constructor stub
	}

	public MySelection(int selectionNum, String id, int storyNum, String startDate, String endDate, String finished) {
		super();
		this.selectionNum = selectionNum;
		this.id = id;
		this.storyNum = storyNum;
		this.startDate = startDate;
		this.endDate = endDate;
		this.finished = finished;
	}

	public int getSelectionNum() {
		return selectionNum;
	}

	public void setSelectionNum(int selectionNum) {
		this.selectionNum = selectionNum;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public int getStoryNum() {
		return storyNum;
	}

	public void setStoryNum(int storyNum) {
		this.storyNum = storyNum;
	}

	public String getStartDate() {
		return startDate;
	}

	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}

	public String getEndDate() {
		return endDate;
	}

	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}

	public String getFinished() {
		return finished;
	}

	public void setFinished(String finished) {
		this.finished = finished;
	}

	@Override
	public String toString() {
		return "MySelection [selectionNum=" + selectionNum + ", id=" + id + ", storyNum=" + storyNum + ", startDate="
				+ startDate + ", endDate=" + endDate + ", finished=" + finished + "]";
	}
	
	

}
