
<%@ page import="org.apache.ibatis.session.SqlSessionFactory"%>
<%@ page import="org.apache.ibatis.session.SqlSession"%>
<%@ page import="model.itemVO"%>
<%@ page import="model.cartItemVO"%>
<%@ page import="mybatis.Mybatis"%>
<%@ page import="java.util.List" %>
<%@ page import="model.soldItemVO" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%
SqlSessionFactory sqlSessionFactory = Mybatis.getSqlSessionFactory();
SqlSession sqlSession;
sqlSession = sqlSessionFactory.openSession(true);

//로그인한 id가 등록한 장바구니 목록을 가져옴
List<cartItemVO> cartList = sqlSession.selectList("cartListById", session.getAttribute("buyer_id"));
%>

<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
제품 구매 페이지. itemDetail에서 넘어옴.
제품정보와 수량 전달받아 입력.
buyer가 장바구니에 담아둔 항목과 바로구매에서 가져온 항목을 더해서 보여줘야 함

<%=cartList.get(0).getItem_seq() %>
<%= sqlSession.selectOne("getNameBySeq", cartList.get(0).getItem_seq()) %>
</body>
</html>