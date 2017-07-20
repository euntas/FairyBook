package global.sesoc.fairybook.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.multipart.MultipartFile;

import global.sesoc.fairybook.dao.BoardDAO;
import global.sesoc.fairybook.util.FileService;
import global.sesoc.fairybook.util.PageNavigator;
import global.sesoc.fairybook.vo.PBoard;
import global.sesoc.fairybook.vo.StoryMaker;
/**
 * 게시판 컨트롤러
 * @author 이한건 170320 ver.1
 */
@Controller
@RequestMapping("pboard")
public class BoardController {
	
	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
	
	@Autowired
	BoardDAO dao;
	
	//게시판 정보
	private final int countPerPage = 10;  //페이지 별 레코드 개수
	private final int pagePerGroup = 5;	  //그룹 별 페이지 수
	
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
	 * @return list와 pagenavigation을 담은 map
	 */
	@ResponseBody
	@RequestMapping(value = "list", method = RequestMethod.GET
					,produces="application/json;charset=UTF-8")
	public Map<String, Object> list(
			@RequestParam(value = "page", defaultValue = "1") int page
			, Model model
			,@SessionAttribute("loginUser") StoryMaker maker
			) {
		logger.info("page:{}",page);
		//로그인 안했으면 막기
		
		Map<String, Object> result = new HashMap<>();
		int count = dao.count(); //총 게시글 수
		ArrayList<PBoard> list = new ArrayList<>();
		PageNavigator pn = new PageNavigator(countPerPage, pagePerGroup, page, count);
		int startRecored = pn.getStartRecord();
		model.addAttribute("pn", pn);
		list = dao.list(startRecored,countPerPage);
		result.put("list", list);
		result.put("pn", pn);
		return result;
	}

	/**
	 * 게시글 쓰기 폼 불러오기
	 * @param maker
	 * @return 폼
	 */
	@RequestMapping(value = "board", method = RequestMethod.GET)
	public String insertBoard(@SessionAttribute("loginUser") StoryMaker maker) {
		//로그인 안했으면 막기
		return "board/boardForm";
	}

	/**
	 * 게시글 쓰기 - 입력, 저장
	 * @param b(게시글 정보)
	 * @param maker
	 * @return listForm
	 */
	@RequestMapping(value = "board", method = RequestMethod.POST)
	public String insertBoard(PBoard b,
			@SessionAttribute("loginUser") StoryMaker maker
			) {
		String id = maker.getId();
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
		int result = dao.insertBoard(b);
		return "redirect:listForm";
	}

	/**
	 * 게시글 읽기
	 * @param boardnum
	 * @return read
	 */
	@RequestMapping(value = "read", method = RequestMethod.GET)
	public String read(int boardnum, Model model
			,@SessionAttribute("loginUser") StoryMaker maker
			) {
		PBoard b = dao.read(boardnum);
		if (!b.getId().equals(maker.getId())) {
			b.setHit(b.getHit()+1);
			dao.update(b);
		}
			logger.info("읽을 글번호:{}",boardnum);
			PBoard board = dao.read(boardnum);
			logger.info("읽어온 글:{}",board);
			model.addAttribute("board", board);
			return "board/read";
	}

	/**
	 * 게시글 삭제
	 * @param boardnum
	 * @param maker
	 * @return 리스트로 돌아가
	 */
	@RequestMapping(value = "delete", method = RequestMethod.GET)
	public String delete(int boardnum
			,@SessionAttribute("loginUser") StoryMaker maker
			) {
		PBoard b = dao.read(boardnum);
		if (!b.getId().equals(maker.getId())) {
			return "redirect:listForm";
		}
		int result = dao.delete(boardnum);
		return "redirect:listForm";
	}

	/**
	 * 수정 폼으로 가기
	 * @param boardnum
	 * @param model
	 * @param maker
	 * @return
	 */
	@RequestMapping(value = "update", method = RequestMethod.GET)
	public String update(int boardnum, Model model
			,@SessionAttribute("loginUser") StoryMaker maker
			) {
		logger.info("수정할 게시번호:{}",boardnum);
		PBoard b = dao.read(boardnum);
		if (!b.getId().equals(maker.getId())) {
			return "redirect:listForm";
		}
		model.addAttribute("board", dao.read(boardnum));
		return "board/updateForm";
	}

	/**
	 * 수정 작업
	 * @param b
	 * @param maker
	 */
	@ResponseBody
	@RequestMapping(value = "update", method = RequestMethod.POST)
	public void update(PBoard b
			,@SessionAttribute("loginUser") StoryMaker maker
			) {
		logger.info("수정한 게시글:{}",b);
		if (!b.getId().equals(maker.getId())) {
			return;
		}
		
		String content = b.getContent().substring(3, b.getContent().length()-4);
		content = content.replaceAll("<br>", "\n");
		content = content.replaceAll("<", "&lt;");
		content = content.replaceAll(">", "&gt;");
		String title = b.getTitle();
		title = title.replaceAll("<", "&lt;");
		title = title.replaceAll(">", "&gt;");
		b.setContent(content);
		b.setTitle(title);
		
		int result = dao.update(b);
	}
	
	@RequestMapping(value="backToList",method=RequestMethod.GET)
	public String backToList(){
		return "redirect:listForm";
	}

}
