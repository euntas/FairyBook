package global.sesoc.fairybook.vo;
/**
 * QuizVO
 * @author 이한건 170320 ver.1
 *
 */
public class Quiz {
	private int quizNum;		//퀴즈번호
	private String question;	//퀴즈문제
	private String select1;		//퀴즈 선택지1
	private String select2;		//퀴즈 선택지2
	private String select3;		//퀴즈 선택지3
	private String select4;		//퀴즈 선택지4
	private int answer;			//퀴즈 정답
	
	public Quiz() {
		// TODO Auto-generated constructor stub
	}

	public Quiz(int quizNum, String question, String select1, String select2, String select3, String select4,
			int answer) {
		super();
		this.quizNum = quizNum;
		this.question = question;
		this.select1 = select1;
		this.select2 = select2;
		this.select3 = select3;
		this.select4 = select4;
		this.answer = answer;
	}

	public int getQuizNum() {
		return quizNum;
	}

	public void setQuizNum(int quizNum) {
		this.quizNum = quizNum;
	}

	public String getQuestion() {
		return question;
	}

	public void setQuestion(String question) {
		this.question = question;
	}

	public String getSelect1() {
		return select1;
	}

	public void setSelect1(String select1) {
		this.select1 = select1;
	}

	public String getSelect2() {
		return select2;
	}

	public void setSelect2(String select2) {
		this.select2 = select2;
	}

	public String getSelect3() {
		return select3;
	}

	public void setSelect3(String select3) {
		this.select3 = select3;
	}

	public String getSelect4() {
		return select4;
	}

	public void setSelect4(String select4) {
		this.select4 = select4;
	}

	public int getAnswer() {
		return answer;
	}

	public void setAnswer(int answer) {
		this.answer = answer;
	}

	@Override
	public String toString() {
		return "Quiz [quizNum=" + quizNum + ", question=" + question + ", select1=" + select1 + ", select2=" + select2
				+ ", select3=" + select3 + ", select4=" + select4 + ", answer=" + answer + "]";
	}
	
	
}
