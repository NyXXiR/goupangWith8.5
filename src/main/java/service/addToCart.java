package service;

import java.util.List;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import model.cartItemVO;
import mybatis.Mybatis;

public class addToCart {



  SqlSessionFactory sqlSessionFactory = Mybatis.getSqlSessionFactory();
  SqlSession sqlSession = sqlSessionFactory.openSession(true);

  List<cartItemVO> cartList = sqlSession.selectList("cartListById", "lgh0334");


}
