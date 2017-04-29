package global.sesoc.fairybook.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.net.MalformedURLException;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.Font;
import com.itextpdf.text.Image;
import com.itextpdf.text.PageSize;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.pdf.BaseFont;
import com.itextpdf.text.pdf.PdfWriter;

import global.sesoc.fairybook.dao.AnalysisDAO;
import global.sesoc.fairybook.dao.OrderBookDAO;
import global.sesoc.fairybook.dao.SlideDAO;
import global.sesoc.fairybook.util.FileService;
import global.sesoc.fairybook.vo.FBResource;

@RequestMapping("pdf")
@Controller
public class ConvertToPdfController {
	
	private static final Logger logger = LoggerFactory.getLogger(ConvertToPdfController.class);
	
	@Autowired
	SlideDAO dao;
	
	@Autowired
	OrderBookDAO oDao;
	
	@Autowired
	AnalysisDAO aDao;
	
	String fileName;
	
	//책 표지 저장 경로
	private final String downloadPath = "/Users/kita/git/FairyBook/FairyBook/src/main/webapp/resources/img/scene/"; //파일 업로드 경로
	private final String uploadPath = "/Users/kita/git/FairyBook/FairyBook/src/main/webapp/resources/"; //파일 업로드 경로
			
	
	@RequestMapping(value="convertPage")
	public String convertPage(int selectionNum,Model model){
		model.addAttribute("selectionnum", selectionNum);
		return "convertPage";
	}
	
	@ResponseBody
	@RequestMapping(value="imgToPdf")
	public void imgToPdf(int selectionnum, HttpServletResponse response) throws MalformedURLException, IOException, DocumentException{
		logger.info("convert selectionnum:{}",selectionnum);
		String title = oDao.getStoryTitle(selectionnum);
		String name=  UUID.randomUUID().toString();
		fileName = title+name;
		
		ArrayList<Integer> scene = new ArrayList<>();
		scene = dao.getSlide(selectionnum);
		
		int indentation = 0;
		Document d = new Document(PageSize.A4.rotate(),0,0,0,0);
		PdfWriter.getInstance(d, new FileOutputStream(uploadPath+fileName+".pdf"));
		d.open(); //3508,2480
		float scaler = ((d.getPageSize().getWidth() - d.leftMargin()
	               - d.rightMargin() - indentation) / 3508) * 100;
		for (Integer integer : scene) {
			Image img = null;
			if (Integer.parseInt(Integer.toString(integer))<10) {
				img = Image.getInstance(downloadPath+"scene0"+integer+".jpg");
				img.scalePercent(scaler);
			}else{
				img = Image.getInstance(downloadPath+"scene"+integer+".jpg");
				img.scalePercent(scaler);
			}
			d.add(img);
		}
		d.close();
		/*File file = new File(uploadPath+"TEST.pdf");
		FileInputStream in = new FileInputStream(file);
		ByteArrayOutputStream bout = new ByteArrayOutputStream();
		
		byte[] by = new byte[(int)file.length()];
		int len = 0;
		
		while( (len=in.read(by)) != -1)
			bout.write(by, 0, len);
		// 최종적인  byte[]로....   
              
		bout.close();
		in.close();
		
		
		String name=  UUID.randomUUID().toString()+".pdf";
		Path path = Paths.get(uploadPath+name);
		String contentType = "application/pdf";
		MultipartFile mf = new MockMultipartFile(name, name, contentType, by);
		if (!mf.isEmpty()) {
			String savedFile = FileService.saveFile(mf, uploadPath);
			//db에 넣어줄 path
			//coverPath = savedFile;
			
		}*/
	}
	
	@ResponseBody
	@RequestMapping(value="analysisToPdf")
	public void analysisToPdf(int selectionNum, HttpServletResponse response) 
							throws DocumentException, IOException{
		String title = "심리검사결과";
		String name=  UUID.randomUUID().toString();
		fileName = title+name;
		
		BaseFont objBaseFont = BaseFont.createFont("/Users/kita/git/FairyBook/FairyBook/src/main/webapp/resources/font/malgun.ttf", BaseFont.IDENTITY_H, BaseFont.EMBEDDED);
		Font objfont = new Font(objBaseFont, 12);
		Font titlefont = new Font(objBaseFont, 33);
		Font subtitlefont = new Font(objBaseFont, 20);
		Font partfont = new Font(objBaseFont, 15);
		Font whitespacefont = new Font(objBaseFont, 5);
		ArrayList<FBResource> avatarResources = new ArrayList<>();
		avatarResources = aDao.avatarAnalysis(selectionNum);
		
		ArrayList<FBResource> houseResources = new ArrayList<>();
		houseResources = aDao.houseAnalysis(selectionNum);
		
		FBResource treeResources = aDao.treeAnalysis(selectionNum);
		
		Map<String, Object> result = new HashMap<>();
		//colorcount테이블에서 selectionNum으로 colorname과 colorcount가져오기 colorcount내림차순으로
		ArrayList<String> colorName = new ArrayList<>();
		colorName = aDao.getColorName();
		result.put("colorName", colorName);
		
		logger.info("colorGraph");
		Map<String, Integer> color = new HashMap<>();
		Integer[] colorCount = new Integer[colorName.size()];
		for (int i = 0; i < colorCount.length; i++) {
			colorCount[i]=0;
		}
		color = aDao.getColorData(selectionNum);
		logger.info("color??:{}",color);
		for (String key : color.keySet()) {
			int value = Integer.parseInt(String.valueOf(color.get(key)));
			if (value > -1) {
				colorCount[value]++;
			}
		}
		result.put("colorCount", colorCount);
		
		
		
		int indentation = 0;
		Document d = new Document(PageSize.A4.rotate(),30F,30F,30F,30F);
		PdfWriter.getInstance(d, new FileOutputStream(uploadPath+fileName+".pdf"));
		d.open(); //3508,2480
		float scaler = ((d.getPageSize().getWidth() - d.leftMargin()
	               - d.rightMargin() - indentation) / 3508) * 100;
		
		d.add(new Paragraph("색채 테스트 검사결과", titlefont));
		d.add(new Paragraph("\n", subtitlefont));
		
		for(int i=0; i<colorName.size(); i++){
			String eachColorName = colorName.get(i);
			String col = eachColorName.substring(0, 3);
			double total = color.size();
			double eachColor = colorCount[i];
			String colorAnalysis2 = aDao.getColorAnalysis(i);
			String colorAnalysis1 = colorAnalysis2.replace("<br>&nbsp", " ");
			String colorAnalysis = colorAnalysis1.replace("&nbsp", " ");
			String percentage = String.valueOf(Math.round(eachColor/total*1000)/10.0);
			logger.info("test : "+percentage);
			
			switch (col) {
			case "bla":
				d.add(new Paragraph("검정 ("+percentage+"%)", partfont));
				d.add(new Paragraph(colorAnalysis, objfont));
				d.add(new Paragraph("\n", objfont));
				break;
			case "red":
				d.add(new Paragraph("빨강 ("+percentage+"%)", partfont));
				d.add(new Paragraph(colorAnalysis, objfont));
				d.add(new Paragraph("\n", objfont));
				break;
			case "ora":
				d.add(new Paragraph("주황 ("+percentage+"%)", partfont));
				d.add(new Paragraph(colorAnalysis, objfont));
				d.add(new Paragraph("\n", objfont));
				break;
			case "yel":
				d.add(new Paragraph("노랑 ("+percentage+"%)", partfont));
				d.add(new Paragraph(colorAnalysis, objfont));
				d.add(new Paragraph("\n", objfont));
				break;
			case "gre":
				d.add(new Paragraph("초록 ("+percentage+"%)", partfont));
				d.add(new Paragraph(colorAnalysis, objfont));
				d.add(new Paragraph("\n", objfont));
				break;
			case "blu":
				d.add(new Paragraph("파랑 ("+percentage+"%)", partfont));
				d.add(new Paragraph(colorAnalysis, objfont));
				d.add(new Paragraph("\n", objfont));
				break;
			case "pur":
				d.add(new Paragraph("보라 ("+percentage+"%)", partfont));
				d.add(new Paragraph(colorAnalysis, objfont));
				d.add(new Paragraph("\n", objfont));
				break;
			case "whi":
				d.add(new Paragraph("흰색 ("+percentage+"%)", partfont));
				d.add(new Paragraph(colorAnalysis, objfont));
				d.add(new Paragraph("\n", objfont));
				break;
			case "gra":
				d.add(new Paragraph("회색 ("+percentage+"%)", partfont));
				d.add(new Paragraph(colorAnalysis, objfont));
				d.add(new Paragraph("\n", subtitlefont));
				break;
			default:
				break;
			}
			
		}
		
		d.add(new Paragraph("HTP테스트 검사결과", titlefont));
		d.add(new Paragraph("\n", subtitlefont));
		d.add(new Paragraph("아바타 검사결과", subtitlefont));
		d.add(new Paragraph("\n", whitespacefont));
		for(FBResource resource : avatarResources){
			String avatarName = resource.getName();
			String analysis = resource.getAnalysis();
			String part = avatarName.substring(0, 2);
			logger.info(part);
			switch (part) {
			case "mo":
				d.add(new Paragraph("입", partfont));
				d.add(new Paragraph(analysis, objfont));
				d.add(new Paragraph("\n", objfont));
				break;
			case "ha":
				d.add(new Paragraph("머리", partfont));
				d.add(new Paragraph(analysis, objfont));
				d.add(new Paragraph("\n", objfont));
				break;
			case "fa":
				d.add(new Paragraph("얼굴", partfont));
				d.add(new Paragraph(analysis, objfont));
				d.add(new Paragraph("\n", objfont));
				break;
			case "bo":
				break;
			case "ea":
				d.add(new Paragraph("귀", partfont));
				d.add(new Paragraph(analysis, objfont));
				d.add(new Paragraph("\n", objfont));
				break;
			case "ey":
				d.add(new Paragraph("눈", partfont));
				d.add(new Paragraph(analysis, objfont));
				d.add(new Paragraph("\n", objfont));
				break;
			case "no":
				d.add(new Paragraph("코", partfont));
				d.add(new Paragraph(analysis, objfont));
				d.add(new Paragraph("\n", subtitlefont));
				break;
			default:
				break;
			}
			
		
		}
		
		d.add(new Paragraph("집 검사결과", subtitlefont));
		d.add(new Paragraph("\n", whitespacefont));
		for(FBResource resource: houseResources){
			String houseName = resource.getName();
			String analysis = resource.getAnalysis();
			
			String part = houseName.substring(0, 2);
			
			switch (part) {
			case "ro":
				d.add(new Paragraph("지붕", partfont));
				d.add(new Paragraph(analysis, objfont));
				d.add(new Paragraph("\n", objfont));
				break;
			case "do":
				d.add(new Paragraph("문", partfont));
				d.add(new Paragraph(analysis, objfont));
				d.add(new Paragraph("\n", objfont));
				break;
			case "ch":
				d.add(new Paragraph("굴뚝", partfont));
				d.add(new Paragraph(analysis, objfont));
				d.add(new Paragraph("\n", objfont));
				break;
			case "wi":
				d.add(new Paragraph("창문", partfont));
				d.add(new Paragraph(analysis, objfont));
				d.add(new Paragraph("\n", subtitlefont));
				break;

			default:
				break;
			}
			
		}
		d.add(new Paragraph("나무 검사결과", subtitlefont));
		d.add(new Paragraph("\n", whitespacefont));
		String treeAnalysis = treeResources.getAnalysis();
		d.add(new Paragraph(treeAnalysis, objfont));
		
		
		d.close();
	
		
	}
	
	@RequestMapping(value="download",method=RequestMethod.GET)
	public String download(int selectionnum,HttpServletResponse response) throws IOException{
		logger.info("down selectionnum:{}",selectionnum);
		
		
		response.setContentType("application/octet-stream; charset=UTF-8");
		response.setHeader("Content-Disposition", "attachment;filename="
				+URLEncoder.encode(fileName+".pdf","UTF-8"));
		
		FileInputStream in = new FileInputStream(new File(uploadPath,fileName+".pdf"));
		ServletOutputStream out = response.getOutputStream(); //reponse객체에서 client까지의 outputstream을 가져온다
		
		FileCopyUtils.copy(in, out);  //in으로 읽어서 out으로 내보내기
		
		in.close();
		out.close();
		
		FileService.deleteFile(uploadPath+fileName+".pdf");
		
		return null;
	}
	
	
	
    
}
	
