package global.sesoc.fairybook.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import global.sesoc.fairybook.mapper.OrderBookMapper;
import global.sesoc.fairybook.vo.ConfirmedOrderInfo;
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
	 * @param ob currentstate:(처음엔:'default')(표지만 만든 상황: '표지')(장바구니: '장바구니')(주문: '주문')
	 * @return
	 */
	public int saveOrder(OrderBook ob){
		int result = 0;
		OrderBookMapper mapper = sqlSession.getMapper(OrderBookMapper.class);
		result = mapper.saveOrder(ob);
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

	/**
	 * 주문 변경하기
	 * @param b
	 * @return
	 */
	public int updateOrder(OrderBook b) {
		OrderBookMapper mapper = sqlSession.getMapper(OrderBookMapper.class);
		int result = mapper.updateOrder(b);
		return result;
	}

	/**
	 * 처음 주문할때 ordernum 만들어주기
	 * @return
	 */
	public int setOrdernum() {
		int result = 0;
		OrderBookMapper mapper = sqlSession.getMapper(OrderBookMapper.class);
		result = mapper.setOrdernum();
		return result;
	}

	/**
	 * orderbook 객체 불러오기
	 * @param num 'ordernum''selectionnum': 안 가져오면 -1 가져옴
	 * @return
	 */
	public OrderBook getOrder(Map<String, Integer> num) {
		OrderBook result = new OrderBook();
		OrderBookMapper mapper = sqlSession.getMapper(OrderBookMapper.class);
		result = mapper.getOrder(num);
		return result;
	}

	/**
	 * 장바구니 리스트 가져오기
	 * @param id
	 * @return
	 */
	public ArrayList<OrderBook> cartList(String id) {
		ArrayList<OrderBook> result = new ArrayList<>();
		OrderBookMapper mapper = sqlSession.getMapper(OrderBookMapper.class);
		result = mapper.cartList(id);
		return result;
	}
	
	/**
	 * 예전 책표지 가져오기
	 * @param data
	 * @return
	 */
	public ArrayList<Integer> lastBookCover(Map<String, Object> data) {
		ArrayList<Integer> result = new ArrayList<>();
		OrderBookMapper mapper = sqlSession.getMapper(OrderBookMapper.class);
		result = mapper.lastBookCover(data);
		return result;
	}

	/**
	 * 장바구니에서  삭제하기
	 * @param ordernum
	 * @return
	 */
	public int deleteOrder(int ordernum) {
		int result = 0;
		OrderBookMapper mapper = sqlSession.getMapper(OrderBookMapper.class);
		result = mapper.deleteOrder(ordernum);
		return result;
	}

	/**
	 * 주문내역 가져오기
	 * @param id
	 * @return
	 */
	public ArrayList<ConfirmedOrderInfo> getConfirmed(String id) {
		ArrayList<ConfirmedOrderInfo> result = new ArrayList<>();
		OrderBookMapper mapper = sqlSession.getMapper(OrderBookMapper.class);
		result = mapper.getConfirmed(id);
		return result;
	}

	/**
	 * 주문완료 내역 저장하기
	 * @param data
	 * @return
	 */
	public int insertConfirmedOrder(Map<String, Object> data) {
		int result = 0;
		OrderBookMapper mapper = sqlSession.getMapper(OrderBookMapper.class);
		result = mapper.insertConfirmedOrder(data);
		return result;
	}

	public ArrayList<Map<String, String>> getCoverResources(int ordernum) {
		ArrayList<Map<String, String>> result = new ArrayList<>();
		OrderBookMapper mapper = sqlSession.getMapper(OrderBookMapper.class);
		result = mapper.getCoverResources(ordernum);
		return result;
	}

	public void removeDefault(int selectionnum) {
		OrderBookMapper mapper = sqlSession.getMapper(OrderBookMapper.class);
		mapper.removeDefault(selectionnum);
	}

}
