<%@ page import="java.text.DecimalFormat"%>
<%@ page import="java.util.HashMap"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="model.itemVO"%>
<%@ page import="org.apache.ibatis.session.SqlSessionFactory"%>
<%@ page import="org.apache.ibatis.session.SqlSession"%>
<%@ page import="mybatis.Mybatis"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Body</title>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD"
	crossorigin="anonymous">
<link rel="stylesheet" href="searchCss.css" />

<script>

.wrapper {
	width: 1280px;
	margin: 0 auto;
}
.search-list-box {
	display: flex;
	justify-content: start;
	flex-flow: wrap;
	margin: 30px auto;
}
.title-text-box {
    height: 80px;
    text-align: center;
    line-height: 80px;
    border-bottom: 3px solid darkgray;
}

</script>
</head>
<body>

	<%
	SqlSessionFactory sqlSessionFactory = Mybatis.getSqlSessionFactory();
	SqlSession Session;
	Session = sqlSessionFactory.openSession(true);
	//마이바티스 기초 셋팅

	List<itemVO> listByItemName = Session.selectList("itemByName");
	List<itemVO> listByPrice = Session.selectList("itemByPrice");
	List<itemVO> listByRdate = Session.selectList("itemByRdate");

	DecimalFormat decFormat = new DecimalFormat("###,###");
	%>

	<script>
		var index = 0; //이미지에 접근하는 인덱스
		window.onload = function() {
			slideShow();
		}

		function slideShow() {
			var i;
			var x = document.getElementsByClassName("slide1"); //slide1에 대한 dom 참조
			for (i = 0; i < x.length; i++) {
				x[i].style.display = "none"; //처음에 전부 display를 none으로 한다.
			}
			index++;
			if (index > x.length) {
				index = 1; //인덱스가 초과되면 1로 변경
			}
			x[index - 1].style.display = "block"; //해당 인덱스는 block으로
			setTimeout(slideShow, 4000); //함수를 4초마다 호출

		}
	</script>

	<div>
		<img class="slide1" src="./resources/body/slide01.jpg">
		<img class="slide1" src="./resources/body/slide02.jpg">
		<img class="slide1" src="./resources/body/slide03.jpg">
	</div>
	
<div class="wrapper"></div>

	<div class="title-text-box">
			<h2>전체 상품</h2>
		</div>

		<div id="product_total">
			<br/><br/>
			<p>
				Total&nbsp:&nbsp&nbsp<span><%=listByItemName.size()%></span>
			</p>
		</div>

	<div class="search-list-box">
	
		<% for(int i=0; i<listByItemName.size(); i++) { 
			int discounted = listByItemName.get(i).getPrice() / 100 * (100 - listByItemName.get(i).getDiscount());
			int itemSeq = listByItemName.get(i).getSeq();
		%>
		

			<div class="card" style="width: 24%; height: 400px;">
				<div class="card-img-box">
					<img
						src="./resources/item/<%=listByItemName.get(i).getSeq()%>(1).jpg"
						style="position: absolute; top: 0; left: 0; width: 100%; height: 100%;"
						class="card-img-top" alt="...">
				</div>
				<div class="card-body">
					<h5 class="card-title">
						<div id="itemName" class="text-large"><%=listByItemName.get(i).getItemname()%></div>
					</h5>
					<p class="card-text"></p>

					<%
					if (listByItemName.get(i).getDiscount() == 0) {
					%>
					<div id="itemPrice" class="text-small"><%=decFormat.format(listByItemName.get(i).getPrice())%>원
					</div>
					<%
					} else {
					%>
					<div id="itemPrice" class="text-small"
						style="text-decoration: line-through; color: #9E9E9E; font-size: 13px;"><%=decFormat.format(listByRdate.get(i).getPrice())%>원
					</div>
					<div id="itemDiscountPrice" class="text-large"><%=decFormat.format(discounted)%>원
					</div>
					<%
					}
					%>
					<div>
						<a href="./buyProcess/voShuttle.jsp?item_seq=<%=itemSeq%>"
							class="btn btn-primary" style="margin-bottom: 0">구매하기</a>
					</div>
				</div>
			</div>
			<%
			}
			
			%>

		</div>


	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN"
		crossorigin="anonymous"></script>
	<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
</body>
</html>