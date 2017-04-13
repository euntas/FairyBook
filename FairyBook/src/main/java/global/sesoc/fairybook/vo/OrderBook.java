package global.sesoc.fairybook.vo;

/**
 * 책 주문 vo
 * @author 이지나
 *
 */
public class OrderBook {

	int ordernum; 		 //주문번호
	int selectionnum;	 //선택 동화 번호
	String id; 			 //주문자
	String orderdate;	 //주문 날짜
	String bookcover;	 //책 표지 이미지 경로
	String currentstate; //주문상황
	int price;			 //가격
	
	public OrderBook(){}

	public OrderBook(int ordernum, int selectionnum, String id, String orderdate, String bookcover,
			String currentstate, int price) {
		super();
		this.ordernum = ordernum;
		this.selectionnum = selectionnum;
		this.id = id;
		this.orderdate = orderdate;
		this.bookcover = bookcover;
		this.currentstate = currentstate;
		this.price = price;
	}

	public int getOrdernum() {
		return ordernum;
	}

	public void setOrdernum(int ordernum) {
		this.ordernum = ordernum;
	}

	public int getSelectionnum() {
		return selectionnum;
	}

	public void setSelectionnum(int selectionnum) {
		this.selectionnum = selectionnum;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getOrderdate() {
		return orderdate;
	}

	public void setOrderdate(String orderdate) {
		this.orderdate = orderdate;
	}

	public String getBookcover() {
		return bookcover;
	}

	public void setBookcover(String bookcover) {
		this.bookcover = bookcover;
	}

	public String getCurrentstate() {
		return currentstate;
	}

	public void setCurrentstate(String currentstate) {
		this.currentstate = currentstate;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	@Override
	public String toString() {
		return "OrderBook [ordernum=" + ordernum + ", selectionnum=" + selectionnum + ", id=" + id + ", orderdate="
				+ orderdate + ", bookcover=" + bookcover + ", currentstate=" + currentstate + ", price=" + price + "]";
	}

}
