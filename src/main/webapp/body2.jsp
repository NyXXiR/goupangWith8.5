<%@ page import="model.itemVO"%>
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
		<img class="slide1" src="./resources/body/slide01.jpg"> <img
			class="slide1" src="./resources/body/slide02.jpg"> <img
			class="slide1" src="./resources/body/slide03.jpg">
	</div>
	<h1>컨테이너이름입력</h1>
		<div class="flex-container">
	<div class="row">
		<div class="col"></div>
		<div class="card" style="width: 18rem;">
			<img src="./resources/item/3.jpg" class="card-img-top" alt="...">
			<div class="card-body">
				<h5 class="card-title">아이패드</h5>
				<p class="card-text">아이패드</p>
				<a href="#" class="btn btn-primary">Go somewhere</a>
			</div>
		</div>

		<div class="col"></div>
		<div class="card" style="width: 18rem;">
			<img src="./resources/item/3.jpg" class="card-img-top" alt="...">
			<div class="card-body">
				<h5 class="card-title">아이패드</h5>
				<p class="card-text">아이패드</p>
				<a href="#" class="btn btn-primary">Go somewhere</a>
			</div>
		</div>

		<div class="col"></div>
		<div class="card" style="width: 18rem;">
			<img src="./resources/item/3.jpg" class="card-img-top" alt="...">
			<div class="card-body">
				<h5 class="card-title">Card title</h5>
				<p class="card-text">Some quick example text to build on the
					card title and make up the bulk of the card's content.</p>
				<a href="#" class="btn btn-primary">Go somewhere</a>
			</div>
		</div>

		<div class="col"></div>
		<div class="card" style="width: 18rem;">
			<img src="./resources/item/3.jpg" class="card-img-top" alt="...">
			<div class="card-body">
				<h5 class="card-title">Card title</h5>
				<p class="card-text">Some quick example text to build on the
					card title and make up the bulk of the card's content.</p>
				<a href="#" class="btn btn-primary">Go somewhere</a>
			</div>
		</div>
	</div>
	<h1>컨테이너이름입력</h1>
		<div class="flex-container">
	<div class="row">
		<div class="col"></div>
		<div class="card" style="width: 18rem;">
			<img src="./resources/item/3.jpg" class="card-img-top" alt="...">
			<div class="card-body">
				<h5 class="card-title">아이패드</h5>
				<p class="card-text">아이패드</p>
				<a href="#" class="btn btn-primary">Go somewhere</a>
			</div>
		</div>

		<div class="col"></div>
		<div class="card" style="width: 18rem;">
			<img src="./resources/item/3.jpg" class="card-img-top" alt="...">
			<div class="card-body">
				<h5 class="card-title">아이패드</h5>
				<p class="card-text">아이패드</p>
				<a href="#" class="btn btn-primary">Go somewhere</a>
			</div>
		</div>

		<div class="col"></div>
		<div class="card" style="width: 18rem;">
			<img src="./resources/item/3.jpg" class="card-img-top" alt="...">
			<div class="card-body">
				<h5 class="card-title">Card title</h5>
				<p class="card-text">Some quick example text to build on the
					card title and make up the bulk of the card's content.</p>
				<a href="#" class="btn btn-primary">Go somewhere</a>
			</div>
		</div>

		<div class="col"></div>
		<div class="card" style="width: 18rem;">
			<img src="./resources/item/3.jpg" class="card-img-top" alt="...">
			<div class="card-body">
				<h5 class="card-title">Card title</h5>
				<p class="card-text">Some quick example text to build on the
					card title and make up the bulk of the card's content.</p>
				<a href="#" class="btn btn-primary">Go somewhere</a>
			</div>
		</div>
	</div>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN"
		crossorigin="anonymous"></script>
</body>
</html>