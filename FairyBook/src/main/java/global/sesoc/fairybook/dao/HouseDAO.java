package global.sesoc.fairybook.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import global.sesoc.fairybook.mapper.HouseMapper;
import global.sesoc.fairybook.vo.FBResource;
import global.sesoc.fairybook.vo.House;

/**
 * 집 관리하는 DAO입니다
 * @author 하성걸
 *
 */

@Repository
public class HouseDAO {

	@Autowired
	SqlSession sqlSession;
	
	/**
	 * 지붕 부르기 버튼을 눌렀을시
	 * @return 지붕 이미지 경로가 담긴 arrayList
	 */
	public ArrayList<FBResource> readRoof(){
		ArrayList<FBResource> roofList = null;
		HouseMapper mapper = sqlSession.getMapper(HouseMapper.class); 
		roofList = mapper.readRoof();
		return roofList;
	}
	
	/**
	 * 문 부르기 버튼을 눌렀을시
	 * @return 문 이미지 경로가 담긴 arrayList
	 */
	public ArrayList<FBResource> readDoor(){
		ArrayList<FBResource> doorList = null;
		HouseMapper mapper = sqlSession.getMapper(HouseMapper.class); 
		doorList = mapper.readDoor();
		return doorList;
	}
	
	/**
	 * 창문 부르기 버튼을 눌렀을시
	 * @return 창문 이미지 경로가 담긴 arrayList
	 */
	public ArrayList<FBResource> readWindow(){
		ArrayList<FBResource> windowList = null;
		HouseMapper mapper = sqlSession.getMapper(HouseMapper.class); 
		windowList = mapper.readWindow();
		return windowList;
	}
	
	/**
	 * 굴뚝 부르기 버튼을 눌렀을시
	 * @return 굴뚝 이미지 경로가 담긴 arrayList
	 */
	public ArrayList<FBResource> readChimney(){
		ArrayList<FBResource> chimneyList = null;
		HouseMapper mapper = sqlSession.getMapper(HouseMapper.class); 
		chimneyList = mapper.readChimney();
		return chimneyList;
	}
	
	/**
	 * 마당 부르기 버튼을 눌렀을시
	 * @return 마당 이미지 경로가 담긴 arrayList
	 */
	public ArrayList<FBResource> readYard(){
		ArrayList<FBResource> yardList = null;
		HouseMapper mapper = sqlSession.getMapper(HouseMapper.class); 
		yardList = mapper.readYard();
		return yardList;
	}
	
	/**
	 * 벽 부르기 버튼을 눌렀을시
	 * @return 벽 이미지 경로가 담긴 arrayList
	 */
	public ArrayList<FBResource> readWall(){
		ArrayList<FBResource> wallList = null;
		HouseMapper mapper = sqlSession.getMapper(HouseMapper.class); 
		wallList = mapper.readWall();
		return wallList;
	}
	
	/**
	 * 세이브 버튼을 눌렀을시
	 * 지금까지 선택한 집의 정보를 테이블에 저장
	 */
	public int saveHouse(House house){
		int result = 0;
		HouseMapper mapper = sqlSession.getMapper(HouseMapper.class);
		result = mapper.saveHouse(house);
		return result;
	}
}
