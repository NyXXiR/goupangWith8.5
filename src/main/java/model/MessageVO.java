package model;

public class MessageVO {
	private int bookId;
	private String bookName;
	private String bookPassword;
	private String bookMessage;

	public MessageVO(int bookId, String bookName, String bookPassword, String bookMessage) {
		super();
		this.bookId = bookId;
		this.bookName = bookName;
		this.bookPassword = bookPassword;
		this.bookMessage = bookMessage;
	}

	public int getBookId() {
		return bookId;
	}

	public void setBookId(int bookId) {
		this.bookId = bookId;
	}

	public String getBookName() {
		return bookName;
	}

	public void setBookName(String bookName) {
		this.bookName = bookName;
	}


	public String getBookPassword() {
		return bookPassword;
	}


	public void setBookPassword(String bookPassword) {
		this.bookPassword = bookPassword;
	}


	public String getBookMessage() {
		return bookMessage;
	}


	public void setBookMessage(String bookMessage) {
		this.bookMessage = bookMessage;
	}


	public MessageVO() {}
	
	
	public boolean hasPassword(){
		return bookPassword!=null&&!bookPassword.isEmpty();
	}

	public boolean matchPassword(String pwd){
		return bookPassword!=null&&!bookPassword.equals(pwd);
	}


	@Override
	public String toString() {
		return "MessageVO [bookId=" + bookId + ", bookName=" + bookName + ", bookPassword=" + bookPassword
				+ ", bookMessage=" + bookMessage + "]";
	}
}
