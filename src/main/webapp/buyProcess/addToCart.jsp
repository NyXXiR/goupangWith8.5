<%@page import="java.util.List"%>
<%@ page import="model.cartItemVO"%>
<%@ page import="org.apache.ibatis.session.SqlSessionFactory"%>
<%@ page import="org.apache.ibatis.session.SqlSession"%>
<%@ page import="mybatis.Mybatis"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String item_seq = request.getParameter("item_seq");
String buyer_id= request.getParameter("buyer_id");
String qty =request.getParameter("qty");

SqlSessionFactory sqlSessionFactory = Mybatis.getSqlSessionFactory();
SqlSession sqlSession;
sqlSession = sqlSessionFactory.openSession(true);

cartItemVO vo = new cartItemVO(item_seq, buyer_id, qty);

int n = sqlSession.insert("cartItem", vo);
if (n > 0) {
sqlSession.commit();
} else {
sqlSession.rollback();
}

//이미 cartItem목록에 item_seq, buyer_id가 동일한 항목이 있을 경우
//qty+= 처리
%>
<%=item_seq %>
<%=buyer_id %>
<%=qty %>
<head>
<style>
.cartBox{
width:300px;
height:100px;
}
</style>
</head>
<body>

<div class="cartBox">상품이 장바구니에 담겼습니다.

<button type="button" onclick="location.href='buyPage.jsp';"> 구매목록으로 이동 </button></div>

</body>



