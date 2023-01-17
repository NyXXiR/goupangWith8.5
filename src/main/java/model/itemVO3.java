package model;

public class itemVO3 {

  private int seq;
  private String itemname;
  private int price;
  private String description;
  private int salerecord;
  private long multi;


  public itemVO3() {
	super();
}
  
  

public itemVO3(int seq, String itemname, int price, String description, int salerecord, long multi) {
	super();
	this.seq = seq;
	this.itemname = itemname;
	this.price = price;
	this.description = description;
	this.salerecord = salerecord;
	this.multi = multi;
}





public int getSeq() {	return seq;}
public String getItemname() {	return itemname;}
public int getPrice() {	return price;}
public String getDescription() {	return description;}
public int getSalerecord() {	return salerecord;}
public long getMulti() {	return multi;}


public void setSeq(int seq) {	this.seq = seq;}
public void setItemname(String itemname) {	this.itemname = itemname;}
public void setPrice(int price) {	this.price = price;}
public void setDescription(String description) {	this.description = description;}
public void setSalerecord(int salerecord) {	this.salerecord = salerecord;}
public void setMulti(int multi) {	this.multi = multi;}

  
  



}