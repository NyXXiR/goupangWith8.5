package model;

public class historyVO {

	private String orderSeq;
	private int itemNumber;
	private int itemCount;
	private String buyerid;
	private String status;
	private String orderDate;
	private String buyerAddress;
	
	public historyVO() {
		super();
	}
	
	public historyVO(String buyerId, String orderSeq) {
		super();
		this.orderSeq = orderSeq;
		this.buyerid = buyerId;
	}


	@Override
	public String toString() {
		return "historyVO [orderSeq=" + orderSeq + ", itemNumber=" + itemNumber + ", itemCount=" + itemCount
				+ ", buyerid=" + buyerid + ", status=" + status + ", orderDate=" + orderDate + ", buyerAddress="
				+ buyerAddress + "]";
	}

	public historyVO(int itemNumber, int itemCount, String buyerid, String buyerAddress) {
			super();
			this.itemNumber = itemNumber;
			this.itemCount = itemCount;
			this.buyerid = buyerid;
			this.buyerAddress = buyerAddress;
	}
	
	public historyVO(String orderSeq, int itemNumber, String status, String orderDate) {
		super();
		this.orderSeq = orderSeq;
		this.itemNumber = itemNumber;
		this.status = status;
		this.orderDate = orderDate;
	}

	
	
	public historyVO(String orderSeq, int itemNumber, int itemCount, String buyerAddress, String status) {
		super();
		this.orderSeq = orderSeq;
		this.itemNumber = itemNumber;
		this.itemCount = itemCount;
		this.buyerAddress = buyerAddress;
		this.status = status;
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

	public String getBuyerAddress() {
		return buyerAddress;
	}

	public void setBuyerAddress(String buyerAddress) {
		this.buyerAddress = buyerAddress;
	}
	
}
