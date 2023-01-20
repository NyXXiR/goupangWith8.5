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
	String right = request.getParameter("right");
	String buyerId = (String) request.getAttribute("buyerId");
	
	
	if(right == null){
		right = "myPage.jsp";
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
</head>

<body>
	<div id="wrap">
		<jsp:include page="header.jsp" flush="false" />
		<%-- <jsp:params name="상균" value="header" /> --%>
		<section id="main">
			<div id="left">

				<!-- 목록 -->
				<ul id="category">
					<li>
						<h3 id="pdPage" onclick="location.href='mypage_consumer.jsp?right=myPage.jsp'">마이페이지</h3>
						<!-- orderstatus db랑 연계 -->
					</li>
					<li>
						<h3 id="pdPage" onclick="location.href='mypage_consumer.jsp?right=pdPage.jsp'">주문 내역</h3>
						<!-- orderstatus db랑 연계 -->
					</li>
					<li>
						<h3 id="dvPage" onclick="getPage(this.id)">게시글 내역</h3>
						<!-- 방명록db랑 연계 -->
					</li>
					<li>
						<h3 id="psPage" onclick="getPage(this.id)">회원정보수정</h3>
					</li>
				</ul>
			</div>

			<div id="center">
				<!-- 내용 -->
				<div id="changePage">
						<jsp:include page="<%=right %>"></jsp:include>
				</div>
			</div>
		</section>
	</div>


	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>
	

</body>

</html>