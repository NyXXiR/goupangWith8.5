import java.util.List;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.mysql.cj.Session;

import model.itemVO;
import mybatis.Mybatis;

public class Test2 {
	public static void main(String[] args) {
		SqlSessionFactory sqlSessionFactory = Mybatis.getSqlSessionFactory();
	    SqlSession session;
	    session = sqlSessionFactory.openSession(true);
	    
		String a = session.selectOne("selectCategory", 4);
				System.out.println(a);
	}
}
