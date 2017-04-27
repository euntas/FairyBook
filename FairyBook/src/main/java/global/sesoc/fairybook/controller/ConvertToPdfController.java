package global.sesoc.fairybook.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.net.MalformedURLException;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
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
import com.itextpdf.text.Image;
import com.itextpdf.text.PageSize;
import com.itextpdf.text.pdf.PdfWriter;

import global.sesoc.fairybook.dao.OrderBookDAO;
import global.sesoc.fairybook.dao.SlideDAO;
import global.sesoc.fairybook.util.FileService;

@RequestMapping("pdf")
@Controller
public class ConvertToPdfController {
	
	private static final Logger logger = LoggerFactory.getLogger(ConvertToPdfController.class);
	
	@Autowired
	SlideDAO dao;
	
	@Autowired
	OrderBookDAO oDao;
	
	String fileName;
	
	//책 표지 저장 경로
	private final String downloadPath = "/Users/kita/git/FairyBook/FairyBook/src/main/webapp/resources/img/scene/"; //파일 업로드 경로
	private final String uploadPath = "/Users/kita/git/FairyBook/FairyBook/src/main/webapp/resources/pdf/"; //파일 업로드 경로
			
	
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
	
