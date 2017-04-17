package global.sesoc.fairybook.controller;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import global.sesoc.fairybook.dao.IDDAO;

/**
 * 메일 컨트롤러
 * @author 이한건 ver.1
 *
 */

@Controller
@RequestMapping(value = "analysis")
public class MailController {

	private static final Logger logger = LoggerFactory.getLogger(MailController.class);

	@Autowired
	private JavaMailSender mailSender;
	
	@Autowired
	IDDAO dao;
	
	
	
	/**
	 * 선택한 담당의사의 메일 주소를 받아서 수신자로 고정하여
	 * 메일폼을 띄운다.
	 * @return 메일폼
	 */
	@RequestMapping(value="sendMail", method=RequestMethod.GET)
	public String sendMail(String email, Model model){
		logger.info(email);
		model.addAttribute("emailAddress", email);
		return "analysis/mailForm";
	}
	
	
	/**
	 * 메일폼에 작성된 내용을 받아 메일을 발송한다.
	 * @return
	 */
	@RequestMapping(value = "sendMail", method=RequestMethod.POST)
	public String sendMail(String receiver, String title, String content) {
		String setfrom = "scit32c1@gmail.com";         
		
		try {
			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");
			messageHelper.setTo(receiver);
			messageHelper.setText(content);
			messageHelper.setFrom(setfrom);
			messageHelper.setSubject(title); // 메일제목은 생략이 가능하다
			mailSender.send(message);
		} catch (Exception e) {
			System.out.println(e);
		}
		return "redirect:/analysis/counsel";
	}
	
	@ResponseBody
	@RequestMapping(value="findPW", method=RequestMethod.POST)
	public String findPW(String id, String email, Model model){
		String setfrom = "scit32c1@gmail.com"; 
		String result =null;
		result = dao.findPW(id, email);
		
		if(result!=null){
		try {
			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");
			messageHelper.setTo(email);
			messageHelper.setText("귀하의 비밀번호는 "+result+"입니다.");
			messageHelper.setFrom(setfrom);
			messageHelper.setSubject("[FairyBook] "+id+"님 비밀번호 찾기 메일입니다."); 
			mailSender.send(message);
		} catch (Exception e) {
			System.out.println(e);
		}
		
		}
		return result;
	}
}
