package model;

public class cartItemVO {
  private String ItemSeq;
  private String buyerId;
  private String quantity;

  public String getCartSeq() {
    return ItemSeq;
  }

  public void setCartSeq(String cartSeq) {
    this.ItemSeq = cartSeq;
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
    return "cartItemVO [ItemSeq=" + ItemSeq + ", buyerId=" + buyerId + ", quantity=" + quantity
        + "]";
  }


}
