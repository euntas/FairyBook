package global.sesoc.fairybook.controller;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.net.MalformedURLException;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.UUID;

import org.apache.commons.codec.binary.Base64;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mock.web.MockMultipartFile;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.itextpdf.text.BadElementException;
import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.Image;
import com.itextpdf.text.PageSize;
import com.itextpdf.text.pdf.PdfWriter;

import global.sesoc.fairybook.dao.SlideDAO;
import global.sesoc.fairybook.util.FileService;

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
		}
		d.close();
		
		
		
		File file = new File(uploadPath+"TEST.pdf");
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
			
		}
	}
    
}
	

