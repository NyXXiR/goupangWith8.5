package model;

public class cartItemVO {
  private int item_seq;
  private String buyer_id;
  private int qty;

  public int getItem_seq() {
    return item_seq;
  }

  public void setItem_seq(int item_seq) {
    this.item_seq = item_seq;
  }

  public String getBuyer_id() {
    return buyer_id;
  }

  public void setBuyer_id(String buyer_id) {
    this.buyer_id = buyer_id;
  }

  public int getQty() {
    return qty;
  }

  public void setQty(int qty) {
    this.qty = qty;
  }

  @Override
  public String toString() {
    return "cartItemVO [item_seq=" + item_seq + ", buyer_id=" + buyer_id + ", qty=" + qty + "]";
  }

  public cartItemVO(int item_seq, String buyer_id, int qty) {
    super();
    this.item_seq = item_seq;
    this.buyer_id = buyer_id;
    this.qty = qty;
  }



}
