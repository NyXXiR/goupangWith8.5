<%@page import="DAO.MessageDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<% 
	request.setCharacterEncoding("euc-kr");
%>
<jsp:useBean id="mbean" class="model.MessageVO">
	<jsp:setProperty name="mbean" property="*"/>
</jsp:useBean>

<%
MessageDAO mdao = MessageDAO.getInstance();
mdao.insertMessage(mbean);
System.out.print("완료 ");
%>


</body>
</html>