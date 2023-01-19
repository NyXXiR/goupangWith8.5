package DAO;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import model.itemVO;
import mybatis.Mybatis;

public class ItemDao2 {

	private static ItemDao2 itemdao = new ItemDao2() {};
	private ItemDao2() {}
	public static ItemDao2 getInstance() {
		return itemdao;
	}
	
	SqlSessionFactory sqlSessionFactory=Mybatis.getSqlSessionFactory(); 
	SqlSession sess = sqlSessionFactory.openSession(true);
	
	public List<itemVO> itemRetouchListMain(int num) {
		List<itemVO> itemList = sess.selectList("ItemAllseq");
		List<itemVO> resultList = new ArrayList<>();
		int MaxCount = sess.selectOne("ItemAllCount");
		
		int x = (num-1)*10;
		int y = (num*10)-1;
		
		y = MaxCount<y ? MaxCount : y;
		System.out.println(y);
		for (int i=x; i <y; i++) {
			resultList.add(itemList.get(i));
		}
		return resultList;
		
	}
	
	public itemVO reItemSearchOne(int num) {
		itemVO result = sess.selectOne("ItemRetouchOne",num);
		return result;
	}
	
	public String cateNameSearch(int num) {
		String str = sess.selectOne("categoryNameSearch",num);
		return str;
	}
}
