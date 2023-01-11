package service;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import model.itemVO;
import mybatis.Mybatis;

public class buyAction {


  SqlSessionFactory sqlSessionFactory = Mybatis.getSqlSessionFactory();
  SqlSession session = sqlSessionFactory.openSession(true);

  itemVO vo = new itemVO(0, "banana", 3000, 0, "lgh0334", "sysdate", 10, 10);

}
