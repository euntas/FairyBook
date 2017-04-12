package global.sesoc.fairybook.mapper;

import global.sesoc.fairybook.vo.OrderBook;

public interface OrderBookMapper {

	public int saveBookCover(OrderBook ob);

	public OrderBook getOrder(int selectionnum);

}
