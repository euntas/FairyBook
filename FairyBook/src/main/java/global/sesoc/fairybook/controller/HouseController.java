package global.sesoc.fairybook.controller;

import java.util.ArrayList;
import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import global.sesoc.fairybook.dao.HouseDAO;
import global.sesoc.fairybook.vo.FBResource;
import global.sesoc.fairybook.vo.House;

/**
 * @author 하성걸
 * 집을 관리하는 컨트롤러입니다
 */
@Controller
public class HouseController {
	
	private static final Logger logger = LoggerFactory.getLogger(HouseController.class);
	
	@Autowired
	HouseDAO dao;
	
	/**
	 * 아바타 만들기 종료 후 하우스로 이동
	 */
	@RequestMapping(value = "house", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		return "objectmaker/house";
	}
	
	/**
	 * 지붕 부르기 버튼을 눌렀을시
	 * @return 지붕 이미지 경로가 담긴 arrayList
	 */
	@ResponseBody
	@RequestMapping(value = "callRoof", method = RequestMethod.GET)
	public ArrayList<FBResource> callRoof() {
		ArrayList<FBResource> roofList = dao.readRoof();
		logger.debug(roofList.toString());
		return roofList;
	}

	/**
	 * 문 부르기 버튼을 눌렀을시
	 * @return 문 이미지 경로가 담긴 arrayList
	 */
	@ResponseBody
	@RequestMapping(value = "callDoor", method = RequestMethod.GET)
	public ArrayList<FBResource> callDoor() {
		ArrayList<FBResource> doorList = dao.readDoor();
		logger.debug(doorList.toString());
		return doorList;
	}
	
	/**
	 * 창문 부르기 버튼을 눌렀을시
	 * @return 창문 이미지 경로가 담긴 arrayList
	 */
	@ResponseBody
	@RequestMapping(value = "callWindow", method = RequestMethod.GET)
	public ArrayList<FBResource> callWindow() {
		ArrayList<FBResource> windowList = dao.readWindow();
		logger.debug(windowList.toString());
		return windowList;
	}
	
	/**
	 * 굴뚝 부르기 버튼을 눌렀을시
	 * @return 굴뚝 이미지 경로가 담긴 arrayList
	 */
	@ResponseBody
	@RequestMapping(value = "callChimney", method = RequestMethod.GET)
	public ArrayList<FBResource> callChimney() {
		ArrayList<FBResource> chimneyList = dao.readChimney();
		logger.debug(chimneyList.toString());
		return chimneyList;
	}

	/**
	 * 마당 부르기 버튼을 눌렀을시
	 * @return 마당 이미지 경로가 담긴 arrayList
	 */
	@ResponseBody
	@RequestMapping(value = "callYard", method = RequestMethod.GET)
	public ArrayList<FBResource> callYard() {
		ArrayList<FBResource> yardList = dao.readYard();
		logger.debug(yardList.toString());
		return yardList;
	}
	
	/**
	 * 벽 부르기 버튼을 눌렀을시
	 * @return 벽 이미지 경로가 담긴 arrayList
	 */
	@ResponseBody
	@RequestMapping(value = "callWall", method = RequestMethod.GET)
	public ArrayList<FBResource> callWall() {
		ArrayList<FBResource> wallList = dao.readWall();
		logger.debug(wallList.toString());
		return wallList;
	}
	
	/**
	 * 저장 버튼을 눌렀을시 
	 * 지금까지 선택한 집의 정보를 저장
	 * @return 올바르게 저장되면 story페이지로 이동, 아니면 다시 house페이지로 돌아감
	 */
	@RequestMapping(value = "saveHouse", method = RequestMethod.POST)
	public String save(House house, HttpSession session) {
		session.setAttribute("selectionNum", 1);
		house.setSelectionNum((int) session.getAttribute("selectionNum"));
		logger.debug(house.toString());
		int result = 0;
		result = dao.saveHouse(house);
		if(result==1){
			return "redirect:story/storyTest?storyNum=0";
		}else{
			return "house";
		}
	}
}
