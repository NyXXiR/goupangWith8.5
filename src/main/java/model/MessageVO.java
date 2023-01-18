package model;

public class MessageVO {
	private int guestId;
	private String guestName;
	private String guestPassword;
	private String guestMessage;
	
	public MessageVO() {}
	
	public MessageVO(int guestId, String guestName, String guestPassword, String guestMessage) {
		super();
		this.guestId = guestId;
		this.guestName = guestName;
		this.guestPassword = guestPassword;
		this.guestMessage = guestMessage;
	}

	
	public int getGuestId() {
		return guestId;
	}


	public void setGuestId(int guestId) {
		this.guestId = guestId;
	}


	public String getGuestName() {
		return guestName;
	}


	public void setGuestName(String guestName) {
		this.guestName = guestName;
	}


	public String getGuestPassword() {
		return guestPassword;
	}


	public void setGuestPassword(String guestPassword) {
		this.guestPassword = guestPassword;
	}


	public String getGuestMessage() {
		return guestMessage;
	}


	public void setGuestMessage(String guestMessage) {
		this.guestMessage = guestMessage;
	}


	public boolean hasPassword() {
		return guestPassword != null && !guestPassword.isEmpty();
	}
	
	//파라미터로 받은 pwd가 암호를 저장한 password필드와  동일한지 확인 
	public boolean matchPassword(String pwd) {
		return guestPassword!= null &&guestPassword.equals(pwd);
	}

	
	@Override
	public String toString() {
		return "messageVO [guestid=" + guestId + ", guestName=" + guestName + ", guestpassword=" + guestPassword
				+ ", guestmessage=" + guestMessage + "]";
	}
	

}
