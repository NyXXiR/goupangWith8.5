<%@page import="DAO.ItemDao2"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String itemK = request.getParameter("searchItemkey");
String itemV = request.getParameter("searchItemValue");

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<form id="searchItemKV">
	<input type="hidden" name="searchItemkey" value="<%= itemK %>"/>
	<input type="hidden" name="searchItemValue" value="<%= itemV %>"/>
</form>

<script>
location.href="&searchItemkey="+<%= itemK %>+"&searchItemValue="+<%= itemV %>;

</script>
</body>
</html>