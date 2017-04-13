package global.sesoc.fairybook.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import global.sesoc.fairybook.dao.ETCDAO;

/**
 * @author 하성걸
 * 과자집 등 기타요소를 관리하는 컨트롤러입니다
 */
@Controller
@RequestMapping(value="objectMaker")
public class ETCController {
	
	private static final Logger logger = LoggerFactory.getLogger(ETCController.class);
	
	@Autowired
	ETCDAO dao;
	
	/**
	 * 기타 요소 페이지로 넘어갈 시
	 *  selectionNum을 읽어 해당 동화에 해당하는 etc 색칠 페이지를 보여준다
	 */
	@RequestMapping(value = "etc", method = RequestMethod.GET)
	public String etcLoad(Model model, HttpSession session) {
		
		session.setAttribute("currentStoryNum", 0);
		session.setAttribute("myselectionNum", 73);
		
		int storyNum = (int) session.getAttribute("currentStoryNum");
		int selectionNum = (int) session.getAttribute("myselectionNum");		
		model.addAttribute("storyNum", storyNum);
		model.addAttribute("selectionNum", selectionNum);
		return "objectMaker/etc";
		
	}
	
	
}
