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
	LoginRegisterDao dao = LoginRegisterDao.getInstance();

	String enteredID = request.getParameter("userID");
	String enteredPassword = request.getParameter("userPassword");
	/* 로그아웃 버튼 누르면 세션 설정값 해제. session.invalidate() 이용*/
	
		if(dao.FindByUserIDandUserPassword(enteredID, enteredPassword)) {
			
			session.setAttribute("LoginStatus", "OK");
			%>
			<script> 
				alert("<%= request.getParameter("userID")%> 님 환영합니다");
				window.location.href = 'header.jsp';
			</script>
			<%} else { %>
				<script>
				alert("아이디 혹은 비밀번호를 확인 해 주세요");
				window.location.href = 'login.jsp';
			</script>
			<%} %>;
		
	 
	<script>
		alert("아이디 혹은 비밀번호를 확인 해 주세요");
	</script>
	

</body>
</html>