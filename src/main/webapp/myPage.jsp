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
<<<<<<< Updated upstream
List<historyVO> orderedItemList = Session.selectList("getItems", buyerId);

=======
// 세션에 저장된 로그인 된 아이디 값을 불러와서
List<historyVO> orderedItemList = Session.selectList("getItems", buyerId);
// 해당 유저의 구매 내역을 모두 불러온다.
>>>>>>> Stashed changes

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
		if(orderedItemList.size() >= 3) {
			
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
						<!-- 상품의 이미지파일 이름은 상품 seq(1).jpg -->
					</div>
						
					<div class="product-detail-box" style="line-height: 40px;">
						<p> 상품명 : <%=itemname %></p>
						<p> 주문 수량 : <%=itemCount %></p>
						<p> 주문 상태 : <%=status %></p>
						<p> 주문 일시 : <%=orderDate.substring(0, 10) %></p>
						<!-- sysdate로 입력한 날짜 데이터에 날짜 및 시간 정보가 포함 되어 있으므로 날짜 정보만 출력되게 10자리까지만 출력 -->
						
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
			
			
			<!-- 로그인 한 유저가 어떤 카테고리의 상품을 가장 많이 구매했는지 최빈값을 구하는 로직 -->
			<%
	   	
			List<Integer> list = Session.selectList("getCatenumFromHistory", buyerId);
<<<<<<< Updated upstream
			// 고객의 주문내역에서 카테고리 번호를 가져와서 ArrayList에 담는다.
			int[] arr = new int[list.size()];
			for(int i=0; i<arr.length; i++) {
				arr[i] = list.get(i);
			}
			// 최빈값 로직을 돌리기 위해 ArrayList 데이터를 일반 1차원 배열 형식으로 변환
=======
			// 로그인 한 유저가 구매한 상품의 카테고리 넘버만 모아서 배열에 담는다. ArrayList 형식
			
			int[] arr = new int[list.size()];
			// 빈 배열을 list.size() 크기로 동일하게 만들어서
			for(int i=0; i<arr.length; i++) {
				arr[i] = list.get(i);
			}
			// ArrayList를 Array(1차원 배열) 화 시킨다. ArrayList 상태로 아래 로직 구현 불가능하기 때문
			
>>>>>>> Stashed changes
			
			Map<Integer, Integer> map = new HashMap<Integer, Integer>();
			
				int maxVal = -1, maxValCnt = 0;
			for (int i = 0; i < arr.length; i++) {
			// 카테고리 값이 담긴 arr 배열의 길이만큼 반복문을 돌린다.
				int t = map.getOrDefault(arr[i], 0) + 1;
<<<<<<< Updated upstream
				// 반복문 안에서 arr[i]가 몇번 반복되었는지 반복값이 변수 t에 담긴다.
				// getOrDefault 메소드는 arr[i]와 매칭되는 키 값이 map에 존재할시 
				// 해당 arr[i] 키값의 value값을 반환함. 없으면 0을 반환함.
				map.put(arr[i], t);
				// 반복문 속에서 arr[i]가 처음 나왔다면 1이 value값으로 담기고
				// arr[i]가 처음 나왔다면 반복 횟수가 t에 담겨 value값으로 담긴다.
				if(maxValCnt<t) {maxVal = arr[i]; maxValCnt = t;}
				// 최종적으로 maxVal에 최빈값이 담기고, maxValcnt에 최빈값의 반복횟수가 담긴다.
=======
				// 위에서 생성한 map 객체에 arr[i] 값과 동일한 key가 존재한다면 
				// 해당 key에 매핑 되어있는 값을 반환하고
				// 없다면 0 반환(default 값)
				// 즉 map 객체에 arr[i] 값과 동일한 key가 존재하지 않으면 (arr[i], 1) 형식으로 map 객체에 들어가게됨.
				// 이후 map 객체를 mapping 할때마다 arr[i] key의 value가 1씩 증가함.
				// t = 빈도수
				map.put(arr[i], t);
				// arr[i]가 중복 될때마다 t값은 1씩 증가하여 초기화 됨.
				if(maxValCnt<t) {maxVal = arr[i]; maxValCnt = t;}
				// t값은 해당 arr[i] 가 for문 내에서 반환된 횟수와 동일함. 
				// 즉 최종적으로 최빈값은 maxVal로 초기화 되고, 반환된 횟수는 maxValCnt에 담기게 됨.
>>>>>>> Stashed changes
			}
			
			for(Integer i: map.keySet()) {
				// map.keySet() : map에 담긴 전체 key값을 반환한다.
				if(map.get(i)==maxValCnt && i!=maxVal)
				// 최빈값이 2개 이상일 경우
					out.print(-1);
<<<<<<< Updated upstream
				// 중복된 최빈값이 존재하는지 검사하는 로직
=======
				// -1을 출력
>>>>>>> Stashed changes
			}
			
			// out.print(maxVal);
			
			List<itemVO> itemList1 = Session.selectList("getItemByCatenum", maxVal);
			// 반환된 최빈값(고객이 가장 많이 구매한 카테고리 값)을 통해
			// 해당 카테고리의 상품을 list에 담고 추천상품으로 출력
			// 이때 해당 카테고리 상품은 판매량이 적은 순서대로 출력
			
			
			
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
				
				 // 해당 카테고리 상품이 3개 이상일 경우 
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
				
				 // 해당 카테고리 상품이 3개 미만일 경우 
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
			 <h4>해당 카테고리의 상품이 존재하지 않습니다.</h4>
			 <% } %> 
			</div>
		
	
	
</body>
</html>
