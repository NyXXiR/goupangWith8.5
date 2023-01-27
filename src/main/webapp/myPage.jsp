<%@page import="model.itemVO"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
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
.recommend-item-box {
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
		</thead>
</table>
			<%
	   	
			List<Integer> list = Session.selectList("getCatenumFromHistory", buyerId);
			// ���� �ֹ��������� ī�װ� ��ȣ�� �����ͼ� ArrayList�� ��´�.
			int[] arr = new int[list.size()];
			for(int i=0; i<arr.length; i++) {
				arr[i] = list.get(i);
			}
			// �ֺ� ������ ������ ���� ArrayList �����͸� �Ϲ� 1���� �迭 �������� ��ȯ
			
			Map<Integer, Integer> map = new HashMap<Integer, Integer>();
			
				int maxVal = -1, maxValCnt = 0;
			for (int i = 0; i < arr.length; i++) {
			// ī�װ� ���� ��� arr �迭�� ���̸�ŭ �ݺ����� ������.
				int t = map.getOrDefault(arr[i], 0) + 1;
				// �ݺ��� �ȿ��� arr[i]�� ��� �ݺ��Ǿ����� �ݺ����� ���� t�� ����.
				// getOrDefault �޼ҵ�� arr[i]�� ��Ī�Ǵ� Ű ���� map�� �����ҽ� 
				// �ش� arr[i] Ű���� value���� ��ȯ��. ������ 0�� ��ȯ��.
				map.put(arr[i], t);
				// �ݺ��� �ӿ��� arr[i]�� ó�� ���Դٸ� 1�� value������ ����
				// arr[i]�� ó�� ���Դٸ� �ݺ� Ƚ���� t�� ��� value������ ����.
				if(maxValCnt<t) {maxVal = arr[i]; maxValCnt = t;}
				// ���������� maxVal�� �ֺ��� ����, maxValcnt�� �ֺ��� �ݺ�Ƚ���� ����.
			}
			
			for(Integer i: map.keySet()) {
				if(map.get(i)==maxValCnt && i!=maxVal)
					out.print(-1);
				// �ߺ��� �ֺ��� �����ϴ��� �˻��ϴ� ����
			}
			
			//out.print(maxVal);
			
			List<itemVO> itemList1 = Session.selectList("getItemByCatenum", maxVal);
			
			
			
			
			/*------------------------------------------------------------------  */
			
			
			/* 
			  private int seq;
			  private String itemname;
			  private int price;
			  private int discount;
			  private String sellerid;
			  private String rdate;
			  private int categorynum;
			  private int qty;
			  private String description;
			  private int salerecord;
			  
			  ����, ��ǰ�̸�, ������, ����, �ܿ�����
			*/
			%> 
			<div class="recommend-item-box">
			<% 
			if(itemList1.size() >= 3) {
				
				for(int i=0; i<3; i++){ 
					String itemName = itemList1.get(i).getItemname();
					int discount = itemList1.get(i).getDiscount();
					int price = itemList1.get(i).getPrice();
					int qty = itemList1.get(i).getQty();
				
				 // ���ų��� 3�� �̻��� ��� 
					%>	
					 <div class="product-box">
						<div class="product-img-box">
							<img src="./resources/item/<%=itemList1.get(i).getSeq() %>(1).jpg"/>
						</div>
							
						<div class="product-detail-box" style="line-height: 40px;">
							<p> ��ǰ�� : <%=itemName %></p>
							<p> ������ : <%=discount %></p>
							<p> ���� : <%=price %></p>
							<p> �ܿ� ���� : <%=qty %></p>
							
						</div>
					</div>
			<% }
			} else if(itemList1.size() < 3){ 
				for(int i=0; i<itemList1.size(); i++){ 
					String itemName = itemList1.get(i).getItemname();
					int discount = itemList1.get(i).getDiscount();
					int price = itemList1.get(i).getPrice();
					int qty = itemList1.get(i).getQty();
				
				 // ���ų��� 3�� �̸��� ��� 
			%>	
			 <div class="product-box">
				<div class="product-img-box">
					<img src="./resources/item/<%=orderedItemList.get(i).getItemNumber() %>(1).jpg"/>
				</div>
					
				<div class="product-detail-box" style="line-height: 30px;">
					<p> ��ǰ�� : <%=itemName %></p>
							<p> ������ : <%=discount %>"%"</p>
							<p> ���� : <%=price %></p>
							<p> �ܿ� ���� : <%=qty %></p>
					
				</div>
			</div>
			<% }
			 } else { %>
			 <h4>���� ������ �������� �ʽ��ϴ�.</h4>
			 <% } %> 
			</div>
		
	
	
</body>
</html>
