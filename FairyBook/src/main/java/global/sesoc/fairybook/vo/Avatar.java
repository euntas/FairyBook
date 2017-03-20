package global.sesoc.fairybook.vo;

/**
 * 아바타 정보
 * 
 * @author 이은지(2017.03.20 - ver1)
 *
 */
public class Avatar {
	private int selectionNum;		// 셀렉션 번호
	private int resourceNum;	// 리소스 번호
	
	public Avatar() {
		// TODO Auto-generated constructor stub
	}

	public int getStoryNum() {
		return selectionNum;
	}

	public void setStoryNum(int selectionNum) {
		this.selectionNum = selectionNum;
	}

	public int getResourceNum() {
		return resourceNum;
	}

	public void setResourceNum(int resourceNum) {
		this.resourceNum = resourceNum;
	}

	@Override
	public String toString() {
		return "Avatar [selectionNum=" + selectionNum + ", resourceNum=" + resourceNum + "]";
	}

}
