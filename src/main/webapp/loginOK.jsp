<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@page import="mybatis.Mybatis"%>
<%@page import="org.apache.ibatis.session.SqlSessionFactory"%>
<%@page import="DAO.*"%>

<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<%
	  
	  SqlSessionFactory sqlSessionFactory = Mybatis.getSqlSessionFactory();
	  SqlSession Session;
	  Session = sqlSessionFactory.openSession(true);
	  // mybatis 셋팅
	  String enteredID = request.getParameter("userID");
	  String enteredPassword = request.getParameter("userPassword");
	  // 입력값 저장
	  
	  String check = Session.selectOne("loginBuyer");
	  
	  if(enteredID != "" && enteredPassword != "") {
		 return;
	  }
	  
	  if(check.equals(enteredPassword)) {
			 session.setAttribute("LoginStatus", "OK");	 
			 %>
			 <script> 
				alert("<%= request.getParameter("userID")%> 님 환영합니다");
				window.location.href = 'header.jsp';
			</script>
			 <%
	  } else {
		  %>
		  <script>
				alert("아이디 혹은 비밀번호를 확인 해 주세요");
				window.location.href = 'login.jsp';
		  </script>
		  <%} %>;	
			
</body>
</html>