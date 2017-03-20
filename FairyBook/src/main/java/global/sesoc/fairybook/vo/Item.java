package global.sesoc.fairybook.vo;

/**
 * 아이템 정보 - 동화 진행 중 선택되는 아이템들 
 * 
 * @author 이은지(2017.03.20 - ver1)
 *
 */
public class Item {

	private int selectionNum;		// 선택(회차) 번호
	private String itemName;		// 아이템 이름 (ex. 소지품)
	private String itemDetail;		// 아이템 정보 (ex. 엄마지갑)
	
	public Item() {
		// TODO Auto-generated constructor stub
	}

	public int getSelectionNum() {
		return selectionNum;
	}

	public void setSelectionNum(int selectionNum) {
		this.selectionNum = selectionNum;
	}

	public String getItemName() {
		return itemName;
	}

	public void setItemName(String itemName) {
		this.itemName = itemName;
	}

	public String getItemDetail() {
		return itemDetail;
	}

	public void setItemDetail(String itemDetail) {
		this.itemDetail = itemDetail;
	}

	@Override
	public String toString() {
		return "Item [selectionNum=" + selectionNum + ", itemName=" + itemName + ", itemDetail=" + itemDetail + "]";
	}
	
}
