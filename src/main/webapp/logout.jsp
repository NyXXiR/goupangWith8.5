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
session.removeAttribute("buyerId");
session.removeAttribute("sellerId");
// 로그인 시 setAttribute 설정되었던 OK 상태를 삭제.
response.sendRedirect("header.jsp");
// 삭제 후 header.jsp로 복귀
%>
</body>
</html>