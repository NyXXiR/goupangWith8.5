package model;

public class cartItemVO {
  private String itemSeq;
  private String buyerId;
  private String quantity;



  public cartItemVO(String itemSeq, String buyerId, String quantity) {
    super();
    this.itemSeq = itemSeq;
    this.buyerId = buyerId;
    this.quantity = quantity;
  }

  public String getItemSeq() {
    return itemSeq;
  }

  public void setItemSeq(String itemSeq) {
    this.itemSeq = itemSeq;
  }

  public String getBuyerId() {
    return buyerId;
  }

  public void setBuyerId(String buyerId) {
    this.buyerId = buyerId;
  }

  public String getQuantity() {
    return quantity;
  }

  public void setQuantity(String quantity) {
    this.quantity = quantity;
  }

  @Override
  public String toString() {
    return "cartItemVO [itemSeq=" + itemSeq + ", buyerId=" + buyerId + ", quantity=" + quantity
        + "]";
  }



}
