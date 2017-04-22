package global.sesoc.fairybook.mapper;

import java.util.ArrayList;
import java.util.HashMap;

import global.sesoc.fairybook.vo.Avatar;
import global.sesoc.fairybook.vo.FBResource;

/**
 * 아바타 관리하는 mapper interface 입니다
 * @author 하성걸
 *
 */
public interface AvatarMapper {

	public ArrayList<FBResource> readFace();
	
	public ArrayList<FBResource> readHair();
	
	public ArrayList<FBResource> readEye();
	
	public ArrayList<FBResource> readNose();
	
	public ArrayList<FBResource> readMouth();
	
	public ArrayList<FBResource> readEar();
	
	public ArrayList<FBResource> readBody();
	
	public String readColor(HashMap<String, String> map);
	
	public int saveAvatar(Avatar avatar);
}
