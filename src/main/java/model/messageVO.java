package model;

public class messageVO {
	private int id;
	private String guestName;
	private String password;
	private String message;
	
	public messageVO(int id, String guestName, String password, String message) {
		super();
		this.id = id;
		this.guestName = guestName;
		this.password = password;
		this.message = message;
	}
	public void setId(int id) {
		this.id = id;
	}
	public void setGuestName(String guestName) {
		this.guestName = guestName;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	
	public boolean hasPassword() {
		return password != null && !password.isEmpty();
	}
	
	//파라미터로 받은 pwd가 암호를 저장한 password필드와  동일한지 확인 
	public boolean matchPassword(String pwd) {
		return password!= null &&password.equals(pwd);
	}
	
	@Override
	public String toString() {
		return "MessageVO [id=" + id + ", guestName=" + guestName + ", password=" + password + ", message=" + message
				+ "]";
	}
	
}
