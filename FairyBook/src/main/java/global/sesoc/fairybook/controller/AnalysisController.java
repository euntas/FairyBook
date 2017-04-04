package global.sesoc.fairybook.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import global.sesoc.fairybook.vo.FBResource;

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
	
	/**
	 * 결과 페이지로 이동
	 * @return
	 */
	@RequestMapping(value="storyAnalysis", method=RequestMethod.GET)
	public String analysisPage(){
		return "story/storyAnalysis";
	}
	
	/**
	 * color에 대한 그래프
	 * @param selectionNum
	 */
	@ResponseBody
	@RequestMapping(value="colorGraph", method=RequestMethod.GET)
	public void colorGraph(int selectionNum){
		//colorcount테이블에서 selectionNum으로 colorname과 colorcount가져오기 colorcount내림차순으로
		//이때 colorcount가 0인 것은 가져오지 않는다.
		
		//colorname, colorcount보내기 - 결과jsp로
	}
	
	/**
	 * color 심리분석
	 * @param selectionNum
	 */
	@ResponseBody
	@RequestMapping(value="colorAnalysis", method=RequestMethod.GET)
	public void colorAnalysis(int selectionNum){
		//colorcount테이블에서 selectionNum으로 colorname가져오기 colorcount내림차순으로
		//fbresource테이블의 name컬럼과 colorname이 같을 때, fbresource테이블의 name, analysis가져와서 FBResource VO에 담기
		
		//FBResource VO 결과 jsp에 전송
		
	}
	
	/**
	 * avatar 심리분석
	 * @param selectionNum
	 */
	@ResponseBody
	@RequestMapping(value="avatarAnalysis", method=RequestMethod.GET)
	public void avatarAnalysis(int selectionNum){
		//selectionNum으로 MADEAVATAR테이블에서 resourcenum가져오기
		int resourcenum = 0;
		//resourcenum 이용해서 fbresource테이블의 name, analysis가져와서 FBResource VO에 담기
		FBResource fb = getAnalysis(resourcenum);
		//FBResource VO 결과 jsp에 전송
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
	
	/**
	 * resourcenum으로 FBResource객체 불러오기
	 * @param resourcenum
	 * @return FBResource객체
	 */
	public FBResource getAnalysis(int resourcenum){
		FBResource result = new FBResource();
		
		return result;
	}
	
	
}
