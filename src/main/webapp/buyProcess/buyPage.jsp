
<%@ page import="org.apache.ibatis.session.SqlSessionFactory"%>
<%@ page import="org.apache.ibatis.session.SqlSession"%>
<%@ page import="model.itemVO"%>
<%@ page import="model.cartItemVO"%>
<%@ page import="mybatis.Mybatis"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%
SqlSessionFactory sqlSessionFactory = Mybatis.getSqlSessionFactory();
SqlSession sqlSession;
sqlSession = sqlSessionFactory.openSession(true);

List<cartItemVO> cartList = sqlSession.

%>

<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
제품 구매 페이지. itemDetail에서 넘어옴.
제품정보와 수량 전달받아 입력.
buyer가 장바구니에 담아둔 항목과 바로구매에서 가져온 항목을 더해서 보여줘야 함



<%-- 제품 구매시 DB 처리하는 메소드

제품 구매했을 때
수량+ 제품정보를 forward 해서
구매하시겠습니까? 
예- > 해당 제품의 수량만큼의 quantity를 db에서 감소 처리함

ㄴif 수량>잔여수량일 경우 품절 메시지 띄우고 rollback()처리
rollback();
soldItemDB에 수량만큼의 quantity를 추가
ㄴif 제품id와 구매자 id가 동일한 행이 있을 경우 quantity 증가 처리
--%>
=======


<%-- 제품 구매시 DB 처리하는 메소드--%>
<%!

public void buyAction(){
  
SqlSessionFactory sqlSessionFactory = Mybatis.getSqlSessionFactory();
SqlSession sqlSession = sqlSessionFactory.openSession(true);

<%-- 
itemVO vo = new itemVO(0, "banana", 3000, 0, "lgh0334", "sysdate", 10, 10);
int n = sqlSession.insert("add", vo);
 if (n > 0) {
   sqlSession.commit();
 System.out.println("추가 성공");
 } else {
   sqlSession.rollback();
 System.out.println("추가 실패");
 --%>

}

}

%>
</body>
</html>