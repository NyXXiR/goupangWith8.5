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
 
}
.title-text-box {
    height: 80px;
    text-align: center;
    line-height: 80px;
    border-bottom: 3px solid darkgray;
}

.search-wrapper {
	display: flex;
	justify-content: start;
	flex-flow: wrap;
	margin: 30px auto;
}

#product-box {
	width: 300px;
	margin: 0 50px 0 50px;
	text-align: center;
}

.product-div {	
    cursor: pointer;
 	text-align: center;
    width: 19%;
    height: 300px;
    margin: 20px 0 0 0;
}

.product-div .img-box img {
	transition: all 0.2s linear;
}

.product-div:hover .img-box img {
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
text-decoration:line-through;
}
.item-price-discount {

font-size: 20px;
}
}

</style>
</head>
<body>

<script>
		
	function sortBySalesRecode() {
		
	};
	
</script>

<% 
SqlSessionFactory sqlSessionFactory = Mybatis.getSqlSessionFactory();
SqlSession Session;
Session = sqlSessionFactory.openSession(true); 
//myBatis 기초 설정

String comboValue = request.getParameter("comboValue");
String enteredText = request.getParameter("searchbar");
//콤보박스 value값과 텍스트바에서 입력받은 값 가져오기

List<itemVO> listByAll = Session.selectList("searchItemsByNameOrSellerId", enteredText);
List<itemVO> listBySellerId = Session.selectList("searchItemsBySellerId", enteredText);
List<itemVO> listByItemName = Session.selectList("searchItemByItemName", enteredText);
// 판매자이름, 상품명, 전체로 검색한 결과 값 List에 담기

List<String> getName = Session.selectList("searchId", enteredText);
// 판매자 이름 값 가져오는것 테스트용
%>


<jsp:include page="header.jsp" flush="false"/>
		
<div class="wrapper">
	
		<!-- sort button area -->
		<div class="sort-btn-box">
			<div class="sort-by-rank" onclick="sortBySalesRecode()">랭킹</div>
			<div class="sort-by-category"><a href="#">카테고리</a>
				<div class="category-dropbox">
					<ul>
						<li>10</li>
						<li>20</li>
						<li>30</li>
						<li>40</li>
						<li>50</li>
						<li>60</li>
						<li>70</li>
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

				<!-- 전체 상품 검색 결과 -->
				<% if(comboValue.equals("all")) {
					for(int i=0; i<listByAll.size(); i++) { 
						int itemPrice = listByAll.get(i).getPrice();
						int discountRate = listByAll.get(i).getDiscount(); %>
						
						<div class="product-div" onclick="location.href ='search2.jsp?itemName=<%=listByAll.get(i).getItemname()%>'">
							<div class="img-box"><img src="resources/item/12.jpg" class="search-img-thumbnail" width="100%" height="225"></div>
							<div class="item-name-box"><%=listByAll.get(i).getItemname() %></div>
							<div class="item-price-box"><%=listByAll.get(i).getPrice() %></div>
							<div class="item-price-discount"><%=itemPrice * (100 - discountRate) / 100 %></div>
							<!-- 할인율 0일때 추가로 적용시키기 -->
						</div>
					<% } 
				return; 
				} %>
				
				<!-- 판매자 아이디 검색 결과 -->
				<% if(comboValue.equals("sellerId")) {
					for(int i=0; i<listBySellerId.size(); i++) { 
						int itemPrice = listByAll.get(i).getPrice();
						int discountRate = listByAll.get(i).getDiscount(); %>
						<div class="product-div" onclick="location.href ='search2.jsp?itemName=<%=listBySellerId.get(i).getItemname()%>'">
						<!-- 해당 주소로 상세페이지 넘기기 -->
							<div class="img-box"><img src="resources/item/12.jpg" class="search-img-thumbnail" width="100%" height="225"></div>
							<div class="item-name-box"><%=listBySellerId.get(i).getItemname() %></div>
							<div class="item-price-box"><%=listBySellerId.get(i).getPrice() %></div>
							<div class="item-price-discount"><%=itemPrice * (100 - discountRate) / 100 %></div>
						</div>
					<% } 
				return; 
				} %>
				
				<!-- 상품 이름 검색 결과 -->
				<% if(comboValue.equals("itemName")) {
					for(int i=0; i<listByItemName.size(); i++) { 
						int itemPrice = listByAll.get(i).getPrice();
						int discountRate = listByAll.get(i).getDiscount(); %>
						<div class="product-div" onclick="location.href ='search2.jsp?itemName=<%=listByItemName.get(i).getItemname()%>'">
							<div class="img-box"><img src="resources/item/12.jpg" class="search-img-thumbnail" width="100%" height="225"></div>
							<div class="item-name-box"><%=listByItemName.get(i).getItemname() %></div>
							<div class="item-price-box"><%=listByItemName.get(i).getPrice() %></div>
							<div class="item-price-discount"><%=itemPrice * (100 - discountRate) / 100 %></div>
						</div>
					<% } 
				return; 
				} %>
				
				
				
				
		</div>
		
		
	</div>
	
	
</body>
</html>