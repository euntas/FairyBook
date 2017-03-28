package global.sesoc.fairybook.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import global.sesoc.fairybook.dao.AvatarDAO;
import global.sesoc.fairybook.dao.ExcelDAO;
import global.sesoc.fairybook.dao.StoryDAO;
import global.sesoc.fairybook.util.PoiForData;
import global.sesoc.fairybook.vo.Fairytale;
import global.sesoc.fairybook.vo.Item;
import global.sesoc.fairybook.vo.Quiz;
import global.sesoc.fairybook.vo.Scene;
import global.sesoc.fairybook.vo.StoryMaker;

/**
 * 스토리 진행을 위한 콘트롤러
 * 
 * @author 이은지(2017.03.20 - ver1)
 *
 */

@Controller
public class ExcelController {
	
	@Autowired
	ExcelDAO dao;

	private static final Logger logger = LoggerFactory.getLogger(ExcelController.class);
	
	@RequestMapping(value = "quizTable", method = RequestMethod.GET)
	public String quizTable() {
	
		PoiForData pd = new PoiForData();
		ArrayList<Quiz> list = new ArrayList<>();
		list = pd.DataForQuiz();
		System.out.println("콘트롤러 안에서의 리스트 ");
		System.out.println(list);
		
		dao.insertQuizTable(list);
	/*	pd.testtest();*/
		
		
		//int resInsert = dao.insertQuizTable();
		
		return "redirect:/";
	}

	
	
}
