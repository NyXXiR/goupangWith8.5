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
	  // mybatis ����
	  String enteredID = request.getParameter("userID");
	  String enteredPassword = request.getParameter("userPassword");
	  // �Է°� ����
	  
	  String check = Session.selectOne("loginBuyer");
	  
	  if(enteredID != "" && enteredPassword != "") {
		 return;
	  }
	  
	  if(check.equals(enteredPassword)) {
			 session.setAttribute("LoginStatus", "OK");	 
			 %>
			 <script> 
				alert("<%= request.getParameter("userID")%> �� ȯ���մϴ�");
				window.location.href = 'header.jsp';
			</script>
			 <%
	  } else {
		  %>
		  <script>
				alert("���̵� Ȥ�� ��й�ȣ�� Ȯ�� �� �ּ���");
				window.location.href = 'login.jsp';
		  </script>
		  <%} %>;	
			
</body>
</html>