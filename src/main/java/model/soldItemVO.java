package model;

public class soldItemVO {
  private String item_seq;
  private String buyer_id;
  private String sold_date;
  private String qty;

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

  public String getSold_date() {
    return sold_date;
  }

  public void setSold_date(String sold_date) {
    this.sold_date = sold_date;
  }

  public String getQty() {
    return qty;
  }

  public void setQty(String qty) {
    this.qty = qty;
  }

  public soldItemVO(String item_seq, String buyer_id, String sold_date, String qty) {
    super();
    this.item_seq = item_seq;
    this.buyer_id = buyer_id;
    this.sold_date = sold_date;
    this.qty = qty;
  }

  @Override
  public String toString() {
    return "soldItemVO [item_seq=" + item_seq + ", buyer_id=" + buyer_id + ", sold_date="
        + sold_date + ", qty=" + qty + "]";
  }



}


