package global.sesoc.fairybook.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import global.sesoc.fairybook.mapper.AvatarMapper;
import global.sesoc.fairybook.vo.FBResource;


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
}
