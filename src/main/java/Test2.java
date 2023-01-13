import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import mybatis.Mybatis;

public class Test2 {
  public static void main(String[] args) {
    SqlSessionFactory sqlSessionFactory = Mybatis.getSqlSessionFactory();
    SqlSession sqlsession;
    sqlsession = sqlSessionFactory.openSession(true);

    String a = sqlsession.selectOne("selectCategory", 4);
    System.out.println(a);
  }
}
