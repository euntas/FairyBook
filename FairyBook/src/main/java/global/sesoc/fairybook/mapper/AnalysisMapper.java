package global.sesoc.fairybook.mapper;

import java.util.ArrayList;

import global.sesoc.fairybook.vo.Counselor;
import global.sesoc.fairybook.vo.FBResource;

public interface AnalysisMapper {
	
	public ArrayList<Counselor> selectHospital(String region);
	
	public Counselor selectHospital1(String country);

	//아바타 가져오기
	public ArrayList<FBResource> avatarAnalysis(int selectionNum);

}
