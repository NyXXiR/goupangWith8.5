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
	/* �α׾ƿ� ��ư ������ ���� ������ ����. session.invalidate() �̿�*/
	
		if(dao.FindByUserIDandUserPassword(enteredID, enteredPassword)) {
			
			session.setAttribute("LoginStatus", "OK");
			%>
			<script> 
				alert("<%= request.getParameter("userID")%> �� ȯ���մϴ�");
				window.location.href = 'header.jsp';
			</script>
			<%} else { %>
				<script>
				alert("���̵� Ȥ�� ��й�ȣ�� Ȯ�� �� �ּ���");
				window.location.href = 'login.jsp';
			</script>
			<%} %>;
		
	 
	<script>
		alert("���̵� Ȥ�� ��й�ȣ�� Ȯ�� �� �ּ���");
	</script>
	

</body>
</html>