package DAO;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import model.itemVO;
import model.itemVO3;
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
		for (int i=x; i <y; i++) {
			resultList.add(itemList.get(i));
		}
		return resultList;
		
	}
	
	public String itemMinTable(List<itemVO3> itemlist) {
		String result = "";
		for(int i=0; i<itemlist.size(); i++){
			result += "<tr><td>"+itemlist.get(i).getSeq()+ "</td>";
			result += "<td>"+itemlist.get(i).getItemname()+ "</td>" ;
			result += "<td>"+itemlist.get(i).getPrice()+ "</td>";
			result += "<td>"+itemlist.get(i).getSalerecord()+ "</td>";
			result += "<td>"+itemlist.get(i).getMulti()+"</td></tr>";
		}
		return result;
	}
	
	public String itemListTable(List<itemVO> itemlist) {
		String result="";
		String cate = null;
		for(int i=0; i<itemlist.size(); i++) {
			if(itemlist.get(i).getCategorynum() == 10){	cate = "Fashion";}
			else if(itemlist.get(i).getCategorynum() == 20){	cate = "Beauty";}
			else if(itemlist.get(i).getCategorynum() == 30){	cate = "Electronic";}
			else if(itemlist.get(i).getCategorynum() == 40){	cate = "Pantry";}
			else if(itemlist.get(i).getCategorynum() == 50){	cate = "Car";}
			else if(itemlist.get(i).getCategorynum() == 60){	cate = "Toy";}
			else{	cate = "Etc";}

			result += "<tr><td>"+itemlist.get(i).getSeq()+"</td>";
			result += "<td><a href='javascript:;' onclick='callRetouchItem("+itemlist.get(i).getSeq()+")'>"+itemlist.get(i).getItemname()+"</td>";
			result += "<td>"+itemlist.get(i).getPrice()+"</td>";
			result += "<td>"+itemlist.get(i).getDiscount()+"</td>";
			result += "<td>"+cate+"</td></tr>";
		}
		
		return result;
	}
	
	
	
	public itemVO reItemSearchOne(int num) {
		itemVO result = sess.selectOne("ItemRetouchOne",num);
		return result;
	}
	
	public String cateNameSearch(int num) {
		String str = sess.selectOne("categoryNameSearch",num);
		return str;
	}
	
	
	public List<itemVO> itemSearchList(String key, String value){
		List<itemVO> result = new ArrayList<>();
		
		if (key.equals("itemname")) {
			result = sess.selectList("itemSearchitemname", value);
		}else if(key.equals("seq")) {
			int val = Integer.valueOf(value);
			result = sess.selectList("itemSearchseq", val);
		}else if(key.equals("price")) {
			int val = Integer.valueOf(value);
			result = sess.selectList("itemSearchprice", val);
		}else if(key.equals("category")) {
			result = sess.selectList("itemSearchcategory", value);
		}else {
			System.out.println("실패");
		}
		
		
		return result;
	}
}
