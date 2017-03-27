package global.sesoc.fairybook.mapper;

import java.util.ArrayList;

import global.sesoc.fairybook.vo.FBResource;
import global.sesoc.fairybook.vo.House;

/**
 * 집 관리하는 mapper interface 입니다
 * @author 하성걸
 *
 */
public interface HouseMapper {

	public ArrayList<FBResource> readRoof();
	
	public ArrayList<FBResource> readDoor();
	
	public ArrayList<FBResource> readWindow();
	
	public ArrayList<FBResource> readChimney();
	
	public ArrayList<FBResource> readYard();
	
	public ArrayList<FBResource> readWall();
	
	public int saveHouse(House house);
}
