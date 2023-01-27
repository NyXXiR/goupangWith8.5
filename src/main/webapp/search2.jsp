<%@page import="java.text.DecimalFormat"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.itemVO"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@page import="mybatis.Mybatis"%>
<%@page import="org.apache.ibatis.session.SqlSessionFactory"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
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


DecimalFormat decFormat = new DecimalFormat("###,###");
// 상품 금액 3자리마다 , 삽입하는 기능 위해
//List<itemVO> testSort = Session.selectList("sortBySalesRecord");
%>

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
<link rel="stylesheet" href="searchCss.css" />
</head>
<body>

<script>
	function sortBySalesRecord() {
	$.ajax({
		type: "GET",
		//method: "sortItemsByRanking",  
		url: "./sortProcess/sortBySalesRecord.jsp",
		success: function(data) {
			$(".search-list-box").html(data);
		},
		error: function(request, status, error) {
			alert(error);
		}
	});
}
	function selectAllProduct() {
		$.ajax({
			type: "GET",
			//method: "sortItemsByRanking",  
			url: "./sortProcess/selectAllProduct.jsp",
			success: function(data) {
				$(".search-list-box").html(data);
			},
			error: function(request, status, error) {
				alert(error);
			}
		});
	}
	
	function catenum10() {
		$.ajax({
			type: "GET",
			//method: "sortItemsByRanking",  
			url: "./sortProcess/catenum10.jsp",
			success: function(data) {
				$(".search-list-box").html(data);
			},
			error: function(request, status, error) {
				alert(error);
			}
		});
	}
</script>

<!-- 해결해야 할 문제 -->

<!-- 랭킹, 카테고리, 전체 버튼 sort 기능 -->
<!-- 마이페이지 연동 방법 -->

<jsp:include page="header.jsp" flush="false"/>
		
<div class="wrapper">
	
		<!-- sort button area -->
		<div class="sort-btn-box">
			<div class="sort-by-rank" onclick="sortBySalesRecord()">랭킹</div>
			<div class="sort-by-category" onclick="sortTest()"><a href="#">카테고리</a>
				<div class="category-dropbox">
					<ul>
						<li onclick="catenum10()">패션</li>
						<li onclick="catenum20()">뷰티</li>
						<li onclick="catenum30()">전자제품</li>
						<li onclick="catenum40()">팬트리</li>
						<li onclick="catenum50()">자동차 용품</li>
						<li onclick="catenum60()">완구</li>
						<li onclick="catenum70()">기타</li>
					</ul>
				</div>
			</div>
			<div class="recommend">추천 상품</div>
			<!-- 로그인 한 유저가 특정 상품 클릭 할 때마다, db의 카테고리 column 숫자가 1씩 올라감. 가장 높은 숫자의 카테고리 상품부터 순차적으로 출력하기 -->
			<div class="show-all" onclick="selectAllProduct()">전체</div>
			<!-- search-wrapper 영역에 ajax 통해서 부분 렌더링 하기 -->
		</div>

		<div class="title-text-box">
			<h2>상품 리스트</h2>
		</div>

		<!-- 검색 상품 출력 란 --> 
		
		<div class="search-wrapper">
			<div id = "product_total">
			<br/><br/>
				<p>Total&nbsp:&nbsp&nbsp<span><%=listByAll.size() %></span></p>
			</div>
			
			<div class="search-list-box">
			
				<!-- 전체 상품 검색 결과 -->
				
					<% for(int i=0; i<listByAll.size(); i++) { 
						int discounted = listByAll.get(i).getPrice() / 100 * (100 - listByAll.get(i).getDiscount());
						int itemSeq = listByAll.get(i).getSeq();
							%>
<<<<<<< Updated upstream
							
=======
>>>>>>> Stashed changes
							
						<div class="card" style="width: 24%; height: 400px;">
							<div class="card-img-box">
								<img src="./resources/item/<%=listByAll.get(i).getSeq() %>(1).jpg" style="position: absolute; top: 0; left: 0; width: 100%; height: 100%;" class="card-img-top" alt="..."> 
							</div>
							<div class="card-body">
								<h5 class="card-title"><div id="itemName" class="text-large"><%=listByAll.get(i).getItemname()%></div></h5>
								<p class="card-text"></p>
								
								<%if(listByAll.get(i).getDiscount()==0) {
									%>
										<div id="itemPrice" class="text-small"><%= decFormat.format(listByAll.get(i).getPrice())%>원</div> 
									<% 
								} else {
									%>
										<div id="itemPrice" class="text-small" style="text-decoration:line-through; font-size: 13px;"><%=decFormat.format(listByAll.get(i).getPrice())%>원</div>
										<div id="itemDiscountPrice" class="text-large"><%= decFormat.format(discounted) %>원</div>
								    <% 
									}
									%>
								<div><a href="./buyProcess/voShuttle.jsp?item_seq=<%=itemSeq %>" class="btn btn-primary" style="margin-bottom:0">구매하기</a></div>
							</div>
					</div>
				<% 	}%>
				
			</div>	
		</div>
	</div>
	
<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
</body>
</html>