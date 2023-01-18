package DAO;


import model.MessageVO;

public class Ex {

	public static void main(String[] args) {
		MessageDAO mdao = MessageDAO.getInstance();

		mdao.insertMessage(new MessageVO(333, "222", "111", "333"));

	}
}
