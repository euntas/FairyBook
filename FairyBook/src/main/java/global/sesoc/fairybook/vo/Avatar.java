package global.sesoc.fairybook.vo;

/**
 * 아바타 정보
 * 
 * @author 이은지(2017.03.20 - ver1)
 *
 */
public class Avatar {
	private int storyNum;		// 스토리 번호
	private int resourceNum;	// 리소스 번호
	
	public Avatar() {
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
		return "Avatar [storyNum=" + storyNum + ", resourceNum=" + resourceNum + "]";
	}

}
