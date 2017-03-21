package global.sesoc.fairybook.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import global.sesoc.fairybook.vo.PReply;
/**
 * 댓글 컨트롤러
 * @author 이한건 170320 ver.1
 *
 */

@Controller
public class ReplyController {
	
	private static final Logger logger = LoggerFactory.getLogger(ReplyController.class);
	
	@RequestMapping(value="replyWrite", method=RequestMethod.POST)
	public String replyWrite(
			int boardnum,
			String text,
			HttpSession session,
			Model model){
		
		return "redirect:read?boardnum=";
	}
	
	@RequestMapping(value="replydelete", method=RequestMethod.GET)
	public String replydelete(int boardnum, int replynum, HttpSession session){
		String userId = (String)session.getAttribute("loginId");
		
		
		return "redirect:read?boardnum="+boardnum;
	}
	
	@ResponseBody
	@RequestMapping(value="replyList", method=RequestMethod.GET)
	public ArrayList<PReply> replyList(int boardnum){
		ArrayList<PReply> clist = new ArrayList<>();
		return clist;
	}
}
