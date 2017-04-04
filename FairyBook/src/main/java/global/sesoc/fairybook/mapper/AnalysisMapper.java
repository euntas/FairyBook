package global.sesoc.fairybook.mapper;

import java.util.ArrayList;

import global.sesoc.fairybook.vo.Counselor;

public interface AnalysisMapper {
	
	public ArrayList<Counselor> selectHospital(String region);
	
	public Counselor selectHospital1(String country);

}
