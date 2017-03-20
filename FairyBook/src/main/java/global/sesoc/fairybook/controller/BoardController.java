package global.sesoc.fairybook.controller;

import java.io.FileInputStream;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import global.sesoc.fairybook.vo.PBoard;
/**
 * 게시판 컨트롤러
 * @author 이한건 170320 ver.1
 *
 */
@Controller
@RequestMapping("pboard")
public class BoardController {
	
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
