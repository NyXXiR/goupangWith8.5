import java.util.Arrays;
import java.util.List;
import java.util.stream.IntStream;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import model.itemVO;
import model.itemVO3;
import mybatis.Mybatis;

public class Test {

  public static void main(String[] args) {
    // TODO Auto-generated method stub

    SqlSessionFactory sqlSessionFactory = Mybatis.getSqlSessionFactory();
    SqlSession sess;
    sess = sqlSessionFactory.openSession(true);
 
//     itemVO vo = new itemVO(0, "banana", 3000, 0, "lgh0334", "sysdate", "toy");
//     int n = session.insert("add", vo);
//     if (n > 0) {
//     session.commit();
//     System.out.println("추가 성공");
//     } else {
//     session.rollback();
//     System.out.println("추가ㅇㄹㅇㄹㄹㅇ뮤ㅠ");
//    
//     }
     String a = sess.selectOne("selectName", 3);

    // itemVO vo = new itemVO(0, "banana", 3000, 0, "lgh0334", "sysdate", "toy");
    // int n = session.insert("add", vo);
    // if (n > 0) {
    // session.commit();
    // System.out.println("추가 성공");
    // } else {
    // session.rollback();
    // System.out.println("추가 실패");
    //
    // }


    // String b = session.selectOne("selectPrice", 4);
    // System.out.println(a);
    //
    // List<itemVO> list = session.selectList("selectByPrice");
    // System.out.println(list);

   int sumMaxSale = sess.selectOne("Itemprice*recordSum");
   
	List <itemVO3> salListR = sess.selectList("ItemSaleRecordRSearch");
	for(int i=0; i<salListR.size(); i++){
		String str = salListR.get(i).getItemname();
		salListR.get(i).setItemname(str.replace(" ", "&nbsp"));
		System.out.println(salListR.get(i).getItemname());
	}


    // int n= session.insert("add", vo);
     
	
  }

}
