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
import global.sesoc.fairybook.dao.ETCDAO;
import global.sesoc.fairybook.dao.StoryDAO;
import global.sesoc.fairybook.vo.Counselor;
import global.sesoc.fairybook.vo.ETC;
import global.sesoc.fairybook.vo.FBResource;
import global.sesoc.fairybook.vo.MBTI;
import global.sesoc.fairybook.vo.SelectionDetail;
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
	
	@Autowired
	StoryDAO storyDao;
	
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
			if (value > -1) {
				colorCount[value]++;
			}
		}
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
	 * etc 심리분석 - j, p 결과
	 * @param selectionNum
	 */
	@ResponseBody
	@RequestMapping(value="etcPatternAnalysis", method=RequestMethod.GET)
	public int etcPatternAnalysis(int selectionNum){
		logger.info("함수 들어옴");
		
		MBTI result = new MBTI();
		ArrayList<SelectionDetail> selectionDetail = storyDao.getSelectionDetail(selectionNum);
		result.setSelectionNum(selectionNum);
		
		// EI, SN, TF 분석 ==================================
		
		for (SelectionDetail sd : selectionDetail) {
			// EI 분석
			if(sd.getSceneNum() == 1){
				if(sd.getMyAnswer() == 1 || sd.getMyAnswer() == 3){
					result.setEI("e");
				}
				else{
					result.setEI("i");
				}
			}
			
			// SN 분석
			if(sd.getSceneNum() == 45){
				if(sd.getMyAnswer() == 2){
					result.setSN("s");
				}
				else{
					result.setSN("n");
				}
			}
			
			// TF 분석
			
			result.setTF("t");
			
			if(sd.getSceneNum() == 17){
				if(sd.getMyAnswer() == 1){
					result.setTF("f");
				}
			}
			
			if(sd.getSelectionNum() == 21){
				if(sd.getMyAnswer() == 1){
					result.setTF("f");
				}
			}
		}
		
		//=============================================
		
		//JP 분석 ======================================
		String resultJP = "j"; // 디폴트 j. 패턴에 해당하면 'p'를 반환.
		int temp = 0;
		
		/*int pattern[][][] = {
				{{1, 1, 1}, {1, 1, 1}, {1, 1, 1}, {1, 1, 1}},
				{{1, 1, 1}, {0, 0, 0}, {1, 1, 1}, {0, 0, 0}},
				{{0, 0, 0}, {1, 1, 1}, {0, 0, 0}, {1, 1, 1}},
				{{1, 0, 1}, {1, 0, 1}, {1, 0, 1}, {1, 0, 1}},
				{{0, 1, 0}, {0, 1, 0}, {0, 1, 0}, {0, 1, 0}},
				{{1, 0, 1}, {0, 1, 0}, {1, 0, 1}, {0, 1, 0}},
				{{0, 1, 0}, {1, 0, 1}, {0, 1, 0}, {1, 0, 1}}
		};*/
				
		ETC etc = dao.getETC(selectionNum);
	
		int mySel[][] = {
				{etc.getSelection1Color(), etc.getSelection2Color(), etc.getSelection3Color()}, 
				{etc.getSelection4Color(), etc.getSelection5Color(), etc.getSelection6Color()}, 
				{etc.getSelection7Color(), etc.getSelection8Color(), etc.getSelection9Color()},
				{etc.getSelection10Color(), etc.getSelection11Color(), etc.getSelection12Color()}
		};
		
		int flag = 1;
		
		for(int i=0; i<4; i++){
			if(checkArr(mySel[i][0], mySel[i][1], mySel[i][2]) == 0){
				flag = 0; 
				break;
			}
		}
		
		if(flag == 1){
			if(mySel[0][0] == mySel[2][0] && mySel[0][1] == mySel[2][1] && mySel[0][2] == mySel[2][2]
					&& mySel[1][0] == mySel[3][0] && mySel[1][1] == mySel[3][1] && mySel[1][2] == mySel[3][2]){
				resultJP = "p";
			}
		}
		
		result.setJP(resultJP);
		
		logger.info("마이셀: " + mySel + " flag: " + flag + "result: " + result);
		
		if(resultJP.equals("p"))
			temp = 1;
		
		
		//===================================
		dao.insertForMBTI(selectionNum, result);
		
		
		return temp;
	}
	
	/**
	 * MBTI 가져오기
	 * @param selectionNum
	 */
	@ResponseBody
	@RequestMapping(value="getMBTI", method=RequestMethod.GET)
	public MBTI getMBTI(int selectionNum){
		MBTI mbti = dao.getMBTI(selectionNum);
		logger.info("MBTI : " + mbti);
		return mbti;
	}
	
	public int checkArr(int a, int b, int c){
		int result = 0;
		
		if(a == b && b== c)
			result = 1;
		
		if(a == c && a != b)
			result = 1;
		
		return result;
	}
	
	/**
	 * avatar 심리분석
	 * @param selectionNum
	 */
	@ResponseBody
	@RequestMapping(value="avatarAnalysis", method=RequestMethod.GET)
	public ArrayList<FBResource> avatarAnalysis(int selectionNum){
		//fbresource테이블의 name, analysis가져와서 FBResource VO에 담기
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
	public ArrayList<FBResource> houseAnalysis(int selectionNum){
		//fbresource테이블의 name, analysis가져와서 FBResource VO에 담기
		ArrayList<FBResource> resources = new ArrayList<>();
		resources = dao.houseAnalysis(selectionNum);
		//FBResource VO 결과 jsp에 전송
		return resources;
	}
	
	@ResponseBody
	@RequestMapping(value="treeAnalysis",method=RequestMethod.GET)
	public FBResource treeAnalysis(int selectionNum){
		FBResource tree = dao.treeAnalysis(selectionNum);
		logger.info("tree:{}",tree);
		return tree;
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
