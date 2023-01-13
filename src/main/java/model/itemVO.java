package model;

public class itemVO {

  private int seq;
  private String itemname;
  private int price;
  private int discount;
  private String seller_id;
  private String rdate;
  private int category_num;
  private int qty;
  private String description;
  private int salerecord;


  public itemVO() {
	super();
}

  
@Override
public String toString() {
	return "itemVO [seq=" + seq + ", itemname=" + itemname + ", price=" + price + ", discount=" + discount
			+ ", seller_id=" + seller_id + ", rdate=" + rdate + ", category_num=" + category_num + ", qty=" + qty
			+ ", description=" + description + ", salerecord=" + salerecord + "]";
}


// seq 컬럼은 시퀀스 기능을 갖고 있고 insert시 sysdate를 갖고있어 upload시 필요없는 기능이라 판단하여 int seq, string date가 없는 생성자 추가  
  public itemVO(String name, int price, int discount, String seller_id,int category_num, int qty, String desc) {
	    this.itemname = name;
	    this.price = price;
	    this.discount = discount;
	    this.seller_id = seller_id;
	    this.category_num = category_num;
	    this.qty = qty;
	    this.description = desc;
	  }
  
      

  public itemVO(int seq, String itemname, int price, int discount, String seller_id, String rdate, int category_num,
		int qty, String description, int salerecord) {
	super();
	this.seq = seq;
	this.itemname = itemname;
	this.price = price;
	this.discount = discount;
	this.seller_id = seller_id;
	this.rdate = rdate;
	this.category_num = category_num;
	this.qty = qty;
	this.description = description;
	this.salerecord = salerecord;
}



public int getSeq() {	return seq;}
public String getItemname() {	return itemname;}
public int getPrice() {	return price;}
public int getDiscount() {	return discount;}
public String getSeller_id() {	return seller_id;}
public String getRdate() {	return rdate;}
public int getCategory_num() {	return category_num;}
public int getQty() {	return qty;}
public String getDescription() {	return description;}
public int getSalerecord() {	return salerecord;}



public void setSeq(int seq) {	this.seq = seq;}
public void setItemname(String itemname) {	this.itemname = itemname;}
public void setPrice(int price) {	this.price = price;}
public void setDiscount(int discount) {	this.discount = discount;}
public void setSeller_id(String seller_id) {	this.seller_id = seller_id;}
public void setRdate(String rdate) {	this.rdate = rdate;}
public void setCategory_num(int category_num) {	this.category_num = category_num;}
public void setQty(int qty) {	this.qty = qty;}
public void setDescription(String description) {	this.description = description;}
public void setSalerecord(int salerecord) {	this.salerecord = salerecord;}
  
  
}


