package global.sesoc.fairybook.mapper;

import global.sesoc.fairybook.vo.OrderBook;

public interface OrderBookMapper {

	public int saveOrder(OrderBook ob); //저장

	public OrderBook existCover(int ordernum); //불러오기

	public int deleteBookCover(int ordernum); //삭제

	public String getStoryTitle(int selectionnum); //제목 가져오기

	public int updateOrder(OrderBook b); //업데이트

	public int getOrdernum();

	public int setOrdernum();

	public OrderBook getOrder(int ordernum);



}
