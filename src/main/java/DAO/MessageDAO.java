package DAO;

import java.io.FileReader;
import java.net.URLDecoder;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Properties;

import oracle.jdbc.driver.Message;

public class MessageDAO {

	public class MessageDao {
		private static MessageDao messageDao = new MessageDao();
		public static MessageDao getInstance() {
			return messageDao;
		}// 싱글턴 패턴 끝
		
		private Connection conn = getConnect();
		private Connection getConnect() {
			try {
				Properties prop = new Properties();
				String path = MessageDao.class.getResource("db.properties").getPath();
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
		
		private MessageDao() {}
		
		public int insert(Message message) throws SQLException {
			PreparedStatement pstmt = null;
			try {
				pstmt = conn.prepareStatement(
						"insert into guestbook_message " + 
						"(message_id, guest_name, password, message) values (seq_guestbook_message.nextval,?,?,?)");
				pstmt.setString(1, message.toString());
				pstmt.setString(2, message.getPassword());
				pstmt.setString(3, message.getMessage());
				return pstmt.executeUpdate();
			} finally {
				JdbcUtil.close(pstmt);
			}
		}

		public Message select(Connection conn, int messageId) throws SQLException {
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			try {
				pstmt = conn.prepareStatement(
						"select * from guestbook_message where message_id = ?");
				pstmt.setInt(1, messageId);
				rs = pstmt.executeQuery();
				if (rs.next()) {
					return makeMessageFromResultSet(rs);
				} else {
					return null;
				}
			} finally {
				JdbcUtil.close(rs);
				JdbcUtil.close(pstmt);
			}
		}

		private Message makeMessageFromResultSet(ResultSet rs) throws SQLException {
			Message message = new Message();
			message.setId(rs.getInt("message_id"));
			message.setGuestName(rs.getString("guest_name"));
			message.setPassword(rs.getString("password"));
			message.setMessage(rs.getString("message"));
			return message;
		}

		public int selectCount(Connection conn) throws SQLException {
			Statement stmt = null;
			ResultSet rs = null;
			try {
				stmt = conn.createStatement();
				rs = stmt.executeQuery("select count(*) from guestbook_message");
				rs.next();
				return rs.getInt(1);
			} finally {
				JdbcUtil.close(rs);
				JdbcUtil.close(stmt);
			}
		}

		public List<Message> selectList(Connection conn, int firstRow, int endRow) 
				throws SQLException {
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			try {
				pstmt = conn.prepareStatement(
						"select * from guestbook_message " + 
						"order by message_id desc limit ?, ?");
				pstmt.setInt(1, firstRow - 1);
				pstmt.setInt(2, endRow - firstRow + 1);
				rs = pstmt.executeQuery();
				if (rs.next()) {
					List<Message> messageList = new ArrayList<Message>();
					do {
						messageList.add(makeMessageFromResultSet(rs));
					} while (rs.next());
					return messageList;
				} else {
					return Collections.emptyList();
				}
			} finally {
				JdbcUtil.close(rs);
				JdbcUtil.close(pstmt);
			}
		}

		public int delete(Connection conn, int messageId) throws SQLException {
			PreparedStatement pstmt = null;
			try {
				pstmt = conn.prepareStatement(
						"delete from guestbook_message where message_id = ?");
				pstmt.setInt(1, messageId);
				return pstmt.executeUpdate();
			} finally {
				JdbcUtil.close(pstmt);
			}
		}

}
