<%@page import="model.itemVO"%>
<%@page import="java.util.List" %>
<%@page import="org.apache.ibatis.session.SqlSession" %>
<%@page import="mybatis.Mybatis" %>
<%@page import="org.apache.ibatis.session.SqlSessionFactory" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<% SqlSessionFactory sqlSessionFactory=Mybatis.getSqlSessionFactory(); 
SqlSession sess;
sess=sqlSessionFactory.openSession(true); %>

<%
	String right1 = request.getParameter("right1");
	String buyerId = (String) request.getAttribute("buyerId");
	
	
	if(right1 == null){
		right1 = "myPage.jsp";
	}
%>
<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Document</title>
	<link rel="stylesheet" href="./mypage_master.css">
	
	<style>
body {
	
font-family: "Lato", sans-serif;  
margin: 0;
  
}
	</style>
</head>

<body style="font-family: "Lato", sans-serif;">
	<div id="wrap">
		<jsp:include page="header.jsp" flush="false" />
		<%-- <jsp:params name="상균" value="header" /> --%>
		<section id="main">
			<div id="left">

				<!-- 목록 -->
				<ul id="category">
					<li>
						<h4 id="pdPage" onclick="location.href='mypage_consumer.jsp?right1=myPage.jsp'">마이페이지</h4>			
								<!-- carousel 통해서 보여주기-->
								
						
					</li>
					<br/>
					<li>
						<h4 id="pdPage" onclick="location.href='mypage_consumer.jsp?right1=pdPage.jsp'">주문 내역</h4>
						<!-- orderstatus db랑 연계 -->
					</li>
					<br/>
					<li>
						<h4 id="dvPage" onclick="getPage(this.id)">문의 내역</h4>
						<!-- 방명록db랑 연계 -->
					</li>
					<br/>
					<li>
						<h4 id="dvPage" onclick="getPage(this.id)">장바구니</h4>
						<!-- 방명록db랑 연계 -->
					</li>
					<br/>
				</ul>
			</div>

			<div id="center">
				<!-- 내용 -->
				<div id="changePage">
						<jsp:include page="<%=right1 %>"></jsp:include>
				</div>
			</div>
		</section>
	</div>


	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>
	

</body>

</html>