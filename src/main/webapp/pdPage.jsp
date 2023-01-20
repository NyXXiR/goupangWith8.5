<%@page import="model.historyVO"%>
<%@page import="java.util.List"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@page import="mybatis.Mybatis"%>
<%@page import="org.apache.ibatis.session.SqlSessionFactory"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<%
SqlSessionFactory sqlSessionFactory = Mybatis.getSqlSessionFactory();
SqlSession Session;
Session = sqlSessionFactory.openSession(true); 
String loginStatus = (String) session.getAttribute("buyerId");

List<historyVO> orderedItemList = Session.selectList("getItems", loginStatus);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN" crossorigin="anonymous"></script>

</head>
<body>
<div class="container">


	<table class="table" style="text-align: center; border: 1px solid #dddddd">
		<thead>
			<tr>
				<th colspan="5" style="background-color: #fafafa; text-align: center;"><h3>상품 주문 내역</h3></th>
			</tr>
			<tr>
				<td style="background-color: #fafafa; text-align:center;"><h5>주문 번호</h5></td>
				<td style="background-color: #fafafa; text-align:center;"><h5>상품 번호</h5></td>
				<td style="background-color: #fafafa; text-align:center;"><h5>배송 현황</h5></td>
				<td style="background-color: #fafafa; text-align:center;"><h5>주문 일자</h5></td>
				<td style="background-color: #fafafa; text-align:center;"><h5>주문 취소</h5></td>
			</tr>
		</thead>
		
		<tbody>
				<% 
					for(int i=0; i<orderedItemList.size(); i++){ 
					String orderNum = orderedItemList.get(i).getOrderSeq();
					int productNum = orderedItemList.get(i).getItemNumber();
					String status = orderedItemList.get(i).getStatus();
					String orderDate = orderedItemList.get(i).getOrderDate();
				%>	
					<tr>
						<td style="background-color: #fafafa; text-align:center;"><h5><%=orderNum %></h5></td>
						<td style="background-color: #fafafa; text-align:center;"><h5><%=productNum %></h5></td>
						<td style="background-color: #fafafa; text-align:center;"><h5><%=status %></h5></td>
						<td style="background-color: #fafafa; text-align:center;"><h5><%=orderDate %></h5></td>          
						<td class="cancel" style="background-color: #fafafa; text-align:center;"><h5><a href="orderCancel.jsp?status=<%=status %>&orderNum=<%=orderNum %>">주문 취소</a></td>
					</tr>
				 <% }
				 %>
		</tbody>
	</table>
</div>
</body>
</html>