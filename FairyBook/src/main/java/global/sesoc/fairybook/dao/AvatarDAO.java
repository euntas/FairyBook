package global.sesoc.fairybook.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import global.sesoc.fairybook.mapper.AvatarMapper;
import global.sesoc.fairybook.vo.FBResource;

/**
 * 아바타 관리하는 DAO입니다
 * @author 하성걸
 *
 */

@Repository
public class AvatarDAO {

	@Autowired
	SqlSession sqlSession;
	
	public ArrayList<FBResource> readFace(){
		ArrayList<FBResource> faceList = null;
		AvatarMapper mapper = sqlSession.getMapper(AvatarMapper.class); 
		faceList = mapper.readFace();
		return faceList;
	}
	
	public ArrayList<FBResource> readHair(){
		ArrayList<FBResource> hairList = null;
		AvatarMapper mapper = sqlSession.getMapper(AvatarMapper.class); 
		hairList = mapper.readHair();
		return hairList;
	}
	
	public ArrayList<FBResource> readEye(){
		ArrayList<FBResource> eyeList = null;
		AvatarMapper mapper = sqlSession.getMapper(AvatarMapper.class); 
		eyeList = mapper.readEye();
		return eyeList;
	}
	
	public ArrayList<FBResource> readNose(){
		ArrayList<FBResource> noseList = null;
		AvatarMapper mapper = sqlSession.getMapper(AvatarMapper.class); 
		noseList = mapper.readNose();
		return noseList;
	}
	
	public ArrayList<FBResource> readMouth(){
		ArrayList<FBResource> mouthList = null;
		AvatarMapper mapper = sqlSession.getMapper(AvatarMapper.class); 
		mouthList = mapper.readMouth();
		return mouthList;
	}
	
	public ArrayList<FBResource> readEar(){
		ArrayList<FBResource> earList = null;
		AvatarMapper mapper = sqlSession.getMapper(AvatarMapper.class); 
		earList = mapper.readEar();
		return earList;
	}
	
	public ArrayList<FBResource> readNeck(){
		ArrayList<FBResource> neckList = null;
		AvatarMapper mapper = sqlSession.getMapper(AvatarMapper.class); 
		neckList = mapper.readNeck();
		return neckList;
	}
	
	public ArrayList<FBResource> readBody(){
		ArrayList<FBResource> bodyList = null;
		AvatarMapper mapper = sqlSession.getMapper(AvatarMapper.class); 
		bodyList = mapper.readBody();
		return bodyList;
	}
	
	public ArrayList<FBResource> readSkin(){
		ArrayList<FBResource> skinList = null;
		AvatarMapper mapper = sqlSession.getMapper(AvatarMapper.class); 
		skinList = mapper.readSkin();
		return skinList;
	}
}
