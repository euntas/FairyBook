package global.sesoc.fairybook.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;


import global.sesoc.fairybook.vo.PBoard;
/**
 * 게시판 컨트롤러
 * @author 이한건 170320 ver.1
 *
 */
@Controller
@RequestMapping("pboard")
public class BoardController {
	
	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
	
	@RequestMapping(value = "list", method = RequestMethod.GET)
	public String list(@RequestParam(value = "page", defaultValue = "1") int page) {
		return "board/list";
	}

	@RequestMapping(value = "board", method = RequestMethod.GET)
	public String insertBoard() {

		return "board/boardForm";
	}

	@RequestMapping(value = "board", method = RequestMethod.POST)
	public String insertBoard(PBoard b) {

			return "redirect:list";
	}

	@RequestMapping(value = "read", method = RequestMethod.GET)
	public String read(int boardnum) {

	
			return "board/read";
		
	}

	@RequestMapping(value = "delete", method = RequestMethod.GET)
	public String delete(int boardnum) {

		return "redirect:list";
	}

	@RequestMapping(value = "update", method = RequestMethod.GET)
	public String update(int boardnum) {
		return "board/updateForm";
	}

	@RequestMapping(value = "update", method = RequestMethod.POST)
	public String update(PBoard b) {

		return "redirect:/";
	}


	
	
}
