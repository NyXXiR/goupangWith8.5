<%@page import="model.itemVO"%>
<%@page import="java.util.List"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@page import="mybatis.Mybatis"%>
<%@page import="org.apache.ibatis.session.SqlSessionFactory"%>
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

SqlSessionFactory sqlSessionFactory = Mybatis.getSqlSessionFactory();
SqlSession Session;
Session = sqlSessionFactory.openSession(true); 

List<itemVO> sortItems = Session.selectList("sortBySalesRecord");

//request.setAttribute("sortedList", sortItems);


	for(int i=0; i<sortItems.size(); i++) { 
		int itemPrice = sortItems.get(i).getPrice();
		int discountRate = sortItems.get(i).getDiscount(); %>
		<div class="product-div" onclick="location.href ='search2.jsp?itemSeq=<%=sortItems.get(i).getSeq()%>'">
			<div class="img-box"><img src="resources/item/<%=sortItems.get(i).getSeq() %>.jpg" class="search-img-thumbnail" width="100%" height="225"></div>
			<div class="item-name-box"><%=sortItems.get(i).getItemname() %></div>
			<div class="item-price-box"><%=sortItems.get(i).getPrice() %></div>
				<%if(discountRate != 0) {%>
					<div class="item-price-box" style="text-decoration:line-through"><%=sortItems.get(i).getPrice() %></div>
					<div class="item-price-discount"><%=itemPrice * (100 - discountRate) / 100 %></div>
				<%
				} else { %>
					<div class="item-price-box"><%=itemPrice %></div>
				<% 
				}
				%>
		</div>
	<% } %>
</body>
</html>