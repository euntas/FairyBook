package global.sesoc.fairybook.mapper;

import java.util.ArrayList;
import java.util.Map;

import global.sesoc.fairybook.vo.ConfirmedOrderInfo;
import global.sesoc.fairybook.vo.OrderBook;

/***
 * 책표지 만들기 및 주문 Mapper
 * @author 이지나
 *
 */
public interface OrderBookMapper {

	public int saveOrder(OrderBook ob); //저장

	public int deleteBookCover(int ordernum); //삭제

	public String getStoryTitle(int selectionnum); //제목 가져오기

	public int updateOrder(OrderBook b); //업데이트

	public int setOrdernum(); //주문번호 주기

	public OrderBook getOrder(Map<String, Integer> num); //orderbook객체 불러오기

	public ArrayList<OrderBook> cartList(String id); //장바구니 리스트 가져오기

	public ArrayList<Integer> lastBookCover(Map<String, Object> data); //예전 책표지 가져오기

	public int deleteOrder(int ordernum); //장바구니 삭제하기

	public ArrayList<ConfirmedOrderInfo> getConfirmed(String id); //주문내역 리스트 가져오기

	public int insertConfirmedOrder(Map<String, Object> data); //주문완료 시 주문내역에 저장하기

	public ArrayList<Map<String, String>> getCoverResources(int ordernum);

}
