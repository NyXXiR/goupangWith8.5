<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>페이지 합쳐둔 곳</title>


 <link href="style.css" rel="stylesheet" type="text/css">
</head>
<body>
<div class="wrapper">
<jsp:include page="header.jsp" flush="false"/>
<jsp:include page="featuredDetail.jsp" flush="false"/>
<jsp:include page="body2.jsp" flush="false"/>
<jsp:include page="footer.jsp" flush="false"/>
</div>
</body>
</html>