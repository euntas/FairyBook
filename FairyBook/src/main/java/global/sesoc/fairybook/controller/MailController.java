package global.sesoc.fairybook.controller;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping(value="analysis")
public class MailController {
	
private static final Logger logger = LoggerFactory.getLogger(MailController.class);
	
	

	@RequestMapping(value="sendMail", method=RequestMethod.GET)
	public String sendMail(String email, Model model){
		logger.info(email);
		model.addAttribute("emailAddress", email);
		return "analysis/mailForm";
	}
	
	
	
}
