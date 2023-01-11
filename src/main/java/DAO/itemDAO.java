package DAO;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import model.itemVO;
import mybatis.Mybatis;

public class itemDAO {

  SqlSessionFactory sqlSessionFactory = Mybatis.getSqlSessionFactory();
  SqlSession session;

  public itemDAO() {
    session = sqlSessionFactory.openSession(true);
  }

  public itemVO findAll() {
    return session.selectOne("Mapper.findAll");
  }
  
  
  
}
