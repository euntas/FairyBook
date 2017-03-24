package global.sesoc.fairybook;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		return "main/home";
	}
	
	@RequestMapping(value="menu/storySelect", method=RequestMethod.GET)
	public String storySelect(){
		return "main/storySelect";
	}
	
	@RequestMapping(value="menu/storyPlay", method=RequestMethod.GET)
	public String storyPlay(){
		return "main/storyPlay";
	}
	@RequestMapping(value="menu/quizSolve", method=RequestMethod.GET)
	public String quizSolve(){
		return "main/quizSolve";
	}
	@RequestMapping(value="menu/myChildStory", method=RequestMethod.GET)
	public String myChildStory(){
		return "main/myChildStory";
	}
	@RequestMapping(value="menu/storyMake", method=RequestMethod.GET)
	public String storyMake(){
		return "main/storyMake";
	}
	@RequestMapping(value="menu/counselResult", method=RequestMethod.GET)
	public String counselResult(){
		return "main/counselResult";
	}
	
}
