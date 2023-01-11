package mybatis;

import java.io.IOException;
import java.io.InputStream;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class Mybatis {

  private static SqlSessionFactory sqlSessionFactory;

  static {
    try {
      // src 밑의 mybatis-config.xml 파일을 인식
      String resource = "mybatis/mybatis-config.xml";


      InputStream inputStream = Resources.getResourceAsStream(resource);
      sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);

      System.out.println("팩토리 접속 성공");
    } catch (IOException e) {
      e.printStackTrace();
      System.out.println("DB 접속 오류 있음");
    }
  }

  public static SqlSessionFactory getSqlSessionFactory() {
    return sqlSessionFactory;
  }

}
