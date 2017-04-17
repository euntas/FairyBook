package global.sesoc.fairybook.mapper;

import java.util.ArrayList;
import java.util.Map;

import global.sesoc.fairybook.vo.OrderBook;

public interface OrderBookMapper {

	public int saveOrder(OrderBook ob); //저장

	public int deleteBookCover(int ordernum); //삭제

	public String getStoryTitle(int selectionnum); //제목 가져오기

	public int updateOrder(OrderBook b); //업데이트

	public int setOrdernum(); //주문번호 주기

	public OrderBook getOrder(Map<String, Integer> num); //orderbook객체 불러오기

	public ArrayList<OrderBook> cartList(String id);

	public ArrayList<Integer> lastBookCover(Map<String, Object> data);

	public ArrayList<OrderBook> orderList(String id);

	public int deleteOrder(int ordernum);

	public ArrayList<OrderBook> getConfirmed(String id);



}
