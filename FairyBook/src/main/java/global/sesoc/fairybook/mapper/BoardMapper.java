package global.sesoc.fairybook.mapper;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;

import global.sesoc.fairybook.vo.PBoard;

public interface BoardMapper {
	
	//게시글 목록
	public ArrayList<PBoard> list(RowBounds rb);
	
	//게시글 입력
	public int insertBoard(PBoard b);

	//게시글 개수
	public int count();
}
