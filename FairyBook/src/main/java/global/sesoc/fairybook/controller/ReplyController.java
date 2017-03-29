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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;

import global.sesoc.fairybook.dao.ReplyDAO;
import global.sesoc.fairybook.vo.PReply;
import global.sesoc.fairybook.vo.StoryMaker;
/**
 * 댓글 컨트롤러
 * @author 이한건 170320 ver.1
 *
 */

@Controller
@RequestMapping(value="pboard")
public class ReplyController {
	
	private static final Logger logger = LoggerFactory.getLogger(ReplyController.class);
	
	@Autowired
	ReplyDAO dao;
	
	@RequestMapping(value="replyWrite", method=RequestMethod.POST)
	public String replyWrite(
			PReply reply,
			int boardnum,
			HttpSession session,
			Model model){
		String text = reply.getText();
		text = text.replaceAll("<br>", "\n");
		text = text.replaceAll("<", "&lt;");
		text = text.replaceAll(">", "&gt;");
		reply.setText(text);
		reply.setBoardNum(boardnum);
		logger.info("reply:{}",reply);
		int result = dao.replyInsert(reply);
		return "redirect:read?boardnum="+boardnum;
	}
	@ResponseBody
	@RequestMapping(value="replyList", method=RequestMethod.GET)
	public ArrayList<PReply> replyList(int boardnum){
		logger.info("replyList boardnum: {}",boardnum);
		ArrayList<PReply> list = new ArrayList<>();
		list = dao.replyList(boardnum);
		return list;
	}
	
	@ResponseBody
	@RequestMapping(value="replydelete", method=RequestMethod.GET)
	public void replydelete(PReply r, HttpSession session){
		String userId = ((StoryMaker)session.getAttribute("loginUser")).getId();
		logger.info("delete reply:{}",r);
		int result = dao.replyDelete(r);
	}
	
	@ResponseBody
	@RequestMapping(value="replyUpdate",method=RequestMethod.POST)
	public void replyUpdate(PReply r){
		logger.info("update reply:{}",r);
		int result = dao.replyUpdate(r);
	}
}

