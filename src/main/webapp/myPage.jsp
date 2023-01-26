<%@page import="java.util.ArrayList"%>
<%@page import="model.historyVO"%>
<%@page import="java.util.List"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@page import="org.apache.ibatis.session.SqlSessionFactory"%>
<%@page import="mybatis.Mybatis"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<%
SqlSessionFactory sqlSessionFactory = Mybatis.getSqlSessionFactory();
SqlSession Session;
Session = sqlSessionFactory.openSession(true); 

String buyerId = (String) session.getAttribute("buyerId");
List<historyVO> orderedItemList = Session.selectList("getItems", buyerId);


%>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN" crossorigin="anonymous"></script>
<style>
body{
font-family: "Lato", sans-serif;
}
.recently-box {
display: flex;
height: 200px;
width: 100%;
}

.product-box {
display: flex;
height: 100%;
width: 33%;
}

.product-img-box {
position: relative;
height: 100%;
width: 47%;
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
<body style="font-family: Lato, sans-serif;">

<table class="table" style="text-align: center; border: 1px solid #dddddd;  margin-bottom: 0;">
		<thead>
			<tr>
				<th colspan="5" style="background-color: #fafafa; text-align: center;"><h3>�ֱ� �ֹ� ����</h3></th>
			</tr>
		</thead>
</table>
<div class="recently-box">

		<% 
		if(orderedItemList.size() > 3) {
			
			for(int i=0; i<3; i++){ 
				int itemNumber = orderedItemList.get(i).getItemNumber();
				String status = orderedItemList.get(i).getStatus();
				int itemCount = orderedItemList.get(i).getItemCount();
				String orderDate = orderedItemList.get(i).getOrderDate();
				String itemname = Session.selectOne("getItemname", itemNumber); 
			
			 // ���ų��� 3�� �̻��� ��� 
				%>	
				 <div class="product-box">
					<div class="product-img-box">
						<img src="./resources/item/<%=orderedItemList.get(i).getItemNumber() %>(1).jpg"/>
					</div>
						
					<div class="product-detail-box" style="line-height: 40px;">
						<p> ��ǰ�� : <%=itemname %></p>
						<p> �ֹ� ���� : <%=itemCount %></p>
						<p> �ֹ� ���� : <%=status %></p>
						<p> �ֹ� �Ͻ� : <%=orderDate.substring(0, 10) %></p>
						
					</div>
				</div>
		<% }
		} else if(orderedItemList.size() < 3){ 
			for(int i=0; i<orderedItemList.size(); i++){ 
				int itemNumber = orderedItemList.get(i).getItemNumber();
				String status = orderedItemList.get(i).getStatus();
				int itemCount = orderedItemList.get(i).getItemCount();
				String orderDate = orderedItemList.get(i).getOrderDate();
				String itemname = Session.selectOne("getItemname", itemNumber); 
			
			 // ���ų��� 3�� �̸��� ��� 
		%>	
		 <div class="product-box">
			<div class="product-img-box">
				<img src="./resources/item/<%=orderedItemList.get(i).getItemNumber() %>(1).jpg"/>
			</div>
				
			<div class="product-detail-box" style="line-height: 30px;">
				<p> ��ǰ�� : <%=itemname %></p>
				<p> �ֹ� ���� : <%=itemCount %></p>
				<p> �ֹ� ���� : <%=status %></p>
				<p> �ֹ� �Ͻ� : <%=orderDate.substring(0, 10) %></p>
				
			</div>
		</div>
		<% }
		 } else { %>
		 <h4>���� ������ �������� �ʽ��ϴ�.</h4>
		 <% } %> 
		
</div>

<table class="table" style="text-align: center; border: 1px solid #dddddd">
		<thead>
			<tr>
				<th colspan="5" style="background-color: #fafafa; text-align: center;"><h3>��õ ��ǰ</h3></th>
			</tr>
			
			<%
			List<Integer> list = Session.selectList("getCatenumFromHistory", buyerId);
			out.print(list);
			
			   // �������� ����
	        int max, maxidx;
	        for(int i=0; i<list.size(); i++) {
	            max = list.get(i);
	            maxidx=i;
	            for(int j=i+1; j<list.size(); j++) {
	                if(list.get(j)>max) {
	                    maxidx=j;
	                    max=list.get(j);
	                }           
	            }
	            list.set(maxidx, list.get(i));
	            list.set(i, max);
	        }
			
			ArrayList<Integer> result = new ArrayList<>();
	        result.add(list.get(0));
	        int count=1, maxCount=1;

	        for(int i=1; i<list.size(); i++) {
	            if(list.get(i-1)!= list.get(i)) {
	                if(count>maxCount) {
	                    maxCount=count;
	                    result.clear();
	                    result.add(list.get(i-1));
	                }else if(count==maxCount) {
	                    result.add(list.get(i-1));
	                }

	                count = 1;
	            }else {
	                count++;
	            }
	        }

	        if(count==maxCount) {
	            result.add(list.get(list.size()-1));
	        }

	        // �󵵼��� ���� ����� ���
	        if(maxCount!=1) {
	            out.println("�ֺ�:"+result+"\n"); 
	            out.println("�󵵼��� %d�Դϴ�." + maxCount); 
	        }else {
	            out.println("�ֺ� ����.");
	        }

			%>
			<!-- ���� ���� ���� �ֹ��� ī�װ� ���ڸ� ���Ѵ�. -->
		</thead>
</table>
	
	
</body>
</html>
