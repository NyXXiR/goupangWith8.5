<%@page import="java.util.List"%>
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
<title>Insert title here</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD"
	crossorigin="anonymous">

</head>
<body>

	<%
	itemVO vo1 = new itemVO(3, "아이패드", 150000, 0, "lgh0334", "2023-01-09 16:25:39.000", 30, 10, "아이가 사용한다", 146);
	itemVO vo2 = new itemVO(15, "스마트폰", 1000000, 15, "lgh0334", "2023-01-09 16:25:39.000", 30, 10, "스마트하다", 10);
	itemVO vo3 = new itemVO(5, "에어팟", 1300000, 50, "ninja", "2023-01-09 16:25:39.000", 30, 10, "공기", 86);
	itemVO vo4 = new itemVO(6, "키보드", 50000, 0, "ninja", "2023-01-09 16:25:39.000", 30, 10, "키가타는보드", 111);
	itemVO vo5 = new itemVO(4, "조던1스캇", 300000, 0, "shoeslover", "2023-01-09 16:25:39.000", 10, 10, "", 0);
	itemVO vo6 = new itemVO(12, "브링그린 뱀부 차콜 모공 정화 클렌징 폼", 11000, 13, "lgh0334", "2023-01-09 16:25:39.000", 70, 10, "", 0);
	itemVO vo7 = new itemVO(13, "크런키 볼", 1050, 0, "lgh0334", "2023-01-09 16:25:39.000", 40, 5, "볼", 12);
	itemVO vo8 = new itemVO(14, "보조배터리", 20000, 10, "lgh0334", "2023-01-09 16:25:39.000", 30, 5, "보조", 11);
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
	

	<h1>컨테이너이름입력</h1>
	<div class="flex-container"></div>
	
		<div class="row">
			<div class="col"></div>
			<div class="card" style="width: 18rem;">
				<img src="./resources/item/3.jpg" class="card-img-top" alt="...">
				<div class="card-body">
					<h5 class="card-title">
						<div id="itemDetail-name" class="text-large"><%=vo1.getItemname()%></div>
					</h5>
					<p class="card-text"></p>
					<div id="itemDetail-price" class="text-small">
						<%=vo1.getPrice()%>원
					</div>
					<a href="#a" class="btn btn-primary">구매하기</a>
				</div>
			</div>

			<div class="col"></div>
			<div class="card" style="width: 18rem;">
				<img src="./resources/item/15.jpg" class="card-img-top" alt="...">
				<div class="card-body">
					<h5 class="card-title">
						<div id="itemDetail-name" class="text-large"><%=vo2.getItemname()%></div>
					</h5>
					<p class="card-text"></p>
					<div id="itemDetail-price" class="text-small">
						<%=vo2.getPrice()%>원
					</div>
					<a href="#a" class="btn btn-primary">구매하기</a>
				</div>
			</div>

			<div class="col"></div>
			<div class="card" style="width: 18rem;">
				<img src="./resources/item/5.jpg" class="card-img-top" alt="...">
				<div class="card-body">
					<h5 class="card-title">
						<div id="itemDetail-name" class="text-large"><%=vo3.getItemname()%></div>
					</h5>
					<p class="card-text"></p>
					<div id="itemDetail-price" class="text-small">
						<%=vo3.getPrice()%>원
					</div>
					<a href="#a" class="btn btn-primary">구매하기</a>
				</div>
			</div>

			<div class="col"></div>
			<div class="card" style="width: 18rem;">
				<img src="./resources/item/6.png" class="card-img-top" alt="...">
				<div class="card-body">
					<h5 class="card-title">
						<div id="itemDetail-name" class="text-large"><%=vo4.getItemname()%></div>
					</h5>
					<p class="card-text"></p>
					<div id="itemDetail-price" class="text-small">
						<%=vo4.getPrice()%>원
					</div>
					<a href="#a" class="btn btn-primary">구매하기</a>
				</div>
			</div>
		</div>
		
		<h1>컨테이너이름입력</h1>
		<div class="flex-container"></div>
			<div class="row">
				<div class="col"></div>
				<div class="card" style="width: 18rem;">
					<img src="./resources/item/4.jpg" class="card-img-top" alt="...">
					<div class="card-body">
						<h5 class="card-title">
							<div id="itemDetail-name" class="text-large"><%=vo5.getItemname()%></div>
						</h5>
						<p class="card-text"></p>
						<div id="itemDetail-price" class="text-small">
							<%=vo5.getPrice()%>원
						</div>
						
						<a href="#a" class="btn btn-primary">구매하기</a>
					</div>
				</div>

				<div class="col"></div>
				<div class="card" style="width: 18rem;">
					<img src="./resources/item/12.jpg" class="card-img-top" alt="...">
					<div class="card-body">
						<h5 class="card-title">
							<div id="itemDetail-name" class="text-large"><%=vo6.getItemname()%></div>
						</h5>
						<p class="card-text"></p>
						<div id="itemDetail-price" class="text-small">
							<%=vo6.getPrice()%>원
						</div>
						<a href="#a" class="btn btn-primary">구매하기</a>
					</div>
				</div>

				<div class="col"></div>
				<div class="card" style="width: 18rem;">
					<img src="./resources/item/13.jpg" class="card-img-top" alt="...">
					<div class="card-body">
						<h5 class="card-title">
							<div id="itemDetail-name" class="text-large"><%=vo7.getItemname()%></div>
						</h5>
						<p class="card-text">
						<div id="itemDetail-price" class="text-small">
							<%=vo7.getPrice()%>원
						</div>
						</p>
						<a href="#a" class="btn btn-primary">구매하기</a>
					</div>
				</div>

				<div class="col"></div>
				<div class="card" style="width: 18rem;">
					<img src="./resources/item/14.jpg" class="card-img-top" alt="...">
					<div class="card-body">
						<h5 class="card-title">
							<div id="itemDetail-name" class="text-large"><%=vo8.getItemname()%></div>
						</h5>
						<p class="card-text"></p>
						<div id="itemDetail-price" class="text-small">
							<%=vo8.getPrice()%>원
						</div>
						<a href="#a" class="btn btn-primary">구매하기</a>
					</div>
				</div>
			</div>

			<script
				src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"
				integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN"
				crossorigin="anonymous"></script>
</body>
</html>