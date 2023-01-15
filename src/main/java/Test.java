import java.util.Arrays;
import java.util.List;
import java.util.stream.IntStream;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

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

    int itemRecord = sess.selectOne("ItemSaleRecordHSum");
	List < Integer > salList = sess.selectList("ItemSaleRecordHSearch");

	double[] salarr = new double[salList.size()];

	for (int i = 0; i < salList.size(); i++) {
		salarr[i] = salList.get(i);
		salarr[i] = Math.round((salarr[i] / itemRecord * 100) * 100.0) / 100.0;
	}
	for (int i = 1; i < salList.size(); i++) {
		salarr[i] += salarr[i-1];
		System.out.println(salarr[i]);
	}
	


    // int n= session.insert("add", vo);
     
	
  }

}
