package model;

public class sellerVO {
  private String sellerSeq;
  private String sellerId;
  private String sellerPw;

  @Override
  public String toString() {
    return "sellerVO [sellerSeq=" + sellerSeq + ", sellerId=" + sellerId + ", sellerPw=" + sellerPw
        + "]";
  }

  public String getSellerSeq() {
    return sellerSeq;
  }

  public void setSellerSeq(String sellerSeq) {
    this.sellerSeq = sellerSeq;
  }

  public String getSellerId() {
    return sellerId;
  }

  public void setSellerId(String sellerId) {
    this.sellerId = sellerId;
  }

  public String getSellerPw() {
    return sellerPw;
  }

  public void setSellerPw(String sellerPw) {
    this.sellerPw = sellerPw;
  }
}
