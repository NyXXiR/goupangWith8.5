import java.util.Arrays;
import java.util.List;
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

    int itemRecord = sess.selectOne("ItemSaleRecordSum");
    List<Integer> salList = sess.selectList("ItemSaleRecordSum");

    salList.stream().flatMapToDouble(t -> {
      Integer str = Integer.valueOf(t);
      double dob = (double) str;
      dob /= itemRecord;
      double[] doblist = null;
      return Arrays.stream(doblist);
    }).forEach(t -> System.out.println(t));


    // int n= session.insert("add", vo);
     
	
  }

}
