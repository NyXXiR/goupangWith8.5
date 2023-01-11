package model;

public class soldItemVO {
  private String seq;
  private String buyerId;
  private String soldDate;

  @Override
  public String toString() {
    return "soldItemVO [seq=" + seq + ", buyerId=" + buyerId + ", soldDate=" + soldDate + "]";
  }

  public String getSeq() {
    return seq;
  }

  public void setSeq(String seq) {
    this.seq = seq;
  }

  public String getBuyerId() {
    return buyerId;
  }

  public void setBuyerId(String buyerId) {
    this.buyerId = buyerId;
  }

  public String getSoldDate() {
    return soldDate;
  }

  public void setSoldDate(String soldDate) {
    this.soldDate = soldDate;
  }
}
