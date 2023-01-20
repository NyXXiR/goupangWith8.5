<%@page import="java.util.HashMap"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.itemVO"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@page import="mybatis.Mybatis"%>
<%@page import="org.apache.ibatis.session.SqlSessionFactory"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>검색 버튼 누르면 출력되는 화면</title>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD"
	crossorigin="anonymous">
<link rel="stylesheet" href="headerCSS.css" />
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
							String itemSeq = itemMap.get("seq");
							%>
							
							
						<div class="card" style="width: 24%">
							<img src="./resources/item/<%=listByAll.get(i).getImgsrc() %>" class="card-img-top" alt="...">
							<div class="card-body">
								<h5 class="card-title"><div id="itemName" class="text-large"><%=listByAll.get(i).getItemname()%></div></h5>
								<p class="card-text"></p>
								<div id="itemPrice" class="text-small" style="text-decoration:line-through"><%=listByAll.get(i).getPrice()%>원</div>
								<div id="itemDiscountPrice" class="text-large"><%= discounted %>원</div>
								<div><a href="login.jsp?a=<%=itemSeq %>" class="btn btn-primary" style="margin-bottom:0">구매하기</a></div>
							</div>
						</div>
				<% 	}
				}
				%>
				
				
				<% if(comboValue.equals("sellerId")) {
					for(int i=0; i<listBySellerId.size(); i++) { 
						int discounted = listBySellerId.get(i).getPrice() / 100 * (100 - listBySellerId.get(i).getDiscount());
						HashMap<String, String> itemMap = new HashMap<>(); 
							String itemSeq = itemMap.get("seq");
							%>
							
							
						<div class="card" style="width: 24%">
							<img src="./resources/item/<%=listBySellerId.get(i).getImgsrc() %>" class="card-img-top" alt="...">
							<div class="card-body">
								<h5 class="card-title"><div id="itemName" class="text-large"><%=listBySellerId.get(i).getItemname()%></div></h5>
								<p class="card-text"></p>
								<div id="itemPrice" class="text-small" style="text-decoration:line-through"><%=listBySellerId.get(i).getPrice()%>원</div>
								<div id="itemDiscountPrice" class="text-large"><%= discounted %>원</div>
								<div><a href="login.jsp?a=<%=itemSeq %>" class="btn btn-primary" style="margin-bottom:0">구매하기</a></div>
							</div>
						</div>
				<% 	}
				}
				%>
				
				<% if(comboValue.equals("itemName")) {
					for(int i=0; i<listByItemName.size(); i++) { 
						int discounted = listByItemName.get(i).getPrice() / 100 * (100 - listByItemName.get(i).getDiscount());
						HashMap<String, String> itemMap = new HashMap<>(); 
							String itemSeq = itemMap.get("seq");
							%>
							
							
						<div class="card" style="width: 24%">
							<img src="./resources/item/<%=listByItemName.get(i).getImgsrc() %>" class="card-img-top" alt="...">
							<div class="card-body">
								<h5 class="card-title"><div id="itemName" class="text-large"><%=listByItemName.get(i).getItemname()%></div></h5>
								<p class="card-text"></p>
								<div id="itemPrice" class="text-small" style="text-decoration:line-through"><%=listByItemName.get(i).getPrice()%>원</div>
								<div id="itemDiscountPrice" class="text-large"><%= discounted %>원</div>
								<div><a href="login.jsp?a=<%=itemSeq %>" class="btn btn-primary" style="margin-bottom:0">구매하기</a></div>
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