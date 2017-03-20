package global.sesoc.fairybook.vo;

/**
 * 동화 정보
 * 
 * @author 이은지(2017.03.20 - ver1)
 *
 */

public class Fairytale {
	private int storyNum; 			// 스토리번호(PK)
	private String storyTitle;		// 스토리 제목
	
	public Fairytale() {
		// TODO Auto-generated constructor stub
	}

	public int getStoryNum() {
		return storyNum;
	}

	public void setStoryNum(int storyNum) {
		this.storyNum = storyNum;
	}

	public String getStoryTitle() {
		return storyTitle;
	}

	public void setStoryTitle(String storyTitle) {
		this.storyTitle = storyTitle;
	}

	@Override
	public String toString() {
		return "Fairytale [storyNum=" + storyNum + ", storyTitle=" + storyTitle + "]";
	}

}
