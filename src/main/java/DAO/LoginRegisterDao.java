package DAO;

import java.io.FileReader;
import java.net.URLDecoder;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

import model.buyerVO;

public class LoginRegisterDao {
	
	private static LoginRegisterDao dao = new LoginRegisterDao();
	private LoginRegisterDao() {}
	public static LoginRegisterDao getInstance() {
		return dao;
	}
	
	private Connection conn = getConnect();
	private Connection getConnect() {
		try {
			Properties prop = new Properties();
			String path = LoginRegisterDao.class.getResource("db.properties").getPath();
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
	
	public int signUpBuyer(buyerVO buyer){
		String sql = "insert into BUYERDB(BUYER_SEQ, buyer_id, buyer_pw, buyer_name)" +
					"values (BUYER_SEQ.nextval,?,?,?)";
		try {
			PreparedStatement pstm = conn.prepareStatement(sql);
			pstm.setString(1, buyer.getBuyerId());
			pstm.setString(2, buyer.getBuyerPw());
			pstm.setString(3, buyer.getBuyerName());
			int res = pstm.executeUpdate();
			pstm.close();
			return res;
		} catch(SQLException e) {
			e.printStackTrace();
		}
		return 0;
	}
	
	
	public boolean FindByUserIDandUserPassword (String id1, String password) throws SQLException {
		
		boolean flag = false;
		String id = id1;
		String pw = password;
		try {
			String sql = "SELECT buyer_pw FROM buyerdb WHERE buyer_id = '" + id + "'";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				if (pw.equals(rs.getString("buyer_pw"))) {
					flag = true;
					System.out.println("로그인 성공");
				} else {
					flag = false;
					System.out.println("로그인 실패");
				}
			}
		} catch (Exception e) {
			flag = false;
			System.out.println("로그인 실패 >" + e.toString());
		}
		return flag;
	}
}
