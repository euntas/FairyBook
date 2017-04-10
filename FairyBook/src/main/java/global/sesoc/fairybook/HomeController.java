package global.sesoc.fairybook;

import java.io.FileOutputStream;
import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.codec.binary.Base64;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

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

		model.addAttribute("serverTime", formattedDate);

		return "main/home";
	}

	/**
	 * 동화선택
	 * 
	 * @return main/storySelect.jsp
	 */
	@RequestMapping(value = "menu/storySelect", method = RequestMethod.GET)
	public String storySelect() {
		return "main/storySelect";
	}

	/**
	 * 동화감상
	 * 
	 * @return main/storyPlay.jsp
	 */
	@RequestMapping(value = "menu/storyPlay", method = RequestMethod.GET)
	public String storyPlay() {
		return "main/storyPlay";
	}

	/**
	 * 문제풀기
	 * 
	 * @return main/quizSolve.jsp
	 */
	@RequestMapping(value = "menu/quizSolve", method = RequestMethod.GET)
	public String quizSolve() {
		return "main/quizSolve";
	}

	/**
	 * 내아이동화감상
	 * 
	 * @return main/myChildStory.jsp
	 */
	@RequestMapping(value = "menu/myChildStory", method = RequestMethod.GET)
	public String myChildStory() {
		return "main/myChildStory";
	}

	/**
	 * 상담요청결과
	 * 
	 * @return main/counselResult.jsp
	 */
	@RequestMapping(value = "menu/counselResult", method = RequestMethod.GET)
	public String counselResult() {
		return "main/counselResult";
	}

	/**
	 * 책만들기
	 * 
	 * @return main/makebook.jsp
	 */
	@RequestMapping(value = "menu/makebook", method = RequestMethod.GET)
	public String makebook() {
		return "main/makebook";
	}
	
	@RequestMapping(value = "util/snsTest", method = RequestMethod.GET)
	public String snsTest() {
		return "util/snsTest2";
	}
}
