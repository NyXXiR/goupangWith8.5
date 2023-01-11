
<%@ page import="org.apache.ibatis.session.SqlSessionFactory"%>
<%@ page import="org.apache.ibatis.session.SqlSession"%>
<%@ page import="model.itemVO"%>
<%@ page import="mybatis.Mybatis"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
제품 구매 페이지. itemDetail에서 넘어옴.
제품정보와 수량 전달받아 입력.
buyer가 장바구니에 담아둔 항목과 바로구매에서 가져온 항목을 더해서 보여줘야 함



<%-- 제품 구매시 DB 처리하는 메소드--%>
<%!

public void buyAction(){
  
SqlSessionFactory sqlSessionFactory = Mybatis.getSqlSessionFactory();
SqlSession session = sqlSessionFactory.openSession(true);

itemVO vo = new itemVO(0, "banana", 3000, 0, "lgh0334", "sysdate", 10, 10);
int n = session.insert("add", vo);
 if (n > 0) {
 session.commit();
 System.out.println("추가 성공");
 } else {
 session.rollback();
 System.out.println("추가 실패");



}

}

%>
</body>
</html>