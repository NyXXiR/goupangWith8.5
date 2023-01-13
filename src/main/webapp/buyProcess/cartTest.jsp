
<%@ page import="org.apache.ibatis.session.SqlSessionFactory"%>
<%@ page import="org.apache.ibatis.session.SqlSession"%>
<%@ page import="model.itemVO"%>
<%@ page import="model.cartItemVO"%>
<%@ page import="mybatis.Mybatis"%>
<%@ page import="java.util.List" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
SqlSessionFactory sqlSessionFactory = Mybatis.getSqlSessionFactory();
SqlSession sqlSession;
sqlSession = sqlSessionFactory.openSession(true);

List<cartItemVO> cartList = sqlSession.selectList("cartListById", "lgh0334");


//get(num)으로 for문 돌리면 댈듯
%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<% for(int i=0; i<cartList.size();i++){ 
%>


<div><%= cartList.get(i).getItemSeq() %> </div>
<div><%= cartList.get(i).getQuantity() %> </div>



<%
}
%>



</body>
</html>