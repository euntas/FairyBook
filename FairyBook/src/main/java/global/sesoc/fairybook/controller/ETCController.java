package global.sesoc.fairybook.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import global.sesoc.fairybook.dao.ETCDAO;
import global.sesoc.fairybook.vo.Avatar;
import global.sesoc.fairybook.vo.ETC;
import global.sesoc.fairybook.vo.FBResource;

/**
 * @author 하성걸
 * 과자집 등 기타요소를 관리하는 컨트롤러입니다
 */
@Controller
@RequestMapping(value="objectMaker")
public class ETCController {
	
	private static final Logger logger = LoggerFactory.getLogger(ETCController.class);
	
	@Autowired
	ETCDAO dao;
	
	/**
	 * 기타 요소 페이지로 넘어갈 시
	 *  selectionNum을 읽어 해당 동화에 해당하는 etc 색칠 페이지를 보여준다
	 *  초기 etc 데이터를 생성, 이후에 업데이트 하는 방식으로 데이터 저장
	 */
	@RequestMapping(value = "etc", method = RequestMethod.GET)
	public String etcLoad(Model model, HttpSession session) {
		
		int storyNum = (int) session.getAttribute("currentStoryNum");
		int selectionNum = (int) session.getAttribute("myselectionNum");
		
		ArrayList<FBResource> etcList = dao.readETC(storyNum);
		
		model.addAttribute("storyNum", storyNum);
		model.addAttribute("selectionNum", selectionNum);
		model.addAttribute("etcList", etcList);

		return "objectMaker/etc";
	}

	/**
	 * 색깔 버튼을 눌렀을시
	 * @return 해당 색깔 이미지 경로
	 */
	@ResponseBody
	@RequestMapping(value = "callETCColor", method = RequestMethod.GET)
	public String callETCColor(int storyNum, int currentNum, String color) {
		String result = dao.readColor(storyNum, currentNum, color);
		logger.debug(result);
		return result;
	}
	
	/**
	 * 저장 버튼을 눌렀을시 
	 * 지금까지 선택한 아바타의 정보를 저장
	 * @return 올바르게 저장되면 house페이지로 이동, 아니면 다시 avatar페이지로 돌아감
	 */
	@ResponseBody
	@RequestMapping(value = "saveETC", method = RequestMethod.POST)
	public int saveETC(ETC etc, HttpSession session) {
		logger.debug(etc.toString());
		int result = 0;
		result = dao.saveETC(etc);
		
		System.out.println("저장되었을까요?? -- saveetc : " + result);
		
		return result;
	}
}
