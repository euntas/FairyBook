package global.sesoc.fairybook.vo;

/**
 * 집 정보
 * 
 * @author 하성걸(2017.03.27 - ver1)
 *
 */
public class House {
	
	private int selectionNum;
	private int roof;
	private int door;
	private int window;
	private int chimney;
	private int yard;
	private int wall;
	
	public House() {
		// TODO Auto-generated constructor stub
	}

	public House(int selectionNum, int roof, int door, int window, int chimney, int yard, int wall) {
		super();
		this.selectionNum = selectionNum;
		this.roof = roof;
		this.door = door;
		this.window = window;
		this.chimney = chimney;
		this.yard = yard;
		this.wall = wall;
	}

	public int getSelectionNum() {
		return selectionNum;
	}

	public void setSelectionNum(int selectionNum) {
		this.selectionNum = selectionNum;
	}

	public int getRoof() {
		return roof;
	}

	public void setRoof(int roof) {
		this.roof = roof;
	}

	public int getDoor() {
		return door;
	}

	public void setDoor(int door) {
		this.door = door;
	}

	public int getWindow() {
		return window;
	}

	public void setWindow(int window) {
		this.window = window;
	}

	public int getChimney() {
		return chimney;
	}

	public void setChimney(int chimney) {
		this.chimney = chimney;
	}

	public int getYard() {
		return yard;
	}

	public void setYard(int yard) {
		this.yard = yard;
	}

	public int getWall() {
		return wall;
	}

	public void setWall(int wall) {
		this.wall = wall;
	}

	@Override
	public String toString() {
		return "House [selectionNum=" + selectionNum + ", roof=" + roof + ", door=" + door + ", window=" + window
				+ ", chimney=" + chimney + ", yard=" + yard + ", wall=" + wall + "]";
	}

	
}
