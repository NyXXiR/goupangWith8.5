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
<style>
.product-box {
display: flex;
height: 100%;
width: 33%;
}

.product-img-box {
position: relative;
height: 100px;
width: 100px;
}

.product-img-box img {
position: absolute; 
top: 0; 
left: 0; 
width: 100%; 
height: 100%;
}
</style>
</head>
<body>
<div class="container">


	<table class="table" style="text-align: center; border: 1px solid #dddddd">
		<thead>
			<tr>
				<th colspan="5" style="background-color: #fafafa; text-align: center;"><h3>상품 주문 내역</h3></th>
			</tr>
			<tr>
				<td style="background-color: #fafafa; text-align:center;"><h5></h5></td>
				<td style="background-color: #fafafa; text-align:center;"><h5>상품 이름</h5></td>
				<td style="background-color: #fafafa; text-align:center;"><h5>배송 현황</h5></td>
				<td style="background-color: #fafafa; text-align:center;"><h5>주문 일자</h5></td>
				<td style="background-color: #fafafa; text-align:center;"><h5>주문 취소</h5></td>
			</tr>
		</thead>
		
		
				<% 
					if(orderedItemList.size() > 0) {
						
					for(int i=0; i<orderedItemList.size(); i++){
					String orderSeq = orderedItemList.get(i).getOrderSeq();
					int itemNumber = orderedItemList.get(i).getItemNumber();
					String status = orderedItemList.get(i).getStatus();
					String orderDate = orderedItemList.get(i).getOrderDate();
					
					String itemname = Session.selectOne("getItemname", itemNumber); 
				%>	
				<tbody style="line-height: 100px;">
					<tr>
						<td style="background-color: #fafafa; text-align:center;">
							<div class="product-img-box">
								<img src="./resources/item/<%=itemNumber %>(1).jpg"/>
							</div>
						</td>
						<td style="background-color: #fafafa; text-align:center;"><h5 style="line-height: 100px;"><%=itemname%></h5></td>
						<td style="background-color: #fafafa; text-align:center;"><h5 style="line-height: 100px;"><%=status %></h5></td>
						<td style="background-color: #fafafa; text-align:center;"><h5 style="line-height: 100px;"><%=orderDate.substring(0, 10) %></h5></td>          
						<td class="cancel" style="background-color: #fafafa; text-align:center;"><h5 style="line-height: 100px;"><a href="orderCancel.jsp?orderSeq=<%=orderSeq %>&status=<%=status %>">주문 취소</a></td>
					</tr>
				</tbody>
				 <% }
					} else {
						%> 
						<tbody>
							<tr>
								<th colspan="5" style="background-color: #fafafa; text-align: center;"><h3>주문 내역이 존재하지 않습니다.</h3></th>
							</tr>
						</tbody>
					 <% 
						}
					 %>
		
	</table>
</div>
</body>
</html>