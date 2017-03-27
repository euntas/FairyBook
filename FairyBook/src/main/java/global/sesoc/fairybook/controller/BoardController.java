package global.sesoc.fairybook.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;

import global.sesoc.fairybook.dao.BoardDAO;
import global.sesoc.fairybook.util.PageNavigator;
import global.sesoc.fairybook.vo.PBoard;
import global.sesoc.fairybook.vo.StoryMaker;
/**
 * 게시판 컨트롤러
 * @author 이한건 170320 ver.1
 *
 */
@Controller
@RequestMapping("pboard")
public class BoardController {
	
	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
	
	@Autowired
	BoardDAO dao;
	
	/**
	 * 게시판 목록 화면 가져오기
	 */
	@RequestMapping(value="listForm",method=RequestMethod.GET)
	public String listForm(){
		return "board/list";
	}
	
	/**
	 * 게시판 목록 불러오기
	 * @param page
	 * @return 목록 list
	 */
	@ResponseBody
	@RequestMapping(value = "list", method = RequestMethod.GET
					,produces="application/json;charset=UTF-8")
	public ArrayList<PBoard> list(@RequestParam(value = "page", defaultValue = "1") int page
			//,@SessionAttribute("loginUser") StoryMaker maker
			) {
		//로그인 안했으면 막기
		
		
		int count = dao.count(); //총 게시글 수
		ArrayList<PBoard> list = new ArrayList<>();
		PageNavigator pn = new PageNavigator(15, 5, page, count);
		int startRecored = pn.getStartRecord();
		list = dao.list();
		return list;
	}

	@RequestMapping(value = "board", method = RequestMethod.GET)
	public String insertBoard(@SessionAttribute("loginUser") StoryMaker maker) {
		//로그인 안했으면 막기
		return "board/boardForm";
	}

	@RequestMapping(value = "board", method = RequestMethod.POST)
	public String insertBoard(PBoard b, 
			@SessionAttribute("loginUser") StoryMaker maker
			) {
		logger.info("게시글 작성자:{}",maker);
		String id = maker.getId();
		//로그인 안했으면 막기
		
		
		String content = b.getContent().substring(3, b.getContent().length()-4);
		content = content.replaceAll("<br>", "\n");
		content = content.replaceAll("<", "&lt;");
		content = content.replaceAll(">", "&gt;");
		String title = b.getTitle();
		title = title.replaceAll("<", "&lt;");
		title = title.replaceAll(">", "&gt;");
		b.setContent(content);
		b.setTitle(title);
		b.setId(id);
		logger.info("게시글:{}",b);
		int result = dao.insertBoard(b);
		return "redirect:list";
	}

	@RequestMapping(value = "read", method = RequestMethod.GET)
	public String read(int boardnum,
			@SessionAttribute("loginUser") StoryMaker maker) {

	
			return "board/read";
		
	}

	@RequestMapping(value = "delete", method = RequestMethod.GET)
	public String delete(int boardnum,
			@SessionAttribute("loginUser") StoryMaker maker) {

		return "redirect:list";
	}

	@RequestMapping(value = "update", method = RequestMethod.GET)
	public String update(int boardnum,
			@SessionAttribute("loginUser") StoryMaker maker) {
		return "board/updateForm";
	}

	@RequestMapping(value = "update", method = RequestMethod.POST)
	public String update(PBoard b,
			@SessionAttribute("loginUser") StoryMaker maker) {

		return "redirect:/";
	}


	
	
}
