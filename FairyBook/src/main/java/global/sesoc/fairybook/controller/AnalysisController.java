package global.sesoc.fairybook.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import global.sesoc.fairybook.dao.AnalysisDAO;
import global.sesoc.fairybook.vo.Counselor;
import global.sesoc.fairybook.vo.FBResource;
import global.sesoc.fairybook.vo.SolvedQuiz;

/**
 * 심리 분석 Controller
 * @author 이지나 3/20
 * 색 심리분석, 아바타 심리분석, 집 심리분석
 * 부모 회원으로 로그인 되어있을 경우에만
 */
@Controller
@RequestMapping(value="analysis")
public class AnalysisController {

	private static final Logger logger = LoggerFactory.getLogger(AnalysisController.class);
	
	@Autowired
	AnalysisDAO dao;
	/**
	 * 결과 페이지로 이동
	 * @return
	 */
	@RequestMapping(value="storyAnalysis", method=RequestMethod.GET)
	public String analysisPage(int selectionNum, HttpSession session){
		session.setAttribute("selectionNum", selectionNum);
		
		System.out.println("세션에 selectionNum : " + selectionNum + "저장됨.");
		
		return "story/storyAnalysis";
	}

	/**
	 * color에 대한 그래프
	 * @param selectionNum
	 */
	@ResponseBody
	@RequestMapping(value="colorGraph", method=RequestMethod.GET)
	public Map<String, Object> colorGraph(int selectionNum){
		Map<String, Object> result = new HashMap<>();
		//colorcount테이블에서 selectionNum으로 colorname과 colorcount가져오기 colorcount내림차순으로
		ArrayList<String> colorName = new ArrayList<>();
		colorName = dao.getColorName();
		result.put("colorName", colorName);
		
		logger.info("colorGraph");
		Map<String, Integer> color = new HashMap<>();
		Integer[] colorCount = new Integer[colorName.size()];
		for (int i = 0; i < colorCount.length; i++) {
			colorCount[i]=0;
		}
		color = dao.getColorData(selectionNum);
		logger.info("color??:{}",color);
		for (String key : color.keySet()) {
			int value = Integer.parseInt(String.valueOf(color.get(key)));
			colorCount[value]++;
		}
		logger.info("colorcount:{}",colorCount);
		result.put("colorCount", colorCount);
		//colorname, colorcount보내기 - 결과jsp로
		return result;
	}
	
	/**
	 * color 심리분석
	 * @param
	 */
	@ResponseBody
	@RequestMapping(value="colorAnalysis", method=RequestMethod.GET
			,produces = "application/text; charset=utf8")
	public String colorAnalysis(int colornum){
		//colorcount테이블에서 selectionNum으로 colorname가져오기 colorcount내림차순으로
		//fbresource테이블의 name컬럼과 colorname이 같을 때, fbresource테이블의 name, analysis가져와서 FBResource VO에 담기
		String analysis = "";
		analysis = dao.getColorAnalysis(colornum);
		logger.info("color analysis:{}",analysis);
		//FBResource VO 결과 jsp에 전송
		return analysis;
	}
	
	/**
	 * avatar 심리분석
	 * @param selectionNum
	 */
	@ResponseBody
	@RequestMapping(value="avatarAnalysis", method=RequestMethod.GET)
	public ArrayList<FBResource> avatarAnalysis(int selectionNum){
		//selectionNum으로 MADEAVATAR테이블에서 resourcenum가져오기
		int resourcenum = 0;
		//resourcenum 이용해서 fbresource테이블의 name, analysis가져와서 FBResource VO에 담기
		ArrayList<FBResource> resources = new ArrayList<>();
		resources = dao.avatarAnalysis(selectionNum);
		for (FBResource fbResource : resources) {
			System.out.println(fbResource);
		}
		//FBResource VO 결과 jsp에 전송
		return resources;
	}
	
	/**
	 * house 심리분석
	 * @param selectionNum
	 */
	@ResponseBody
	@RequestMapping(value="houseAnalysis", method=RequestMethod.GET)
	public void houseAnalysis(int selectionNum){
		//selectionNum으로 MADEHOUSER테이블에서 resourcenum가져오기
		int resourcenum = 0;
		//resourcenum 이용해서 fbresource테이블의 name, analysis가져와서 FBResource VO에 담기
		FBResource fb = getAnalysis(resourcenum);
		
		//FBResource VO 결과 jsp에 전송
	}
	
	/**
	 * etc 심리분석
	 * @param selectionNum
	 */
	@ResponseBody
	@RequestMapping(value="etcAnalysis", method=RequestMethod.GET)
	public void etcAnalysis(int selectionNum){
		//selectionNum으로 ETC테이블에서 resourcenum가져오기
		int resourcenum = 0;
		//resourcenum 이용해서 fbresource테이블의 name, analysis가져와서 FBResource VO에 담기
		FBResource fb = getAnalysis(resourcenum);
		
		//FBResource VO 결과 jsp에 전송
	}
	
	@ResponseBody
	@RequestMapping(value="getQuizResult",method=RequestMethod.POST)
	public ArrayList<SolvedQuiz> getQuizResult(int selectionNum){
		logger.info("quizresult:{}",selectionNum);
		ArrayList<SolvedQuiz> quizList = new ArrayList<>();
		quizList = dao.getQuizResult(selectionNum);
		for (SolvedQuiz solvedQuiz : quizList) {
			logger.info("q:{}",solvedQuiz);
		}
		logger.info("??:{}",quizList);
		return quizList;
	}
	
	/**
	 * resourcenum으로 FBResource객체 불러오기
	 * @param resourcenum
	 * @return FBResource객체
	 */
	public FBResource getAnalysis(int resourcenum){
		FBResource result = new FBResource();
		
		return result;
	}
	
	/**
	 * 병원 검색 및 상담신청으로 이동
	 * @return 병원검색페이지
	 */
	@RequestMapping(value="counsel", method=RequestMethod.GET)
	public String counsel(){
		
		return "analysis/counsel";
		
	}
	
	/**
	 * 지역(대분류)에 따른 병원 검색
	 * @param region
	 * @param model
	 * @return 해당 지역 병원
	 */
	
	@ResponseBody
	@RequestMapping(value="counsel", method=RequestMethod.POST)
	public ArrayList<Counselor> counsel(String region, Model model){
		ArrayList<Counselor> hospital = dao.selectHospital(region);	
		return hospital;
		
	}
	
	/**
	 * 지역(소분류)에 따른 병원 검색
	 * @param country
	 * @param model
	 * @return 해당 지역 병원
	 */
	@ResponseBody
	@RequestMapping(value="counsel1", method=RequestMethod.POST)
	public Counselor counsel1(String country, Model model){
		
		Counselor hospital = dao.selectHospital1(country);
		
		
		return hospital;
		
	}
	
}
