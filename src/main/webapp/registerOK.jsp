<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@page import="mybatis.Mybatis"%>
<%@page import="org.apache.ibatis.session.SqlSessionFactory"%>
<%@page import="model.*"%>
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
		// mybatis ������ ����ϱ� ���� ���� ����
      String userID = request.getParameter("userID");
	  String userPassword = request.getParameter("userPassword");
	  String userName = request.getParameter("userName");
		// �� �±� ���� ���� �ҷ��ͼ� ������ ���
	  buyerVO buyer = new buyerVO(userID, userPassword, userName);
	  	// seq �����ϰ� ȸ������ ���������� ������ �������� ���� ���� ���ο� ��ü ����
	  	
	  	
		if (userID != "" && userPassword != "" && userName != "") {
			  Session.insert("signUpBuyer", buyer);
			  %>
				  <script>
				  alert("<%= request.getParameter("userName")%> �� ȸ������ �Ϸ� �Ǿ����ϴ�");
				  window.location.href = 'header.jsp';
				  </script>
			  <%
			  Session.commit();
			  //response.sendRedirect("header.jsp");
		} else {
			  %>
				  <script>
				  alert("���̵�� ��й�ȣ�� Ȯ�� �� �ּ���");
				  window.location.href = 'register.jsp';
				  </script>
			  <%
			  Session.rollback();
			//response.sendRedirect("register.jsp");
		  }
		  %>
	 

</body>
</html>