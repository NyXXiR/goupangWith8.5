<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@ page import="java.util.ArrayList"%>
<html>
<head>
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>상품 목록</title>
</head>
<body>
	<jsp:include page="menu.jsp"/>
	<div class="jumbotron">
		<div class="container">
			<h1 class="display=3">상품 목록</h1>
		</div>
	</div>
	<%
		ArrayList<Product> listProducts = itemDAO.getAllProducts();
	%>
	
	<div class=container>
		<div class="row" align="center">
			<%
				for(int i = 0; i < listProducts.size(); i++){
					Product product = listProducts.get(i);
			%>
			<div class="col-md-4">
				<h3><%=product.getPname() %></h3>
				<p><%=product.getDescription() %>
				<p><%=product.getUnitPrice() %>원
				
				<p> <a href="./product.jsp?id=<%=product.getProductId()%>"
				class="btn btn-secondary" role="button">상세 정보 &raquo;</a>
				
			</div>
			<%
				}
			%>
		</div>
		<hr>
	</div>
	
	<jsp:include page="footer.jsp"/>
</body>
</html>