package model;

public class cartItemVO {
  private String item_seq;
  private String buyer_id;
  private String qty;


  public cartItemVO(String item_seq, String buyer_id, String qty) {
    super();
    this.item_seq = item_seq;
    this.buyer_id = buyer_id;
    this.qty = qty;
  }

  @Override
  public String toString() {
    return "cartItemVO [item_seq=" + item_seq + ", buyer_id=" + buyer_id + ", qty=" + qty + "]";
  }

  public String getItem_seq() {
    return item_seq;
  }

  public void setItem_seq(String item_seq) {
    this.item_seq = item_seq;
  }

  public String getBuyer_id() {
    return buyer_id;
  }

  public void setBuyer_id(String buyer_id) {
    this.buyer_id = buyer_id;
  }

  public String getQty() {
    return qty;
  }

  public void setQty(String qty) {
    this.qty = qty;
  }


}
