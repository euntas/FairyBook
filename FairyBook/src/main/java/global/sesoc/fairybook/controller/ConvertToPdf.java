package global.sesoc.fairybook.controller;

import java.io.FileOutputStream;
import java.io.IOException;
import java.net.MalformedURLException;
import java.util.ArrayList;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.itextpdf.text.BadElementException;
import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.Image;
import com.itextpdf.text.PageSize;
import com.itextpdf.text.pdf.PdfWriter;

import global.sesoc.fairybook.dao.SlideDAO;

@RequestMapping("analysis")
@Controller
public class ConvertToPdf {
	
	private static final Logger logger = LoggerFactory.getLogger(ConvertToPdf.class);
	
	@Autowired
	SlideDAO dao;
	
	//책 표지 저장 경로
	private final String downloadPath = "/Users/kita/git/FairyBook/FairyBook/src/main/webapp/resources/img/scene/"; //파일 업로드 경로
	private final String uploadPath = "/Users/kita/git/FairyBook/FairyBook/src/main/webapp/resources/pdf/"; //파일 업로드 경로
			
	
	@RequestMapping(value="convertPage")
	public String convertPage(){
		return "convertPage";
	}
	
	@ResponseBody
	@RequestMapping(value="imgToPdf")
	public void imgToPdf(int selectionnum) throws MalformedURLException, IOException, DocumentException{
		logger.info("convert selectionnum:{}",selectionnum);
		ArrayList<Integer> scene = new ArrayList<>();
		scene = dao.getSlide(selectionnum);
		
		int indentation = 0;
		Document d = new Document(PageSize.A4.rotate());
		PdfWriter.getInstance(d, new FileOutputStream(uploadPath+"TEST.pdf"));
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
			//Image i = Image.getInstance(uploadPath+integer+".jpg");
		}
		/*Image img = Image.getInstance(uploadPath+"1.jpg");
		Image img1 = Image.getInstance(uploadPath+"2.jpg");*/
		/*d.add(img);
		d.add(img1);*/
		d.close();
	}

}
