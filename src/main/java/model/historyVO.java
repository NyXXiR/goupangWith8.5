package model;

public class historyVO {

	private String orderSeq;
	private int itemNumber;
	private int itemCount;
	private String buyerid;
	private String status;
	private String orderDate;
	private String orderAddress;
	
	public historyVO() {
		super();
	}
	
	public historyVO(String buyerId, String orderSeq) {
		super();
		this.orderSeq = orderSeq;
		this.buyerid = buyerId;
	}


	public historyVO(String orderSeq, int itemNumber, String status, String orderDate) {
		super();
		this.orderSeq = orderSeq;
		this.itemNumber = itemNumber;
		this.status = status;
		this.orderDate = orderDate;
	}

	public String getOrderSeq() {
		return orderSeq;
	}

	public void setOrderSeq(String orderSeq) {
		this.orderSeq = orderSeq;
	}

	public int getItemNumber() {
		return itemNumber;
	}

	public void setItemNumber(int itemNumber) {
		this.itemNumber = itemNumber;
	}

	public int getItemCount() {
		return itemCount;
	}

	public void setItemCount(int itemCount) {
		this.itemCount = itemCount;
	}

	public String getBuyerid() {
		return buyerid;
	}

	public void setBuyer_id(String buyerid) {
		this.buyerid = buyerid;
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

	public String getOrderAddress() {
		return orderAddress;
	}

	public void setOrderAddress(String orderAddress) {
		this.orderAddress = orderAddress;
	}
	
}
