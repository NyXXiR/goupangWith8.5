package guestBook.service;

import java.sql.SQLException;
import java.util.Collections;
import java.util.List;

import DAO.MessageDAO;
import model.MessageVO;

public class GetMessageListService {
	private static GetMessageListService instance = new GetMessageListService();
	public static GetMessageListService getInstance() {
		return instance;
	}
	private GetMessageListService() {
	}
	private static final int MESSAGE_COUNT_PER_PAGE = 10;
	
	public MessageListView getMessageList(int pageNumber) throws ServiceException {
		int currentPageNumber = pageNumber;
		try {
			MessageDAO mdao = MessageDAO.getInstance();

			int messageTotalCount = mdao.selectCount();

			List<MessageVO> messageList = null;
			int firstRow = 0;
			int endRow = 0;
			if (messageTotalCount > 0) {
				firstRow = (pageNumber - 1) * MESSAGE_COUNT_PER_PAGE + 1;
				endRow = firstRow + MESSAGE_COUNT_PER_PAGE - 1;
				messageList = mdao.selectList(firstRow, endRow);
			} else {
				currentPageNumber = 0;
				messageList = Collections.emptyList();
			}
			return new MessageListView(messageList, messageTotalCount, currentPageNumber, MESSAGE_COUNT_PER_PAGE,
					firstRow, endRow);
		} catch (SQLException e) {
			throw new ServiceException("목록 구하기 실패: " + e.getMessage(), e);
		} finally {
		
		}
	}
}
