package model;

public class itemVO {

  private int seq;
  private String itemname;
  private int price;
  private int discount;
  private String sellerid;
  private String rdate;
  private int categorynum;
  private int qty;
  private String description;
  private int salerecord;
  private String imgsrc;
  

  public itemVO() {
	super();
}


// seq 컬럼은 시퀀스 기능을 갖고 있고 insert시 sysdate를 갖고있어 upload시 필요없는 기능이라 판단하여 int seq, string date가 없는 생성자 추가  
  public itemVO(String name, int price, int discount, String sellerid,int categorynum, int qty, String desc) {
	    this.itemname = name;
	    this.price = price;
	    this.discount = discount;
	    this.sellerid = sellerid;
	    this.categorynum = categorynum;
	    this.qty = qty;
	    this.description = desc;
	  }
  
  
  public itemVO(String name, int price, int discount,int categorynum, int qty, String desc, int seq) {
	    this.itemname = name;
	    this.price = price;
	    this.discount = discount;
	    this.categorynum = categorynum;
	    this.qty = qty;
	    this.description = desc;
	    this.seq = seq;
	  }
      

  public itemVO(int seq, String itemname, int price, int discount, String sellerid, String rdate, int categorynum,
		int qty, String description, int salerecord) {
	super();
	this.seq = seq;
	this.itemname = itemname;
	this.price = price;
	this.discount = discount;
	this.sellerid = sellerid;
	this.rdate = rdate;
	this.categorynum = categorynum;
	this.qty = qty;
	this.description = description;
	this.salerecord = salerecord;
}



public int getSeq() {	return seq;}
public String getItemname() {	return itemname;}
public int getPrice() {	return price;}
public int getDiscount() {	return discount;}
public String getSellerid() {	return sellerid;}
public String getRdate() {	return rdate;}
public int getCategorynum() {	return categorynum;}
public int getQty() {	return qty;}
public String getDescription() {	return description;}
public int getSalerecord() {	return salerecord;}
public String getImgsrc() {	return imgsrc;}


public void setSeq(int seq) {	this.seq = seq;}
public void setItemname(String itemname) {	this.itemname = itemname;}
public void setPrice(int price) {	this.price = price;}
public void setDiscount(int discount) {	this.discount = discount;}
public void setSellerid(String sellerid) {	this.sellerid = sellerid;}
public void setRdate(String rdate) {	this.rdate = rdate;}
public void setCategorynum(int categorynum) {	this.categorynum = categorynum;}
public void setQty(int qty) {	this.qty = qty;}
public void setDescription(String description) {	this.description = description;}
public void setSalerecord(int salerecord) {	this.salerecord = salerecord;}
public void setImgsrc(String imgsrc) {	this.imgsrc = imgsrc;}



@Override
public String toString() {
	return "itemVO [seq=" + seq + ", itemname=" + itemname + ", price=" + price + ", discount=" + discount
			+ ", sellerid=" + sellerid + ", rdate=" + rdate + ", categorynum=" + categorynum + ", qty=" + qty
			+ ", description=" + description + ", salerecord=" + salerecord + "]";
}
  
  
}


