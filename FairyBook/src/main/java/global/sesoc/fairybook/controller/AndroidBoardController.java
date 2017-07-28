package global.sesoc.fairybook.controller;

import java.util.ArrayList;

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

import global.sesoc.fairybook.dao.BoardDAO;
import global.sesoc.fairybook.mapper.BoardMapper;
import global.sesoc.fairybook.vo.PBoard;

@Controller
@RequestMapping("app")
public class AndroidBoardController {
	
	@Autowired
	BoardDAO dao;
	
	private static final Logger logger = LoggerFactory.getLogger(AndroidBoardController.class);
	
	@ResponseBody
	@RequestMapping(value = "boardList", method = RequestMethod.POST, produces="application/json;charset=UTF-8")
	public String getBoardList(){
		System.out.println("Android Board List");
		JSONObject jObject = new JSONObject();
		JSONArray jArray = new JSONArray();
		
		ArrayList<PBoard> bList = new ArrayList<>();
		bList = dao.getList();
		
		for (int i = 0; i <= bList.size(); i++) {
			JSONObject sObject = new JSONObject();
			try{
			sObject.put("boardnum", bList.get(i).getBoardnum());
			sObject.put("id", bList.get(i).getId());
			sObject.put("title", bList.get(i).getTitle());
			sObject.put("content", bList.get(i).getContent());
			sObject.put("inputdate", bList.get(i).getInputdate());
			sObject.put("hit", bList.get(i).getHit());
			jArray.add(sObject);
			}catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}
		}
		try{
		jObject.put("boardList", jArray);
		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		String jsontext = jObject.toString();
		System.out.println("jsontext: " + jsontext);
		return jsontext;
	}
	
	@ResponseBody
	@RequestMapping(value = "writeBoard", method = RequestMethod.POST)
	public String writeBoard(@RequestBody String data) {

			System.out.println("test : " +data);
		
	
	
		return "true";
	}

}
