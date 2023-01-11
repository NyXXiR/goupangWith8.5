package model;

public class itemVO {

  private int seq;
  private String name;
  private int price;
  private int discount;
  private String seller_id;
  private String date;
  private int category_num;
  private int qty;



  @Override
  public String toString() {
    return "itemVO [seq=" + seq + ", name=" + name + ", price=" + price + ", discount=" + discount
        + ", seller_id=" + seller_id + ", date=" + date + ", category_num=" + category_num
        + ", qty=" + qty + "]";
  }

  public itemVO(int seq, String name, int price, int discount, String seller_id, String date,
      int category_num, int qty) {
    super();
    this.seq = seq;
    this.name = name;
    this.price = price;
    this.discount = discount;
    this.seller_id = seller_id;
    this.date = date;
    this.category_num = category_num;
    this.qty = qty;
  }

  int getSeq() {
    return seq;
  }

  public void setSeq(int seq) {
    this.seq = seq;
  }

  public String getName() {
    return name;
  }

  public void setName(String name) {
    this.name = name;
  }

  public int getPrice() {
    return price;
  }

  public void setPrice(int price) {
    this.price = price;
  }

  public int getDiscount() {
    return discount;
  }

  public void setDiscount(int discount) {
    this.discount = discount;
  }

  public String getSeller_id() {
    return seller_id;
  }

  public void setSeller_id(String seller_id) {
    this.seller_id = seller_id;
  }

  public String getDate() {
    return date;
  }

  public void setDate(String date) {
    this.date = date;
  }

  public int getCategory_num() {
    return category_num;
  }

  public void setCategory_num(int category_num) {
    this.category_num = category_num;
  }

  public int getQty() {
    return qty;
  }

  public void setQty(int qty) {
    this.qty = qty;
  }


}


