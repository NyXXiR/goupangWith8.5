package DAO;

import java.io.FileReader;
import java.net.URLDecoder;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Properties;

import model.MessageVO;

public class MessageDAO {
	private static MessageDAO messageDao = new MessageDAO();

	public static MessageDAO getInstance() {
		return messageDao;
	}// 싱글턴 패턴 끝

	private Connection conn = getConnect();

	private Connection getConnect() {
		try {
			Properties prop = new Properties();
			String path = MessageDAO.class.getResource("db.properties").getPath();
			path = URLDecoder.decode(path, "utf-8");
			prop.load(new FileReader(path));
			String driver = prop.getProperty("driver");
			Class.forName(driver);
			String url = prop.getProperty("url");
			String user = prop.getProperty("user");
			String pw = prop.getProperty("pw");
			Connection conn = DriverManager.getConnection(url, user, pw);
			return conn;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	private MessageDAO() {
	}
	
	
	// (게시판) 메시지 저장  
	public int insertMessage(MessageVO messageVo) throws SQLException {
		MessageDAO.getInstance();
		PreparedStatement pstmt = null;
		try {
			pstmt = conn.prepareStatement("insert into guestbook_message "
					+ "(message_id, guest_name, password, message) values (seq_guestbook_message.nextval,?,?,?)");
			pstmt.setString(1, messageVo.getGuestName());
			pstmt.setString(2, messageVo.getGuestPassword());
			pstmt.setString(3, messageVo.getGuestMessage());
			return pstmt.executeUpdate();
		} finally {
			conn.close();
		}
	}
	// (게시판) 메시지 선택 
	public MessageVO selectMessage(int guestId) throws SQLException {
		MessageDAO.getInstance();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			pstmt = conn.prepareStatement("select * from guestbook_message where message_id = ?");
			pstmt.setInt(1, guestId);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return makeMessageFromResultSet(rs);
			} else {
				return null;
			}
		} finally {
			conn.close();
		}
	}
	// resultset에서  데이터를 읽어와 message생성. 추후, 셀렉으와 셀렉트 리스트 메소드에서 사용  
	private MessageVO makeMessageFromResultSet(ResultSet rs) throws SQLException {
		MessageVO message = new MessageVO();
		message.setGuestId(rs.getInt("message_id"));
		message.setGuestName(rs.getString("guest_name"));
		message.setGuestPassword(rs.getString("password"));
		message.setGuestMessage(rs.getString("message"));
		return message;
	}

	public int selectCount() throws SQLException {
		Statement stmt = null;
		ResultSet rs = null;
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery("select count(*) from guestbook_message");
			rs.next();
			return rs.getInt(1);
		} finally {
			conn.close();
			conn.close();
		}
	}

	public List<MessageVO> selectList(int firstRow, int endRow) throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			pstmt = conn.prepareStatement("SELECT *\n"
					+ "  FROM (\n"
					+ "        SELECT ROW_NUMBER() OVER (ORDER BY message_id desc) NUM\n"
					+ "             , A.*\n"
					+ "          FROM guestbook_message A\n"
					+ "         ORDER BY message_id desc\n"
					+ "        ) \n"
					+ " WHERE NUM BETWEEN ? AND ?");
			pstmt.setInt(1, firstRow);
			pstmt.setInt(2, endRow - firstRow);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				List<MessageVO> messageList = new ArrayList<MessageVO>();
				do {
					messageList.add(makeMessageFromResultSet(rs));
				} while (rs.next());
				return messageList;
			} else {
				return Collections.emptyList();
			}
		} finally {
			conn.close();
		}
	}

	public int delete(int messageId) throws SQLException {
		PreparedStatement pstmt = null;
		try {
			pstmt = conn.prepareStatement("delete from guestbook_message where message_id = ?");
			pstmt.setInt(1, messageId);
			return pstmt.executeUpdate();
		} finally {
			conn.close();
		}
	}
}
