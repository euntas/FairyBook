package global.sesoc.fairybook.vo;

/***
 * 주문완료된 정보
 * @author 이지나
 *
 */
public class ConfirmedOrderInfo {
	private int ordernum;		//주문번호
	private String title;		//주문책제목
	private String orderer;		//주문자
	private String receiver;	//수취인
	private String address;		//주소
	private String phone;		//전화번호
	private String orderdate;	//주문일
	
	public ConfirmedOrderInfo(){}

	public ConfirmedOrderInfo(int ordernum, String title, String orderer, String receiver, String address, String phone,
			String orderdate) {
		super();
		this.ordernum = ordernum;
		this.title = title;
		this.orderer = orderer;
		this.receiver = receiver;
		this.address = address;
		this.phone = phone;
		this.orderdate = orderdate;
	}

	public int getOrdernum() {
		return ordernum;
	}

	public void setOrdernum(int ordernum) {
		this.ordernum = ordernum;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getOrderer() {
		return orderer;
	}

	public void setOrderer(String orderer) {
		this.orderer = orderer;
	}

	public String getReceiver() {
		return receiver;
	}

	public void setReceiver(String receiver) {
		this.receiver = receiver;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getOrderdate() {
		return orderdate;
	}

	public void setOrderdate(String orderdate) {
		this.orderdate = orderdate;
	}

	@Override
	public String toString() {
		return "ConfirmedOrderInfo [ordernum=" + ordernum + ", title=" + title + ", orderer=" + orderer + ", receiver="
				+ receiver + ", address=" + address + ", phone=" + phone + ", orderdate=" + orderdate + "]";
	}
	
}
