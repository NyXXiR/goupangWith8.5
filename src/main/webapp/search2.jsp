<%@page import="java.util.HashMap"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.itemVO"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@page import="mybatis.Mybatis"%>
<%@page import="org.apache.ibatis.session.SqlSessionFactory"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>검색 버튼 누르면 출력되는 화면</title>
<style>
.wrapper {
	width: 1280px;
	margin: 0 auto;
}

.sort-btn-box {
	display: flex;
}

.sort-btn-box a {
text-decoration: none;
color: black;
}

.sort-btn-box div {
	cursor: pointer;
	font-size: 20px;
	text-align: center;
	line-height: 80px;
	width: 200px;
	height: 80px;
	margin-bottom: 2px;
}

.sort-by-category {
position: relative;
}

.sort-by-category:hover .category-dropbox{
 display: block;
}

.category-dropbox {
	display: none;
  position: absolute;
  top: 50px;
  left: 10px;
}

 .category-dropbox ul li {
 margin: 10px 0 10px 0;
 font-size: 17px;
  border-radius:3px;
  line-height: 17px;
  height: 25px;
  line-height: 25px;
  width: 100px;
  text-align: left;
}

.category-dropbox ul li:hover {
  transition: 0.5s;
  background: steelblue;
  color: white;
}
 

.title-text-box {
    height: 80px;
    text-align: center;
    line-height: 80px;
    border-bottom: 3px solid darkgray;
}

.search-wrapper {
	
}

#product-box {
	width: 300px;
	margin: 0 50px 0 50px;
	text-align: center;
}

.card {	
    cursor: pointer;
 	text-align: center;
    width: 19%;
    height: 300px;
    margin: 20px 0 0 0;
}

.card .img-box img {
	transition: all 0.2s linear;
}

.card:hover .img-box img {
	trainsition: 0.8s;
	transform: scale(1.1);
}
	
.img-box {
	overflow: hidden;
    vertical-align:middle;
}
	
.item-name-box {
font-size: 20px; 
}

.item-price-box {
font-size: 15px;
margin-top: 10px;
font-weight: bold;
}
.item-price-discount {

font-size: 20px;
}

.search-list-box {
	display: flex;
	justify-content: start;
	flex-flow: wrap;
	margin: 30px auto;
}
}

</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD"
	crossorigin="anonymous">
</head>
<body>
<%
SqlSessionFactory sqlSessionFactory = Mybatis.getSqlSessionFactory();
SqlSession Session;
Session = sqlSessionFactory.openSession(true); 
//마이바티스 기초 셋팅

String comboValue = request.getParameter("comboValue");
String enteredText = request.getParameter("searchbar");
//콤보박스 value값과 텍스트바에서 입력받은 값 가져오기

List<itemVO> listByAll = Session.selectList("searchItemsByNameOrSellerId", enteredText);
List<itemVO> listBySellerId = Session.selectList("searchItemsBySellerId", enteredText);
List<itemVO> listByItemName = Session.selectList("searchItemByItemName", enteredText);
// 판매자이름, 상품명, 전체로 검색한 결과 값 List에 담기



List<itemVO> testSort = Session.selectList("sortBySalesRecord");
%>


<script>
	
	function sortBySalesRecord() {
	$.ajax({
		type: "GET",
		url: "sortedItems.jsp",
		success: function(data) {
			console.log("테스트용");
			$(".search-list-box").html(data);
			console.log("테스트용");
		},
		error: function(request, status, error) {
			alert(error);
		}
	});
}

	
</script>


<!-- 해결해야 할 문제 -->

<!-- 랭킹, 카테고리, 전체 버튼 sort 기능 -->
<!-- 상품 컨테이너 body 형식과 통일시키기 -->
<!-- 마이페이지 연동 방법 -->
<!-- 상품 상세페이지 연동 방법 -->

<jsp:include page="header.jsp" flush="false"/>
		
<div class="wrapper">
	
		<!-- sort button area -->
		<div class="sort-btn-box">
			<div class="sort-by-rank" onclick="sortBySalesRecord()">랭킹</div>
			<div class="sort-by-category" onclick="sortTest()"><a href="#">카테고리</a>
				<div class="category-dropbox">
					<ul>
						<li>패션</li>
						<li>뷰티</li>
						<li>전자제품</li>
						<li>팬트리</li>
						<li>자동차 용품</li>
						<li>완구</li>
						<li>기타</li>
					</ul>
				</div>
			</div>
			<div class="recommend"><a href="#">추천 상품</a></div>
			<!-- 로그인 한 유저가 특정 상품 클릭 할 때마다, db의 카테고리 column 숫자가 1씩 올라감. 가장 높은 숫자의 카테고리 상품부터 순차적으로 출력하기 -->
			<div class="show-all"><a href="#">전체</a></div>
			<!-- search-wrapper 영역에 ajax 통해서 부분 렌더링 하기 -->
		</div>

		<div class="title-text-box">
			<h2>상품 리스트</h2>
		</div>

		<!-- 검색 상품 출력 란 --> 
		<div class="search-wrapper">
			<div id = "product_total">
				<p>Total&nbsp:&nbsp&nbsp<span><%=listByAll.size() %></span></p>
			</div>
			
			
			<div class="search-list-box">
				<!-- 전체 상품 검색 결과 -->
				
				<% if(comboValue.equals("all")) {
					for(int i=0; i<listByAll.size(); i++) { 
						int discounted = listByAll.get(i).getPrice() / 100 * (100 - listByAll.get(i).getDiscount());
						HashMap<String, String> itemMap = new HashMap<>(); 
						// 구매 프로세스에 필요한 vo 값:              
							itemMap.put("seq",Integer.toString(listByAll.get(i).getSeq()));
							itemMap.put("name", listByAll.get(i).getItemname());
							itemMap.put("category_num",Integer.toString(listByAll.get(i).getCategorynum()));
							itemMap.put("price", Integer.toString(listByAll.get(i).getPrice()));
							itemMap.put("discount",Integer.toString(listByAll.get(i).getDiscount()));
							itemMap.put("discounted", Integer.toString(discounted));
							itemMap.put("seller_id", listByAll.get(i).getSellerid());
							itemMap.put("description", listByAll.get(i).getDescription());
						
							String a = itemMap.get("seq");
							String b = itemMap.get("name");
							
							session.setAttribute("itemDetail", itemMap); 
							%>
							
							
						<div class="card" style="width: 24%">
							<img src="./resources/item/<%=i %>.jpg" class="card-img-top" alt="...">
							<div class="card-body">
								<h5 class="card-title"><div id="itemName" class="text-large"><%=listByAll.get(i).getItemname()%></div></h5>
								<p class="card-text"></p>
								<div id="itemPrice" class="text-small" style="text-decoration:line-through"><%=listByAll.get(i).getPrice()%>원</div>
								<div id="itemDiscountPrice" class="text-large"><%= discounted %>원</div>
								<div><a href="login.jsp?a=<%=a %>&b=<%=b %>" class="btn btn-primary" style="margin-bottom:0">구매하기</a></div>
							</div>
						</div>
				<% 	}
				}
				%>
				
				
				<% if(comboValue.equals("sellerId")) {
					for(int i=0; i<listByAll.size(); i++) { 
						
						HashMap<String, String> itemMap = new HashMap<>();
						int discounted = listByAll.get(i).getPrice() / 100 * (100 - listByAll.get(i).getDiscount());%>
						
						// 구매 프로세스에 필요한 vo 값:              
							itemMap.put("seq",Integer.toString(listBySellerId.get(i).getSeq()));
							itemMap.put("name", listBySellerId.get(i).getItemname());
							itemMap.put("category_num",Integer.toString(listBySellerId.get(i).getCategorynum()));
							itemMap.put("price", Integer.toString(listBySellerId.get(i).getPrice()));
							itemMap.put("discount",Integer.toString(listBySellerId.get(i).getDiscount()));
							itemMap.put("discounted", Integer.toString(discounted));
							itemMap.put("seller_id", listBySellerId.get(i).getSellerid());
							itemMap.put("description", listBySellerId.get(i).getDescription());
						
						<div class="card" style="width: 24%">
							<img src="./resources/item/<%=i %>.jpg" class="card-img-top" alt="...">
							<div class="card-body">
								<h5 class="card-title"><div id="itemName" class="text-large"><%=listByAll.get(i).getItemname()%></div></h5>
								<p class="card-text"></p>
								<div id="itemPrice" class="text-small" style="text-decoration:line-through"><%=listByAll.get(i).getPrice()%>원</div>
								<div id="itemDiscountPrice" class="text-large"><%= discounted %>원</div>
								<div><a href="itemDetail.jsp?<%=listByAll.get(i) %>" class="btn btn-primary" style="margin-bottom:0">구매하기</a></div>
							</div>
						</div>
				<% 	}
				}
				%>
				
				<% if(comboValue.equals("itemName")) {
					for(int i=0; i<listByAll.size(); i++) { 
						
						HashMap<String, String> itemMap = new HashMap<>();
						int discounted = listByAll.get(i).getPrice() / 100 * (100 - listByAll.get(i).getDiscount());%>
						
						// 구매 프로세스에 필요한 vo 값:              
							itemMap.put("seq",Integer.toString(listByItemName.get(i).getSeq()));
							itemMap.put("name", listByItemName.get(i).getItemname());
							itemMap.put("category_num",Integer.toString(listByItemName.get(i).getCategorynum()));
							itemMap.put("price", Integer.toString(listByItemName.get(i).getPrice()));
							itemMap.put("discount",Integer.toString(listByItemName.get(i).getDiscount()));
							itemMap.put("discounted", Integer.toString(discounted));
							itemMap.put("seller_id", listByItemName.get(i).getSellerid());
							itemMap.put("description", listByItemName.get(i).getDescription());
						
						<div class="card" style="width: 24%">
							<img src="./resources/item/<%=i %>.jpg" class="card-img-top" alt="...">
							<div class="card-body">
								<h5 class="card-title"><div id="itemName" class="text-large"><%=listByAll.get(i).getItemname()%></div></h5>
								<p class="card-text"></p>
								<div id="itemPrice" class="text-small" style="text-decoration:line-through"><%=listByAll.get(i).getPrice()%>원</div>
								<div id="itemDiscountPrice" class="text-large"><%= discounted %>원</div>
								<div><a href="itemDetail.jsp?<%=listByAll.get(i) %>" class="btn btn-primary" style="margin-bottom:0">구매하기</a></div>
							</div>
						</div>
				<% 	}
				}
				%>
				
				
				
			</div>	
		</div>
		
		
	</div>
	
<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
</body>
</html>