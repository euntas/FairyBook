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
 * @author 하성걸
 * 아바타를 관리하는 컨트롤러입니다
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
	public ArrayList<FBResource> callFace() {
		ArrayList<FBResource> faceList = dao.readFace();
		logger.debug(faceList.toString());
		return faceList;
	}	
	
	/**
	 * 헤어 부르기 버튼을 눌렀을시
	 * @return 헤어 이미지 경로가 담긴 arrayList
	 */
	@ResponseBody
	@RequestMapping(value = "callHair", method = RequestMethod.GET)
	public ArrayList<FBResource> callHair() {
		ArrayList<FBResource> hairList = dao.readHair();
		logger.debug(hairList.toString());
		return hairList;
	}
	
	/**
	 * 눈 부르기 버튼을 눌렀을시
	 * @return 눈 이미지 경로가 담긴 arrayList
	 */
	@ResponseBody
	@RequestMapping(value = "callEye", method = RequestMethod.GET)
	public ArrayList<FBResource> callEye() {
		ArrayList<FBResource> eyeList = dao.readEye();
		logger.debug(eyeList.toString());
		return eyeList;
	}	
	
	/**
	 * 코 부르기 버튼을 눌렀을시
	 * @return 코 이미지 경로가 담긴 arrayList
	 */
	@ResponseBody
	@RequestMapping(value = "callNose", method = RequestMethod.GET)
	public ArrayList<FBResource> callNose() {
		ArrayList<FBResource> noseList = dao.readNose();
		logger.debug(noseList.toString());
		return noseList;
	}
	
	/**
	 * 입 부르기 버튼을 눌렀을시
	 * @return 입 이미지 경로가 담긴 arrayList
	 */
	@ResponseBody
	@RequestMapping(value = "callMouth", method = RequestMethod.GET)
	public ArrayList<FBResource> callMouth() {
		ArrayList<FBResource> mouthList = dao.readMouth();
		logger.debug(mouthList.toString());
		return mouthList;
	}	
	
	/**
	 * 귀 부르기 버튼을 눌렀을시
	 * @return 귀 이미지 경로가 담긴 arrayList
	 */
	@ResponseBody
	@RequestMapping(value = "callEar", method = RequestMethod.GET)
	public ArrayList<FBResource> callEar() {
		ArrayList<FBResource> earList = dao.readEar();
		logger.debug(earList.toString());
		return earList;
	}	
	
	/**
	 * 목 부르기 버튼을 눌렀을시
	 * @return 목 이미지 경로가 담긴 arrayList
	 */
	@ResponseBody
	@RequestMapping(value = "callNeck", method = RequestMethod.GET)
	public ArrayList<FBResource> callNeck() {
		ArrayList<FBResource> neckList = dao.readNeck();
		logger.debug(neckList.toString());
		return neckList;
	}	
	
	/**
	 * 몸 부르기 버튼을 눌렀을시
	 * @return 몸 이미지 경로가 담긴 arrayList
	 */
	@ResponseBody
	@RequestMapping(value = "callBody", method = RequestMethod.GET)
	public ArrayList<FBResource> callBody() {
		ArrayList<FBResource> bodyList = dao.readBody();
		logger.debug(bodyList.toString());
		return bodyList;
	}	
	
	/**
	 * 피부 부르기 버튼을 눌렀을시
	 * @return 피부 이미지 경로가 담긴 arrayList
	 */
	@ResponseBody
	@RequestMapping(value = "callSkin", method = RequestMethod.GET)
	public ArrayList<FBResource> callSkin() {
		ArrayList<FBResource> skinList = dao.readSkin();
		logger.debug(skinList.toString());
		return skinList;
	}	
	
}
