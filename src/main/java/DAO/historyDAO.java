package DAO;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import model.historyVO;
import mybatis.Mybatis;
public class historyDAO {

	private static historyDAO odh = new historyDAO() {};
	private historyDAO() {};
	public static historyDAO getInstance() {
		return odh;
	}
	
	SqlSessionFactory sqlSessionFactory=Mybatis.getSqlSessionFactory(); 
	SqlSession sess = sqlSessionFactory.openSession(true);
	
	public String orderTable(List<historyVO> list) {
		String result = "";
		for(int i=0; i<list.size(); i++) {
			result += "<tr onclick='orderStChange("+list.get(i).getOrderSeq()+")'><td>"+list.get(i).getOrderSeq()+"</td>";
			result += "<td>"+list.get(i).getItemNumber()+"</td>";
			result += "<td>"+list.get(i).getItemCount()+"</td>";
			result += "<td>"+list.get(i).getBuyerid()+"</td>";
			result += "<td>"+list.get(i).getStatus()+"</td>";
			result += "<td>"+list.get(i).getBuyerAddress()+"</td>";
			result += "<td>"+list.get(i).getOrderDate()+"</td></td>";
		}
		return result;
	}
	
	public historyVO selectOne(int num) {
		historyVO result = sess.selectOne("orderOneSelectBySeq",num);
		return result;
	}
	
	
}
