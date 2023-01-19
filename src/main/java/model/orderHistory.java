package model;

public class orderHistory {

	private int orderSeq;
	private int itemNumber;
	private String buyerId;
	private String status;
	private String orderDate;
	
	
	public orderHistory(int itemNumber, String buyerId, String status, String orderDate) {
		super();
		this.itemNumber = itemNumber;
		this.buyerId = buyerId;
		this.status = status;
		this.orderDate = orderDate;
	}
	
	public int getOrderSeq() {
		return orderSeq;
	}
	public void setOrderSeq(int orderSeq) {
		this.orderSeq = orderSeq;
	}
	public int getItemNumber() {
		return itemNumber;
	}
	public void setItemNumber(int itemNumber) {
		this.itemNumber = itemNumber;
	}
	public String getBuyerId() {
		return buyerId;
	}
	public void setBuyerId(String buyerId) {
		this.buyerId = buyerId;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getOrderDate() {
		return orderDate;
	}
	public void setOrderDate(String orderDate) {
		this.orderDate = orderDate;
	}
	
	
}
