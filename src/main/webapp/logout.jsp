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
session.removeAttribute("LoginStatus");
// �α��� �� setAttribute �����Ǿ��� OK ���¸� ����.
response.sendRedirect("header.jsp");
// ���� �� header.jsp�� ����
%>
</body>
</html>