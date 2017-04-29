package global.sesoc.fairybook.vo;

/**
 * MBTI 정보
 * @author kita
 *
 */
public class MBTI {
	
	private int selectionNum;
	private String EI;
	private String SN;
	private String TF;
	private String JP;
	
	public MBTI() {
	}

	public MBTI(int selectionNum, String eI, String sN, String tF, String jP) {
		super();
		this.selectionNum = selectionNum;
		EI = eI;
		SN = sN;
		TF = tF;
		JP = jP;
	}

	public int getSelectionNum() {
		return selectionNum;
	}

	public void setSelectionNum(int selectionNum) {
		this.selectionNum = selectionNum;
	}

	public String getEI() {
		return EI;
	}

	public void setEI(String eI) {
		EI = eI;
	}

	public String getSN() {
		return SN;
	}

	public void setSN(String sN) {
		SN = sN;
	}

	public String getTF() {
		return TF;
	}

	public void setTF(String tF) {
		TF = tF;
	}

	public String getJP() {
		return JP;
	}

	public void setJP(String jP) {
		JP = jP;
	}

	@Override
	public String toString() {
		return "MBTI [selectionNum=" + selectionNum + ", EI=" + EI + ", SN=" + SN + ", TF=" + TF + ", JP=" + JP + "]";
	}
	
}
