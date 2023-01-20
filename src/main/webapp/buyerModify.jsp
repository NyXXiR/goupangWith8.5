<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<div class="container">

	<table class="table" style="text-align: center; border: 1px solid #dddddd">
		<thead>
			<tr>
				<th colspan="5" style="background-color: #fafafa; text-align: center;"><h3>ȸ�� ���� ����</h3></th>
			</tr>
			<tr>
				<td style="background-color: #fafafa; text-align:center;"><h5>���̵� ����</h5></td>
				<td style="background-color: #fafafa; text-align:center;"><h5>��й�ȣ ����</h5></td>
				<td style="background-color: #fafafa; text-align:center;"><h5>��� ��Ȳ</h5></td>
				<td style="background-color: #fafafa; text-align:center;"><h5>�ֹ� ����</h5></td>
				<td style="background-color: #fafafa; text-align:center;"><h5>�ֹ� ���</h5></td>
			</tr>
		</thead>
		
		<tbody>
				<% 
					for(int i=0; i<orderedItemList.size(); i++){ 
					String orderSeq = orderedItemList.get(i).getOrderSeq();
					int itemNumber = orderedItemList.get(i).getItemNumber();
					String status = orderedItemList.get(i).getStatus();
					String orderDate = orderedItemList.get(i).getOrderDate();
				%>	
					<tr>
						<td style="background-color: #fafafa; text-align:center;"><h5><%=orderSeq %></h5></td>
						<td style="background-color: #fafafa; text-align:center;"><h5><%=itemNumber %></h5></td>
						<td style="background-color: #fafafa; text-align:center;"><h5><%=status %></h5></td>
						<td style="background-color: #fafafa; text-align:center;"><h5><%=orderDate %></h5></td>          
						<td class="cancel" style="background-color: #fafafa; text-align:center;"><h5><a href="orderCancel.jsp?&orderSeq=<%=orderSeq %>&status=<%=status %>">�ֹ� ���</a></td>
					</tr>
				 <% }
				 %>
		</tbody>
	</table>
</div>
</body>
</html>