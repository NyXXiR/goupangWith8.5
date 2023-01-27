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
				<th colspan="5" style="background-color: #fafafa; text-align: center;"><h3>최근 주문 내역</h3></th>
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
			
			 // 구매내역 3개 이상일 경우 
				%>	
				 <div class="product-box">
					<div class="product-img-box">
						<img src="./resources/item/<%=orderedItemList.get(i).getItemNumber() %>(1).jpg"/>
					</div>
						
					<div class="product-detail-box" style="line-height: 40px;">
						<p> 상품명 : <%=itemname %></p>
						<p> 주문 수량 : <%=itemCount %></p>
						<p> 주문 상태 : <%=status %></p>
						<p> 주문 일시 : <%=orderDate.substring(0, 10) %></p>
						
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
			
			 // 구매내역 3개 미만일 경우 
		%>	
		 <div class="product-box">
			<div class="product-img-box">
				<img src="./resources/item/<%=orderedItemList.get(i).getItemNumber() %>(1).jpg"/>
			</div>
				
			<div class="product-detail-box" style="line-height: 30px;">
				<p> 상품명 : <%=itemname %></p>
				<p> 주문 수량 : <%=itemCount %></p>
				<p> 주문 상태 : <%=status %></p>
				<p> 주문 일시 : <%=orderDate.substring(0, 10) %></p>
				
			</div>
		</div>
		<% }
		 } else { %>
		 <h4>구매 내역이 존재하지 않습니다.</h4>
		 <% } %> 
		
</div>

<table class="table" style="text-align: center; border: 1px solid #dddddd">
		<thead>
			<tr>
				<th colspan="5" style="background-color: #fafafa; text-align: center;"><h3>추천 상품</h3></th>
			</tr>
		</thead>
</table>
			<%
	   	
			List<Integer> list = Session.selectList("getCatenumFromHistory", buyerId);
			// 고객의 주문내역에서 카테고리 번호를 가져와서 ArrayList에 담는다.
			int[] arr = new int[list.size()];
			for(int i=0; i<arr.length; i++) {
				arr[i] = list.get(i);
			}
			// 최빈값 로직을 돌리기 위해 ArrayList 데이터를 일반 1차원 배열 형식으로 변환
			
			Map<Integer, Integer> map = new HashMap<Integer, Integer>();
			
				int maxVal = -1, maxValCnt = 0;
			for (int i = 0; i < arr.length; i++) {
			// 카테고리 값이 담긴 arr 배열의 길이만큼 반복문을 돌린다.
				int t = map.getOrDefault(arr[i], 0) + 1;
				// 반복문 안에서 arr[i]가 몇번 반복되었는지 반복값이 변수 t에 담긴다.
				// getOrDefault 메소드는 arr[i]와 매칭되는 키 값이 map에 존재할시 
				// 해당 arr[i] 키값의 value값을 반환함. 없으면 0을 반환함.
				map.put(arr[i], t);
				// 반복문 속에서 arr[i]가 처음 나왔다면 1이 value값으로 담기고
				// arr[i]가 처음 나왔다면 반복 횟수가 t에 담겨 value값으로 담긴다.
				if(maxValCnt<t) {maxVal = arr[i]; maxValCnt = t;}
				// 최종적으로 maxVal에 최빈값이 담기고, maxValcnt에 최빈값의 반복횟수가 담긴다.
			}
			
			for(Integer i: map.keySet()) {
				if(map.get(i)==maxValCnt && i!=maxVal)
					out.print(-1);
				// 중복된 최빈값이 존재하는지 검사하는 로직
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
			  
			  사진, 상품이름, 할인율, 가격, 잔여수량
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
				
				 // 구매내역 3개 이상일 경우 
					%>	
					 <div class="product-box">
						<div class="product-img-box">
							<img src="./resources/item/<%=itemList1.get(i).getSeq() %>(1).jpg"/>
						</div>
							
						<div class="product-detail-box" style="line-height: 40px;">
							<p> 상품명 : <%=itemName %></p>
							<p> 할인율 : <%=discount %></p>
							<p> 가격 : <%=price %></p>
							<p> 잔여 수량 : <%=qty %></p>
							
						</div>
					</div>
			<% }
			} else if(itemList1.size() < 3){ 
				for(int i=0; i<itemList1.size(); i++){ 
					String itemName = itemList1.get(i).getItemname();
					int discount = itemList1.get(i).getDiscount();
					int price = itemList1.get(i).getPrice();
					int qty = itemList1.get(i).getQty();
				
				 // 구매내역 3개 미만일 경우 
			%>	
			 <div class="product-box">
				<div class="product-img-box">
					<img src="./resources/item/<%=orderedItemList.get(i).getItemNumber() %>(1).jpg"/>
				</div>
					
				<div class="product-detail-box" style="line-height: 30px;">
					<p> 상품명 : <%=itemName %></p>
							<p> 할인율 : <%=discount %>"%"</p>
							<p> 가격 : <%=price %></p>
							<p> 잔여 수량 : <%=qty %></p>
					
				</div>
			</div>
			<% }
			 } else { %>
			 <h4>구매 내역이 존재하지 않습니다.</h4>
			 <% } %> 
			</div>
		
	
	
</body>
</html>
