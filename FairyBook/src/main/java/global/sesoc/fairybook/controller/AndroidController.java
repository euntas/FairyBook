package global.sesoc.fairybook.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.apache.jasper.tagplugins.jstl.core.ForEach;
import org.eclipse.jdt.internal.compiler.ast.ArrayAllocationExpression;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.Gson;

import global.sesoc.fairybook.dao.AnalysisDAO;
import global.sesoc.fairybook.dao.IDDAO;
import global.sesoc.fairybook.dao.SlideDAO;
import global.sesoc.fairybook.vo.FBResource;
import global.sesoc.fairybook.vo.MBTI;
import global.sesoc.fairybook.vo.MySelection;
import global.sesoc.fairybook.vo.SolvedQuiz;

@Controller
@RequestMapping("app")
public class AndroidController {

	@Autowired
	IDDAO loginDao;
	@Autowired
	AnalysisDAO quizDao;
	@Autowired
	SlideDAO slideDao;
	@Autowired
	AnalysisDAO analysisDao;
	
	private static final Logger logger = LoggerFactory.getLogger(StoryController.class);
	
	@ResponseBody
	@RequestMapping(value="login", method=RequestMethod.POST)
	public String jsontext(@RequestBody JSONObject loginStr){
		
	    System.out.println("전송받은 문자열   = " + loginStr);
	    
	    String id = loginStr.get("id").toString();
	    String password = loginStr.get("password").toString();
	        
	    System.out.println("읽은 id : " + id + " 읽은 password: " + password);
	    
	    //어린이 로그인 1, 부모로그인 2, ID없음 3, PW불일치 4
	    int result = loginDao.login(id, password);
	    
	    // 로그인 성공시 true, 실패시 false 반환
	    if(result == 2)
	    	return "true";
	    
	    if(result == 1)
	    	return "child";
	        
	    return "false";
	}
	
	@ResponseBody
	@RequestMapping(value="quiz", method=RequestMethod.POST, produces="application/json;charset=UTF-8")
	public String quiz(@RequestBody JSONObject selectionStr) {
		
		System.out.println(selectionStr);
		
		String str = selectionStr.get("selectionStr").toString();
		
		int selectionNum = Integer.parseInt(str);
		
		System.out.println("sn: " + selectionNum);
			ArrayList<SolvedQuiz> quizList = new ArrayList<>();
			quizList = quizDao.getQuizResult(selectionNum);
			
			Gson gson = new Gson();
			String result = gson.toJson(quizList);
			
			System.out.println("퀴즈리스트 갯수: " + quizList.size());
			
			System.out.println("111 " + result);
			return result;
	}
	
	@ResponseBody
	@RequestMapping(value="getResultSelectionNum", method=RequestMethod.POST)
	public String getResultSelectionNum(@RequestBody JSONObject loginId){
		
	    System.out.println("전송받은 문자열   = " + loginId.toString());
	    
	    String id = loginId.get("loginId").toString();
	        
	    System.out.println(" 읽은 test: " + id);
	    
	    ArrayList<MySelection> yourStoryList = null;
		yourStoryList = slideDao.getMyStoryList(id);
		
		/*ArrayList<MySelection> ml = new ArrayList<>();
		ml.add(new MySelection(1234, "user", 496, "sd", "ed", "y"));*/
		
		Gson gson = new Gson();
		String result = gson.toJson(yourStoryList);
	        
	    return result;
	}
	
	@ResponseBody
	@RequestMapping(value="getMBTIResult", method=RequestMethod.POST, produces="application/json;charset=UTF-8")
	public String getMBTIResult(@RequestBody JSONObject selectionNum){
		MBTI mbti = analysisDao.getMBTI(Integer.parseInt(selectionNum.get("selectionNum").toString()));
		logger.info("MBTI : " + mbti);
		
		String result = "";
		result = mbti.getEI() + mbti.getSN() + mbti.getTF() + mbti.getJP();
		result = result.toUpperCase();
		
		logger.info("mbti type:{}",result);
		
		String analysis = analysisDao.getMBTIAnalysis(result);
		logger.info("mbti analysis:{}",analysis);
		
		Map<String, String> mbtiData = new HashMap<>();
		mbtiData.put("mbtiType", result);
		mbtiData.put("mbtiAnalysis", analysis);
		
		Gson gson = new Gson();
		String mbtiResult = gson.toJson(mbtiData);
		
		return mbtiResult;
	}
	
	@ResponseBody
	@RequestMapping(value="getHTPTreeResult", method=RequestMethod.POST, produces="application/json;charset=UTF-8")
	public String getHTPTreeResult(@RequestBody JSONObject selectionNum){
		
		FBResource htpTree = analysisDao.treeAnalysis(Integer.parseInt(selectionNum.get("selectionNum").toString()));
		
		Map<String, FBResource> htpTreeData = new HashMap<>();
		htpTreeData.put("htpTree", htpTree);
		
		Gson gson = new Gson();
		String htpTreeResult = gson.toJson(htpTreeData);
		
		return htpTreeResult;
	}
	
	@ResponseBody
	@RequestMapping(value="getColorResult", method=RequestMethod.POST, produces="application/json;charset=UTF-8")
	public String getColorResult(@RequestBody JSONObject selectionNum){
		
		int selecNum = Integer.parseInt(selectionNum.get("selectionNum").toString());
		
		Map<String, Object> result = new HashMap<>();
		//colorcount테이블에서 selectionNum으로 colorname과 colorcount가져오기 colorcount내림차순으로
		ArrayList<String> colorName = new ArrayList<>();
		colorName = analysisDao.getColorName();
		result.put("colorName", colorName);
		
		logger.info("colorGraphAndoid");
		Map<String, Integer> color = new HashMap<>();
		Integer[] colorCount = new Integer[colorName.size()];
		for (int i = 0; i < colorCount.length; i++) {
			colorCount[i]=0;
		}
		
		color = analysisDao.getColorData(selecNum);
		logger.info("color??:{}",color);

		String[] colorAnalysis = new String[colorName.size()];
		
		for (String key : color.keySet()) {
			int value = Integer.parseInt(String.valueOf(color.get(key)));
			if (value > -1) {
				colorCount[value]++;
				colorAnalysis[value] = analysisDao.getColorAnalysis(value);
			}
		}
		
		
		result.put("colorCount", colorCount);
		result.put("colorAnalysis", colorAnalysis);
		
		
		Gson gson = new Gson();
		String colorResult = gson.toJson(result);
		
		logger.info(colorResult);
		
		return colorResult;
	}
			
	@ResponseBody
	@RequestMapping(value="getHouseResult", method=RequestMethod.POST, produces="application/json;charset=UTF-8")
	public String getHouseResult(@RequestBody JSONObject selectionNum){
		
		ArrayList<FBResource> resources = new ArrayList<>();
		resources = analysisDao.houseAnalysis(Integer.parseInt(selectionNum.get("selectionNum").toString()));
		
		Map<String, FBResource> houseData = new HashMap<>();

		for (FBResource fbRes : resources) {
		//	jo.put(fbRes.getName(), fbRes.getAnalysis());
			if(fbRes.getName().startsWith("roof"))
				houseData.put("roof", fbRes);
			
			else if(fbRes.getName().startsWith("wall"))
				houseData.put("wall", fbRes);
			
			else if(fbRes.getName().startsWith("window"))
				houseData.put("window", fbRes);
			
			else if(fbRes.getName().startsWith("chimney"))
				houseData.put("chimney", fbRes);
			
			else if(fbRes.getName().startsWith("door"))
				houseData.put("door", fbRes);
			
		}
		
		
		Gson gson = new Gson();
		String houseResult = gson.toJson(houseData);
		
		System.out.println(houseResult);
		
		return houseResult;
	}

	
}
