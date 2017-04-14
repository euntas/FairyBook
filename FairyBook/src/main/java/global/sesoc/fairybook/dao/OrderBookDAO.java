package global.sesoc.fairybook.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import global.sesoc.fairybook.mapper.OrderBookMapper;
import global.sesoc.fairybook.vo.OrderBook;

/**
 * 책주문 DAO
 * @author 이지나
 *
 */
@Repository
public class OrderBookDAO {
	
	@Autowired SqlSession sqlSession;
	
	/**
	 * 책표지 저장하기
	 * @param ob currentstate:(표지만 만든 상황: '표지')(장바구니: '장바구니')(주문: '주문')
	 * @return
	 */
	public int saveOrder(OrderBook ob){
		int result = 0;
		OrderBookMapper mapper = sqlSession.getMapper(OrderBookMapper.class);
		result = mapper.saveOrder(ob);
		return result;
	}

	/**
	 * 책 주문 객체 가져오기
	 * @param ordernum
	 * @return
	 */
	public OrderBook existCover(int ordernum) {
		OrderBook result = new OrderBook();
		OrderBookMapper mapper = sqlSession.getMapper(OrderBookMapper.class);
		result = mapper.existCover(ordernum);
		return result;
	}
	
	/**
	 * 전에 만들어놓은 표지있는지 확인하기
	 * @param ordernum
	 * @return
	 */
	public int deleteBookCover(int ordernum){
		int result = 0;
		OrderBookMapper mapper = sqlSession.getMapper(OrderBookMapper.class);
		result = mapper.deleteBookCover(ordernum);
		return result;
	}

	/**
	 * 주문 할 책 제목 가져오기
	 * @param selectionnum
	 * @return
	 */
	public String getStoryTitle(int selectionnum) {
		OrderBookMapper mapper = sqlSession.getMapper(OrderBookMapper.class);
		String result = mapper.getStoryTitle(selectionnum);
		return result;
	}

	public int updateOrder(OrderBook b) {
		OrderBookMapper mapper = sqlSession.getMapper(OrderBookMapper.class);
		int result = mapper.updateOrder(b);
		return result;
	}

	public int getOrdernum() {
		int result = 0;
		OrderBookMapper mapper = sqlSession.getMapper(OrderBookMapper.class);
		result = mapper.getOrdernum();
		return result;
	}

	public int setOrdernum() {
		int result = 0;
		OrderBookMapper mapper = sqlSession.getMapper(OrderBookMapper.class);
		result = mapper.setOrdernum();
		return result;
	}

	public OrderBook getOrder(int ordernum) {
		OrderBook result = new OrderBook();
		OrderBookMapper mapper = sqlSession.getMapper(OrderBookMapper.class);
		result = mapper.getOrder(ordernum);
		return result;
	}
}
