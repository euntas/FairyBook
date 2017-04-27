package global.sesoc.fairybook.mapper;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import global.sesoc.fairybook.vo.Counselor;
import global.sesoc.fairybook.vo.ETC;
import global.sesoc.fairybook.vo.FBResource;
import global.sesoc.fairybook.vo.SolvedQuiz;

public interface AnalysisMapper {
	
	public ArrayList<Counselor> selectHospital(String region);
	
	public Counselor selectHospital1(String country);

	//아바타 가져오기
	public ArrayList<FBResource> avatarAnalysis(int selectionNum);

	public ArrayList<SolvedQuiz> getQuizResult(int selectionNum);

	public Map<String, Integer> getColorData(int selectionNum);

	public ArrayList<String> getColorName();

	public String getColorAnalysis(int colornum);

	public ArrayList<FBResource> houseAnalysis(int selectionNum);

	public FBResource treeAnalysis(int selectionNum);
	
	public ETC getETC(int selectionNum);

}
