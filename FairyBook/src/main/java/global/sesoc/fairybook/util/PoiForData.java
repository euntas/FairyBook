package global.sesoc.fairybook.util;

import static org.hamcrest.CoreMatchers.instanceOf;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.math.BigDecimal;
import java.util.*;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.apache.log4j.chainsaw.Main;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import global.sesoc.fairybook.dao.ExcelDAO;
import global.sesoc.fairybook.dao.StoryDAO;
import global.sesoc.fairybook.mapper.ExcelMapper;
import global.sesoc.fairybook.vo.Quiz;

public class PoiForData {
	
	private static final String FILE_NAME = "MyFirstExcel.xlsx";
	
	@Autowired
	SqlSession sqlSession;
	
	public PoiForData() {
		// TODO Auto-generated constructor stub
	}
	
	/*
	 * Quiz 테이블에 데이터 저장 위함.
	 */
	public ArrayList<Quiz> DataForQuiz(){

		// 엑셀파일
		//File file = new File("quizData.xlsx");
		File file = new File("C:/Users/kita/git/FairyBook/FairyBook/src/main/webapp/WEB-INF/quizData.xlsx");

		// 엑셀 파일 오픈
		XSSFWorkbook wb = null;
		/*Workbook wb = null;
		try {
			wb = new XSSFWorkbook(new FileInputStream("quizData.xlsx"));
		} catch (FileNotFoundException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		} catch (IOException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}*/
		try {
			wb = new XSSFWorkbook(new FileInputStream(file));
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		// HashMap 으로 이루어진 List 객체 생성 
		ArrayList<Quiz> listQuizData = new ArrayList<Quiz>();

		for (Row row : wb.getSheetAt(0)) {

			// 위의 1줄은 건너뛴다.
			if (row.getRowNum() < 1) {
				continue;
			}
			
			int quiznum = (int) row.getCell(0).getNumericCellValue();
			String question = row.getCell(1).getStringCellValue(); 
			String select1 = row.getCell(2).getStringCellValue(); 
			String select2 = row.getCell(3).getStringCellValue(); 
			String select3 = row.getCell(4).getStringCellValue(); 
			String select4 = row.getCell(5).getStringCellValue(); 
			int answer = (int) row.getCell(6).getNumericCellValue();
			
			listQuizData.add(new Quiz(quiznum, question, select1, select2, select3, select4, answer));
			
		}
		
		for(int i=0; i<listQuizData.size(); i++){
			System.out.println(i +"번째 : " + listQuizData.get(i));
		}
		
		/*ExcelMapper mapper = sqlSession.getMapper(ExcelMapper.class);
		mapper.insertQuizTable(listQuizData);*/
		// 테이블에 이미 들어가 있는 데이터들을 삭제한다.
		//dao.clearQuizTable();
		// 테이블에 데이터를 새로 입력한다.
		//int resInsert = dao.insertQuizTable(listQuizData);
		
		return listQuizData;
	}
	
	public void testtest(){
		XSSFWorkbook workbook = new XSSFWorkbook();
        XSSFSheet sheet = workbook.createSheet("Datatypes in Java");
        Object[][] datatypes = {
                {"Datatype", "Type", "Size(in bytes)"},
                {"int", "Primitive", 2},
                {"float", "Primitive", 4},
                {"double", "Primitive", 8},
                {"char", "Primitive", 1},
                {"String", "Non-Primitive", "No fixed size"}
        };

        int rowNum = 0;
        System.out.println("Creating excel");

        for (Object[] datatype : datatypes) {
            Row row = sheet.createRow(rowNum++);
            int colNum = 0;
            for (Object field : datatype) {
                Cell cell = row.createCell(colNum++);
                if (field instanceof String) {
                    cell.setCellValue((String) field);
                } else if (field instanceof Integer) {
                    cell.setCellValue((Integer) field);
                }
            }
        }

        try {
            FileOutputStream outputStream = new FileOutputStream(FILE_NAME);
            workbook.write(outputStream);
            workbook.close();
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }

        System.out.println("Done");
	}
	
	
	/*
	 * main 메소드
	 */
	public static void main(String[] args) {
		/*PoiForData pf = new PoiForData();
		pf.DataForQuiz();*/
		
		 
	   }

}
