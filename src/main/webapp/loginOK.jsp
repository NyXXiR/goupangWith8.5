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
	  
	  String checkId = Session.selectOne("loginCheckID", enteredID);
	  String checkPw = Session.selectOne("loginCheckPw", enteredID);

	  if(enteredID == "" && enteredPassword == "") {
		  %>
		  <script>
				alert("���̵� Ȥ�� ��й�ȣ�� Ȯ�� �� �ּ���");
				window.location.href = 'login.jsp';
		  </script>
		  <%
		 return;
	  }
	 
	  if(enteredID.equals(checkId)) {
	  } else {
		  return;
	  }
	  if(enteredPassword.equals(checkPw)) {
		  session.setAttribute("buyerId", enteredID);
		  %>
			 <script> 
				alert("<%= request.getParameter("buyerId")%> �� ȯ���մϴ�");
				window.location.href = 'header.jsp';
			</script>
			 <%
	  } else {
		  %>
		  <script>
				alert("���̵� Ȥ�� ��й�ȣ�� Ȯ�� �� �ּ���");
				window.location.href = 'login.jsp';
		  </script>
		  <%
	  } %>
	  
			
</body>
</html>