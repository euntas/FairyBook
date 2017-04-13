package global.sesoc.fairybook.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import global.sesoc.fairybook.mapper.AvatarMapper;
import global.sesoc.fairybook.mapper.ETCMapper;
import global.sesoc.fairybook.vo.Avatar;
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
	 * @return selection Num에 따른 페이지로 이동
	 */
	public void read(){
		ETCMapper mapper = sqlSession.getMapper(ETCMapper.class); 
	}
	
	/**
	 * 헤어 부르기 버튼을 눌렀을시
	 * @return 헤어 이미지 경로가 담긴 arrayList
	 */
	public ArrayList<FBResource> readHair(){
		ArrayList<FBResource> hairList = null;
		AvatarMapper mapper = sqlSession.getMapper(AvatarMapper.class); 
		hairList = mapper.readHair();
		return hairList;
	}
	
	/**
	 * 눈 부르기 버튼을 눌렀을시
	 * @return 눈 이미지 경로가 담긴 arrayList
	 */
	public ArrayList<FBResource> readEye(){
		ArrayList<FBResource> eyeList = null;
		AvatarMapper mapper = sqlSession.getMapper(AvatarMapper.class); 
		eyeList = mapper.readEye();
		return eyeList;
	}
	
	/**
	 * 코 부르기 버튼을 눌렀을시
	 * @return 코 이미지 경로가 담긴 arrayList
	 */
	public ArrayList<FBResource> readNose(){
		ArrayList<FBResource> noseList = null;
		AvatarMapper mapper = sqlSession.getMapper(AvatarMapper.class); 
		noseList = mapper.readNose();
		return noseList;
	}
	
	/**
	 * 입 부르기 버튼을 눌렀을시
	 * @return 입 이미지 경로가 담긴 arrayList
	 */
	public ArrayList<FBResource> readMouth(){
		ArrayList<FBResource> mouthList = null;
		AvatarMapper mapper = sqlSession.getMapper(AvatarMapper.class); 
		mouthList = mapper.readMouth();
		return mouthList;
	}
	
	/**
	 * 귀 부르기 버튼을 눌렀을시
	 * @return 귀 이미지 경로가 담긴 arrayList
	 */
	public ArrayList<FBResource> readEar(){
		ArrayList<FBResource> earList = null;
		AvatarMapper mapper = sqlSession.getMapper(AvatarMapper.class); 
		earList = mapper.readEar();
		return earList;
	}
	
	/**
	 * 목 부르기 버튼을 눌렀을시
	 * @return 목 이미지 경로가 담긴 arrayList
	 */
	public ArrayList<FBResource> readNeck(){
		ArrayList<FBResource> neckList = null;
		AvatarMapper mapper = sqlSession.getMapper(AvatarMapper.class); 
		neckList = mapper.readNeck();
		return neckList;
	}
	
	/**
	 * 몸 부르기 버튼을 눌렀을시
	 * @return 몸 이미지 경로가 담긴 arrayList
	 */
	public ArrayList<FBResource> readBody(){
		ArrayList<FBResource> bodyList = null;
		AvatarMapper mapper = sqlSession.getMapper(AvatarMapper.class); 
		bodyList = mapper.readBody();
		return bodyList;
	}
	
	
	/**
	 * 색깔 부르기 버튼을 눌렀을시
	 * @return 색깔 이미지 경로
	 */
	public String readColor(String name, String color){
		String colorResult = null;
		AvatarMapper mapper = sqlSession.getMapper(AvatarMapper.class);
		HashMap<String, String> map = new HashMap<>();
		map.put("name", name);
		map.put("color", color);
		colorResult = mapper.readColor(map);
		return colorResult;
	}
	
	/**
	 * 세이브 버튼을 눌렀을시
	 * 지금까지 선택한 아바타의 정보를 테이블에 저장
	 */
	public int saveAvatar(Avatar avatar){
		int result = 0;
		AvatarMapper mapper = sqlSession.getMapper(AvatarMapper.class);
		result = mapper.saveAvatar(avatar);
		return result;
	}
	
}
