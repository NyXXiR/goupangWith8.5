package model;

public class buyerVO {
	private String buyerSeq;
	private String buyerId;
	private String buyerPw;
	private String buyerName;
	
	
	@Override
	public String toString() {
		return "buyerVO [buyerSeq=" + buyerSeq + ", buyerId=" + buyerId + ", buyerPw=" + buyerPw + ", buyerName="
				+ buyerName + "]";
	}

	
	public buyerVO(String buyerId, String buyerPw, String buyerName) {
		super();
		this.buyerId = buyerId;
		this.buyerPw = buyerPw;
		this.buyerName = buyerName;
	}


	public buyerVO(String buyerSeq, String buyerId, String buyerPw, String buyerName) {
		super();
		this.buyerSeq = buyerSeq;
		this.buyerId = buyerId;
		this.buyerPw = buyerPw;
		this.buyerName = buyerName;
	}


	public String getBuyerSeq() {
		return buyerSeq;
	}

	public void setBuyerSeq(String buyerSeq) {
		this.buyerSeq = buyerSeq;
	}

	public String getBuyerId() {
		return buyerId;
	}

	public void setBuyerId(String buyerId) {
		this.buyerId = buyerId;
	}

	public String getBuyerPw() {
		return buyerPw;
	}

	public void setBuyerPw(String buyerPw) {
		this.buyerPw = buyerPw;
	}

	public String getBuyerName() {
		return buyerName;
	}

	public void setBuyerName(String buyerName) {
		this.buyerName = buyerName;
	}

	

	

}
