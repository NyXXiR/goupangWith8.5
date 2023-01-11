

<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>

	<h1>form</h1>
	<form action="reg" method="post" enctype="multipart/form-data">
		<input type="file" name= "f" accept="image/png, image/jpeg" value="C:\">
		<input type="submit" value="전송">	
	</form>
	
	
	<%
	
	Part part= request.getPart("f");%>	
</body>
</html>