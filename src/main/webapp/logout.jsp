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
session.removeAttribute("sellerID");
// 로그인 시 setAttribute 설정되었던 OK 상태를 삭제.
response.sendRedirect("view.jsp");
// 삭제 후 view.jsp로 복귀
%>
</body>
</html>