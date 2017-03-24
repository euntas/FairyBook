package global.sesoc.fairybook.vo;

/**
 * 아바타 정보
 * 
 * @author 하성걸(2017.03.24 - ver2)
 *
 */
public class Avatar {

	private int selectionNum;
	private int face;
	private int hair;
	private int eye;
	private int nose;
	private int mouth;
	private int ear;
	private int neck;
	private int body;
	private int skin;
	
	public Avatar() {
		// TODO Auto-generated constructor stub
	}

	public Avatar(int selectionNum, int face, int hair, int eye, int nose, int mouth, int ear, int neck, int body,
			int skin) {
		super();
		this.selectionNum = selectionNum;
		this.face = face;
		this.hair = hair;
		this.eye = eye;
		this.nose = nose;
		this.mouth = mouth;
		this.ear = ear;
		this.neck = neck;
		this.body = body;
		this.skin = skin;
	}

	public int getSelectionNum() {
		return selectionNum;
	}

	public void setSelectionNum(int selectionNum) {
		this.selectionNum = selectionNum;
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

	public int getMouth() {
		return mouth;
	}

	public void setMouth(int mouth) {
		this.mouth = mouth;
	}

	public int getEar() {
		return ear;
	}

	public void setEar(int ear) {
		this.ear = ear;
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

	@Override
	public String toString() {
		return "Avatar [selectionNum=" + selectionNum + ", face=" + face + ", hair=" + hair + ", eye=" + eye + ", nose="
				+ nose + ", mouth=" + mouth + ", ear=" + ear + ", neck=" + neck + ", body=" + body + ", skin=" + skin
				+ "]";
	}
	
	
}