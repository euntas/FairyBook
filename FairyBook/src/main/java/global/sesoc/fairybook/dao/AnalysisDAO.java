package global.sesoc.fairybook.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import global.sesoc.fairybook.mapper.AnalysisMapper;
import global.sesoc.fairybook.vo.Counselor;
import global.sesoc.fairybook.vo.FBResource;

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
}
