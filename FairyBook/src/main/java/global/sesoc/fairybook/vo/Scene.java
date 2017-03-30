package global.sesoc.fairybook.vo;

/**
 * 동화 장면(씬)
 * 
 * @author 이은지(2017.03.20 - ver1)
 *
 */
public class Scene {
	private int sceneNum;			// 씬 번호 (pk)
	private int storyNum;			// 스토리 번호
	private int quizNum;			// 퀴즈 번호
	private int nextScene1;			// 선택지 1을 선택했을 때의 다음 장면
	private int nextScene2;			// 선택지 2을 선택했을 때의 다음 장면
	private int nextScene3;			// 선택지 3을 선택했을 때의 다음 장면
	private int nextScene4;			// 선택지 4을 선택했을 때의 다음 장면
	private String FBExplain;		// 아바타의 설명 혹은 질문
	private String storyText1;		// 스토리 내용(장면 전환 후 바로 나오는 텍스트)
	private String storyText2;		// 스토리 내용(장면 내에서 전환되는 텍스트 - null 일 수도 있음)
	
	public Scene() {
		// TODO Auto-generated constructor stub
	}

	public Scene(int sceneNum, int storyNum, int quizNum, int nextScene1, int nextScene2, int nextScene3,
			int nextScene4, String fBExplain, String storyText1, String srotyText2) {
		super();
		this.sceneNum = sceneNum;
		this.storyNum = storyNum;
		this.quizNum = quizNum;
		this.nextScene1 = nextScene1;
		this.nextScene2 = nextScene2;
		this.nextScene3 = nextScene3;
		this.nextScene4 = nextScene4;
		this.FBExplain = fBExplain;
		this.storyText1 = storyText1;
		this.storyText2 = srotyText2;
	}



	public int getSceneNum() {
		return sceneNum;
	}

	public void setSceneNum(int sceneNum) {
		this.sceneNum = sceneNum;
	}

	public int getStoryNum() {
		return storyNum;
	}

	public void setStoryNum(int storyNum) {
		this.storyNum = storyNum;
	}

	public int getQuizNum() {
		return quizNum;
	}

	public void setQuizNum(int quizNum) {
		this.quizNum = quizNum;
	}

	public int getNextScene1() {
		return nextScene1;
	}

	public void setNextScene1(int nextScene1) {
		this.nextScene1 = nextScene1;
	}

	public int getNextScene2() {
		return nextScene2;
	}

	public void setNextScene2(int nextScene2) {
		this.nextScene2 = nextScene2;
	}

	public int getNextScene3() {
		return nextScene3;
	}

	public void setNextScene3(int nextScene3) {
		this.nextScene3 = nextScene3;
	}

	public int getNextScene4() {
		return nextScene4;
	}

	public void setNextScene4(int nextScene4) {
		this.nextScene4 = nextScene4;
	}

	public String getFBExplain() {
		return FBExplain;
	}

	public void setFBExplain(String fBExplain) {
		FBExplain = fBExplain;
	}

	public String getStoryText1() {
		return storyText1;
	}

	public void setStoryText1(String storyText1) {
		this.storyText1 = storyText1;
	}

	public String getStoryText2() {
		return storyText2;
	}

	public void setStoryText2(String storyText2) {
		this.storyText2 = storyText2;
	}

	@Override
	public String toString() {
		return "Scene [sceneNum=" + sceneNum + ", storyNum=" + storyNum + ", quizNum=" + quizNum + ", nextScene1="
				+ nextScene1 + ", nextScene2=" + nextScene2 + ", nextScene3=" + nextScene3 + ", nextScene4="
				+ nextScene4 + ", FBExplain=" + FBExplain + ", storyText1=" + storyText1 + ", srotyText2=" + storyText2
				+ "]";
	}
	
	

}
