package model;

public class historyVO {

  private String orderSeq;
  private int itemNumber;
  private int itemCount;
  private String buyerId;
  private String status;
  private String orderDate;
  private String buyerAddress;

  public historyVO() {
    super();
  }

  public historyVO(String buyerId, String orderSeq) {
    super();
    this.orderSeq = orderSeq;
    this.buyerId = buyerId;
  }


  @Override
  public String toString() {
    return "historyVO [orderSeq=" + orderSeq + ", itemNumber=" + itemNumber + ", itemCount="
        + itemCount + ", buyerId=" + buyerId + ", status=" + status + ", orderDate=" + orderDate
        + ", buyerAddress=" + buyerAddress + "]";
  }

  public historyVO(int itemNumber, int itemCount, String buyerId, String buyerAddress) {
    super();
    this.itemNumber = itemNumber;
    this.itemCount = itemCount;
    this.buyerId = buyerId;
    this.buyerAddress = buyerAddress;
  }

  public historyVO(String orderSeq, int itemNumber, String status, String orderDate) {
    super();
    this.orderSeq = orderSeq;
    this.itemNumber = itemNumber;
    this.status = status;
    this.orderDate = orderDate;
  }



  public historyVO(String orderSeq, int itemNumber, int itemCount, String buyerAddress,
      String status) {
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

  public String getbuyerId() {
    return buyerId;
  }

  public void setbuyerId(String buyerId) {
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

  public String getBuyerAddress() {
    return buyerAddress;
  }

  public void setBuyerAddress(String buyerAddress) {
    this.buyerAddress = buyerAddress;
  }

}
