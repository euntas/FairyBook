package global.sesoc.fairybook.controller;

import java.util.ArrayList;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import global.sesoc.fairybook.dao.AvatarDAO;
import global.sesoc.fairybook.vo.FBResource;

/**
 * 아바타를 관리하는 컨트롤러
 */
@Controller
public class AvatarController {
	
	private static final Logger logger = LoggerFactory.getLogger(AvatarController.class);
	
	@Autowired
	AvatarDAO dao;
	
	/**
	 * 아바타 만들기 버튼을 눌렀을시
	 */
	@RequestMapping(value = "avatar", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		return "objectmaker/avatar";
	}
	
	/**
	 * 얼굴 부르기 버튼을 눌렀을시
	 * @return 얼굴 이미지 경로가 담긴 arrayList
	 */
	@ResponseBody
	@RequestMapping(value = "callFace", method = RequestMethod.GET)
	public ArrayList<FBResource> select() {
		ArrayList<FBResource> faceList = dao.readFace();
		logger.debug(faceList.toString());
		return faceList;
	}	
	
}
