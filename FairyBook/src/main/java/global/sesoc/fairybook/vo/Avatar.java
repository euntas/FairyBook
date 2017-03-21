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
	private int face;
	private int hair;
	private int eye;
	private int nose;
	private int ear;
	private int mouth;
	private int neck;
	private int body;
	private int skin;
	
	public Avatar() {
		// TODO Auto-generated constructor stub
	}

	
	
	public Avatar(int storyNum, int resourceNum, int face, int hair, int eye, int nose, int ear, int mouth, int neck,
			int body, int skin) {
		super();
		this.storyNum = storyNum;
		this.resourceNum = resourceNum;
		this.face = face;
		this.hair = hair;
		this.eye = eye;
		this.nose = nose;
		this.ear = ear;
		this.mouth = mouth;
		this.neck = neck;
		this.body = body;
		this.skin = skin;
	}

	

	public int getFace() {
		return face;
	}



	public void setFace(int face) {
		this.face = face;
	}



	public int getHair() {
		return hair;
	}



	public void setHair(int hair) {
		this.hair = hair;
	}



	public int getEye() {
		return eye;
	}



	public void setEye(int eye) {
		this.eye = eye;
	}



	public int getNose() {
		return nose;
	}



	public void setNose(int nose) {
		this.nose = nose;
	}



	public int getEar() {
		return ear;
	}



	public void setEar(int ear) {
		this.ear = ear;
	}



	public int getMouth() {
		return mouth;
	}



	public void setMouth(int mouth) {
		this.mouth = mouth;
	}



	public int getNeck() {
		return neck;
	}



	public void setNeck(int neck) {
		this.neck = neck;
	}



	public int getBody() {
		return body;
	}



	public void setBody(int body) {
		this.body = body;
	}



	public int getSkin() {
		return skin;
	}



	public void setSkin(int skin) {
		this.skin = skin;
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
		return "Avatar [storyNum=" + storyNum + ", resourceNum=" + resourceNum + ", face=" + face + ", hair=" + hair
				+ ", eye=" + eye + ", nose=" + nose + ", ear=" + ear + ", mouth=" + mouth + ", neck=" + neck + ", body="
				+ body + ", skin=" + skin + "]";
	}

	
}
