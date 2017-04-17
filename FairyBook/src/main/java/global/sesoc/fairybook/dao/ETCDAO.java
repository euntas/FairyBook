package global.sesoc.fairybook.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import global.sesoc.fairybook.mapper.ETCMapper;
import global.sesoc.fairybook.vo.ETC;
import global.sesoc.fairybook.vo.FBResource;

/**
 * 쿠키집등의 ETC 관리하는 DAO입니다
 * @author 하성걸
 *
 */

@Repository
public class ETCDAO {

	@Autowired
	SqlSession sqlSession;
	
	/**
	 * ETC 페이지로 접근할 때
	 * @return 해당 storyNum의 ETC 자료들을 받아 가져온다
	 */
	public ArrayList<FBResource> readETC(int storyNum){
		ArrayList<FBResource> etcList = null;
		ETCMapper mapper = sqlSession.getMapper(ETCMapper.class); 
		etcList = mapper.readETC(storyNum);
		return etcList;
	}
	
	/**
	 * 색깔 부르기 버튼을 눌렀을시
	 * @return 색깔 이미지 경로
	 */
	public String readColor(int storyNum, int currentNum, String color){
		String colorResult = null;
		ETCMapper mapper = sqlSession.getMapper(ETCMapper.class);
		HashMap<String, Object> map = new HashMap<>();
		map.put("storyNum", storyNum);
		map.put("currentNum", currentNum);
		map.put("color", color);
		colorResult = mapper.readColor(map);
		return colorResult;
	}
	
	public int saveETC(ETC etc){
		int result = 0;
		ETCMapper mapper = sqlSession.getMapper(ETCMapper.class);
		result = mapper.saveETC(etc);
		return result;
	}
	
}
