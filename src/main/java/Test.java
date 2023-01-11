import java.util.List;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import model.itemVO;
import mybatis.Mybatis;

public class Test {

  public static void main(String[] args) {
    // TODO Auto-generated method stub

    SqlSessionFactory sqlSessionFactory = Mybatis.getSqlSessionFactory();
    SqlSession session;
    session = sqlSessionFactory.openSession(true);

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
    //
    // String a = session.selectOne("selectName", 3);
    // System.out.println(a);

    // String a = session.selectOne("selectPrice", 4);
    // System.out.println(a);


    List<itemVO> list = session.selectList("selectByPrice");
    System.out.println(list);



    // int n= session.insert("add", vo);

  }

}
