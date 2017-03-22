package global.sesoc.fairybook.controller;

import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import global.sesoc.fairybook.vo.Item;

/**
 * 스토리 진행을 위한 콘트롤러
 * 
 * @author 이은지(2017.03.20 - ver1)
 *
 */

@Controller
@RequestMapping(value="story")
public class StoryController {

	private static final Logger logger = LoggerFactory.getLogger(StoryController.class);
	
	@RequestMapping(value = "storyTest", method = RequestMethod.GET)
	public String storytest(Model model) {
	
		return "storyTest";
	}
	
	@RequestMapping(value = "sceneLoading", method = RequestMethod.GET)
	public String sceneLoading(int storyNum, int sceneNum, Model model) {
	
		return "";
	}
	
	@RequestMapping(value = "goNextScene", method = RequestMethod.GET)
	public void goNextScene() {
	
	}
	
	@RequestMapping(value = "saveItem", method = RequestMethod.GET)
	public void saveItem(int selectionNum, Item newItem) {
	
	}
	
	@RequestMapping(value = "saveSelection", method = RequestMethod.GET)
	public void saveSelection() {
	
	}
}
