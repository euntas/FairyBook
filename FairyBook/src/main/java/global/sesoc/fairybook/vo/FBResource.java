package global.sesoc.fairybook.vo;

/**
 * 스토리에 사용되는 각종 리소스들 정보
 * 
 * @author 이은지(2017.03.20 - ver1)
 *
 */
public class FBResource {
	
	private int fbResourceNum;			// 리소스 번호
	private String fbResourceName;		// 리소스 이름
	private String fbResourceAnalysis;	// 리소스 설명
	private String fbResourcePath;		// 리소스 이미지 경로

	public FBResource() {
		// TODO Auto-generated constructor stub
	}

	public int getFbResourceNum() {
		return fbResourceNum;
	}

	public void setFbResourceNum(int fbResourceNum) {
		this.fbResourceNum = fbResourceNum;
	}

	public String getFbResourceName() {
		return fbResourceName;
	}

	public void setFbResourceName(String fbResourceName) {
		this.fbResourceName = fbResourceName;
	}

	public String getFbResourceAnalysis() {
		return fbResourceAnalysis;
	}

	public void setFbResourceAnalysis(String fbResourceAnalysis) {
		this.fbResourceAnalysis = fbResourceAnalysis;
	}

	public String getFbResourcePath() {
		return fbResourcePath;
	}

	public void setFbResourcePath(String fbResourcePath) {
		this.fbResourcePath = fbResourcePath;
	}

	@Override
	public String toString() {
		return "FBResource [fbResourceNum=" + fbResourceNum + ", fbResourceName=" + fbResourceName
				+ ", fbResourceAnalysis=" + fbResourceAnalysis + ", fbResourcePath=" + fbResourcePath + "]";
	}
	
}
