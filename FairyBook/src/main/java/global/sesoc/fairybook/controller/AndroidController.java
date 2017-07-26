package global.sesoc.fairybook.controller;

import java.util.ArrayList;

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
	    if(result == 1 || result == 2)
	    	return "true";
	        
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

	
}
