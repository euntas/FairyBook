package global.sesoc.fairybook.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import global.sesoc.fairybook.mapper.AnalysisMapper;
import global.sesoc.fairybook.vo.Counselor;
import global.sesoc.fairybook.vo.ETC;
import global.sesoc.fairybook.vo.FBResource;
import global.sesoc.fairybook.vo.MBTI;
import global.sesoc.fairybook.vo.SolvedQuiz;

@Repository
public class AnalysisDAO {

	@Autowired
	SqlSession sqlSession;
	
	//지역분류로 병원검색
	public ArrayList<Counselor> selectHospital(String region){
		AnalysisMapper mapper = sqlSession.getMapper(AnalysisMapper.class); 
		
		ArrayList<Counselor> hospital = mapper.selectHospital(region);
	
		return hospital;
	}
	
	//세부지역 병원검색
	public Counselor selectHospital1(String region){
		AnalysisMapper mapper = sqlSession.getMapper(AnalysisMapper.class); 
		
		Counselor hospital = mapper.selectHospital1(region);
	
		return hospital;
	}

	//아바타 가져오기
	public ArrayList<FBResource> avatarAnalysis(int selectionNum) {
		ArrayList<FBResource> result = new ArrayList<>();
		AnalysisMapper mapper = sqlSession.getMapper(AnalysisMapper.class); 
		result = mapper.avatarAnalysis(selectionNum);
		return result;
	}

	public ArrayList<SolvedQuiz> getQuizResult(int selectionNum) {
		ArrayList<SolvedQuiz> result = new ArrayList<>();
		AnalysisMapper mapper = sqlSession.getMapper(AnalysisMapper.class); 
		result = mapper.getQuizResult(selectionNum);
		return result;
	}

	public Map<String, Integer> getColorData(int selectionNum) {
		Map<String, Integer> result = new HashMap<>();
		AnalysisMapper mapper = sqlSession.getMapper(AnalysisMapper.class); 
		result = mapper.getColorData(selectionNum);
		return result;
	}

	public ArrayList<String> getColorName() {
		ArrayList<String> result = new ArrayList<>();
		AnalysisMapper mapper = sqlSession.getMapper(AnalysisMapper.class); 
		result = mapper.getColorName();
		return result;
	}

	public String getColorAnalysis(int colornum) {
		String result = "";
		AnalysisMapper mapper = sqlSession.getMapper(AnalysisMapper.class); 
		result = mapper.getColorAnalysis(colornum);
		return result;
	}

	public ArrayList<FBResource> houseAnalysis(int selectionNum) {
		ArrayList<FBResource> result = new ArrayList<>();
		AnalysisMapper mapper = sqlSession.getMapper(AnalysisMapper.class); 
		result = mapper.houseAnalysis(selectionNum);
		return result;
	}

	public FBResource treeAnalysis(int selectionNum) {
		AnalysisMapper mapper = sqlSession.getMapper(AnalysisMapper.class); 
		return mapper.treeAnalysis(selectionNum);
	}
	
	public ETC getETC(int selectionNum){
		AnalysisMapper mapper = sqlSession.getMapper(AnalysisMapper.class); 
		return mapper.getETC(selectionNum);
	}
	
	// mbti 테이블에 j,p 항목을 넣는다.
	public int insertForMBTI(int selectionNum, MBTI mbti){
		AnalysisMapper mapper = sqlSession.getMapper(AnalysisMapper.class);
		
		HashMap<String, Object> myinfo = new HashMap<>();
		myinfo.put("selectionNum", selectionNum);
		myinfo.put("JP", mbti.getJP());
		myinfo.put("SN", mbti.getSN());
		myinfo.put("TF", mbti.getTF());
		myinfo.put("EI", mbti.getEI());
		
		return mapper.insertForMBTI(myinfo);
	}
	
	public MBTI getMBTI(int selectionNum){
		AnalysisMapper mapper = sqlSession.getMapper(AnalysisMapper.class);
		
		return mapper.getMBTI(selectionNum);
	}

	//설명 가져오기
	public String getMBTIAnalysis(String result) {
		String analysis = "";
		AnalysisMapper mapper = sqlSession.getMapper(AnalysisMapper.class);
		analysis = mapper.getMBTIAnalysis(result);
		return analysis;
	}
}
