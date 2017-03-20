package global.sesoc.fairybook.vo;

/**
 * 집 정보
 * 
 * @author 이은지(2017.03.20 - ver1)
 *
 */
public class House {
	
	private int storyNum;		// 스토리 번호
	private int resourceNum;	// 리소스 번호
	
	public House() {
		// TODO Auto-generated constructor stub
	}

	public int getStoryNum() {
		return storyNum;
	}

	public void setStoryNum(int storyNum) {
		this.storyNum = storyNum;
	}

	public int getResourceNum() {
		return resourceNum;
	}

	public void setResourceNum(int resourceNum) {
		this.resourceNum = resourceNum;
	}

	@Override
	public String toString() {
		return "House [storyNum=" + storyNum + ", resourceNum=" + resourceNum + "]";
	}
	

}
