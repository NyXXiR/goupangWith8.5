package DAO;

import java.util.List;

import model.historyVO;
public class historyDAO {

	private static historyDAO odh = new historyDAO() {};
	private historyDAO() {};
	public static historyDAO getInstance() {
		return odh;
	}
	
	public String orderTable(List<historyVO> list) {
		String result = "";
		for(int i=0; i<list.size(); i++) {
			result += "<tr><td>"+list.get(i).getOrderSeq()+"</td>";
			result += "<td>"+list.get(i).getItemNumber()+"</td>";
			result += "<td>"+list.get(i).getItemCount()+"</td>";
			result += "<td>"+list.get(i).getBuyerid()+"</td>";
			result += "<td>"+list.get(i).getStatus()+"</td>";
			result += "<td>"+list.get(i).getOrderAddress()+"</td>";
			result += "<td>"+list.get(i).getOrderDate()+"</td></td>";
		}
		
		
		return result;
	}
}
