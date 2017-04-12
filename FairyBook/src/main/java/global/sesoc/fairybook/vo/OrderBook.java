package global.sesoc.fairybook.vo;

/**
 * 책 주문 vo
 * @author 이지나
 *
 */
public class OrderBook {

	int selectionnum;	 //선택 동화 번호
	String id; 			 //주문자
	String orderdate;	 //주문 날짜
	String bookcover;	 //책 표지 이미지 경로
	String currentstate; //주문상황
	
	public OrderBook(){}

	public OrderBook(int selectionnum, String id, String orderdate, String bookcover, String currentstate) {
		super();
		this.selectionnum = selectionnum;
		this.id = id;
		this.orderdate = orderdate;
		this.bookcover = bookcover;
		this.currentstate = currentstate;
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


	@Override
	public String toString() {
		return "OrderBook [selectionnum=" + selectionnum + ", id=" + id + ", orderdate=" + orderdate + ", bookcover="
				+ bookcover + ", currentstate=" + currentstate + "]";
	}
	
}
