package global.sesoc.fairybook.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Locale;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import global.sesoc.fairybook.dao.AvatarDAO;
import global.sesoc.fairybook.dao.StoryDAO;
import global.sesoc.fairybook.vo.Item;
import global.sesoc.fairybook.vo.Quiz;
import global.sesoc.fairybook.vo.Scene;

/**
 * 스토리 진행을 위한 콘트롤러
 * 
 * @author 이은지(2017.03.20 - ver1)
 *
 */

@Controller
@RequestMapping(value="story")
public class StoryController {
	
	@Autowired
	StoryDAO dao;

	private static final Logger logger = LoggerFactory.getLogger(StoryController.class);
	
	@RequestMapping(value = "storyTest", method = RequestMethod.GET)
	public String storytest(Model model) {
	
		
		return "storyTest";
	}
	
	@ResponseBody 
	@RequestMapping(value = "sceneLoading", method = RequestMethod.GET)
	public ArrayList<Object> sceneLoading(int storyNum, int sceneNum, Model model) {
		// 해당 씬을 가지고 온다.
		Scene scene = dao.getScene(storyNum, sceneNum); 
		
		// 해당 씬의 퀴즈를 가져온다
		Quiz quiz = dao.getQuiz(scene.getQuizNum());
		
		ArrayList<Object> list = new ArrayList<>();
		list.add(scene);
		list.add(quiz);
		
		return list;
	}
	
	@RequestMapping(value = "saveItem", method = RequestMethod.GET)
	public void saveItem(int selectionNum, Item newItem) {
	
	}
	
	@RequestMapping(value = "saveSelection", method = RequestMethod.GET)
	public void saveSelection() {
	
	}
	
	// 테스트용
	@ResponseBody 
	@RequestMapping(value = "testeunji", method = RequestMethod.GET)
	public String testeunji(int eunjinum) {
		String str = "scene";
		str += String.valueOf(eunjinum);
		str += ".jpg";
		
		return str;
	}
	
	
}
