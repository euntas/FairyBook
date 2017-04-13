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
		OrderBook result = null;
		OrderBookMapper mapper = sqlSession.getMapper(OrderBookMapper.class);
		result = mapper.getOrder(selectionnum);
		return result;
	}
}
