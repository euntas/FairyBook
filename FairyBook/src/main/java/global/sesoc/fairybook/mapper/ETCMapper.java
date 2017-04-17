package global.sesoc.fairybook.mapper;

import java.util.ArrayList;
import java.util.HashMap;

import global.sesoc.fairybook.vo.FBResource;


/**
 * ETC 관리하는 mapper interface 입니다
 * @author 하성걸
 *
 */
public interface ETCMapper {

	public ArrayList<FBResource> readETC(int storyNum);
	
	public String readColor(HashMap<String, Object> map);
	
	public void insertETC(HashMap<String, Integer> map);
}
