package global.sesoc.fairybook.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import global.sesoc.fairybook.mapper.OrderBookMapper;
import global.sesoc.fairybook.vo.OrderBook;

@Repository
public class OrderBookDAO {
	
	@Autowired SqlSession sqlSession;
	
	public int saveBookCover(OrderBook ob){
		int result = 0;
		OrderBookMapper mapper = sqlSession.getMapper(OrderBookMapper.class);
		result = mapper.saveBookCover(ob);
		return result;
	}

	public OrderBook getOrder(int selectionnum) {
		OrderBook result = new OrderBook();
		OrderBookMapper mapper = sqlSession.getMapper(OrderBookMapper.class);
		result = mapper.getOrder(selectionnum);
		return result;
	}
	
	public int deleteBookCover(int selectionnum){
		int result = 0;
		OrderBookMapper mapper = sqlSession.getMapper(OrderBookMapper.class);
		result = mapper.deleteBookCover(selectionnum);
		return result;
	}

	public String getStoryTitle(int selectionnum) {
		OrderBookMapper mapper = sqlSession.getMapper(OrderBookMapper.class);
		String result = mapper.getStoryTitle(selectionnum);
		return result;
	}
}
