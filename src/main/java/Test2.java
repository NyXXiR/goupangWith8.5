import java.util.List;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import model.cartItemVO;
import mybatis.Mybatis;

public class Test2 {
  public static void main(String[] args) {
    SqlSessionFactory sqlSessionFactory = Mybatis.getSqlSessionFactory();
    SqlSession sqlSession;
    sqlSession = sqlSessionFactory.openSession(true);

    List<cartItemVO> cartList = sqlSession.selectList("cartListById", "lgh0334");
    System.out.println(cartList);
  }
}
