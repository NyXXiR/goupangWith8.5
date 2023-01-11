<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
	<% 
	byprice ~~ 
	
	list = [ 12 3 4 5 ];
	
	%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Goupang</title>
<style>
*{

box-sizing: border-box;
padding:0px;
margin:0px;
}
.flex-container {
	width: 500px;
	
	border-radius: 5px;
	background: #d3d3d3;
margin:0 auto;
	display: flex;
	justify-content: center;
}

.flex-container-large {
	width: 900px;
	
	border-radius: 5px;
	background: #d3d3d3;
margin:0 auto;
	display: flex;
	justify-content: space-evenly;
}

.flex-item {
width: 150px;
height: 150px;
	color: #fff;
	display: flex;
	border-radius: 5px;
	background: #708090;
	justify-content: center;
	object-fit:cover;
	}

.b-example-divider {
	height: 3rem;
	background-color: rgba(0, 0, 0, .1);
	border: solid rgba(0, 0, 0, .15);
	border-width: 1px 0;
	box-shadow: inset 0 .5em 1.5em rgba(0, 0, 0, .1), inset 0 .125em .5em
		rgba(0, 0, 0, .15);
}
</style>
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
		<img class="slide1" src="./resources/body/slide01.jpg"> <img class="slide1"
			src="./resources/body/slide02.jpg"> <img class="slide1"
			src="./resources/body/slide03.jpg">
	</div>

	<table>
		<h1>컨테이너이름입력</h1>
			<div class="flex-container">
				
				<div class="flex-item">
					<img alt="" src="./resources/item/3.jpg" onmouseenter="zoomIn(event)"
						onmouseleave="zoomOut(event)" />
						
				</div>
				<div class="flex-item">
					<img alt="" src="./resources/item/4.jpg" onmouseenter="zoomIn(event)"
						onmouseleave="zoomOut(event)" />
						
				</div>
				<div class="flex-item">
					<img alt="" src="./resources/item/5.jpg" onmouseenter="zoomIn(event)"
						onmouseleave="zoomOut(event)" />
					
				</div>
				</div>
	</table>

	

<table>
		<h1>컨테이너이름입력</h1>

		<div class="flex-container-large">
			<div class="flex-item">
				<img alt="" src="./resources/item/<%= dfdj.getSeq() %>.jpg" onmouseenter="zoomIn(event)"
					onmouseleave="zoomOut(event)" />
			</div>
			<div class="flex-item">
				<img alt="" src="./resources/item/12.jpg" onmouseenter="zoomIn(event)"
					onmouseleave="zoomOut(event)" />
			</div>
			<div class="flex-item">
				<img alt="" src="./resources/item/12.jpg" onmouseenter="zoomIn(event)"
					onmouseleave="zoomOut(event)" />
			</div>
			<div class="flex-item">
				<img alt="" src="./resources/item/13.jpg" onmouseenter="zoomIn(event)"
					onmouseleave="zoomOut(event)" />
			</div>
			<div class="flex-item">
				<img alt="" src="resources/item/14.jpg" onmouseenter="zoomIn(event)"
					onmouseleave="zoomOut(event)" />
			</div>
		</div>
	</table>

<table>
		<h1>컨테이너이름입력</h1>

		<div class="flex-container-large">
			<div class="flex-item">
				<img alt="" src="./resources/item/12.jpg" onmouseenter="zoomIn(event)"
					onmouseleave="zoomOut(event)" />
			</div>
			<div class="flex-item">
				<img alt="" src="./resources/item/12.jpg" onmouseenter="zoomIn(event)"
					onmouseleave="zoomOut(event)" />
			</div>
			<div class="flex-item">
				<img alt="" src="./resources/item/12.jpg" onmouseenter="zoomIn(event)"
					onmouseleave="zoomOut(event)" />
			</div>
			<div class="flex-item">
				<img alt="" src="./resources/item/13.jpg" onmouseenter="zoomIn(event)"
					onmouseleave="zoomOut(event)" />
			</div>
			<div class="flex-item">
				<img alt="" src="resources/item/14.jpg" onmouseenter="zoomIn(event)"
					onmouseleave="zoomOut(event)" />
			</div>
		</div>
	</table>
	<table>
		<h1>컨테이너이름입력</h1>

		<div class="flex-container-large">
			<div class="flex-item">
				<img alt="" src="./resources/item/12.jpg" onmouseenter="zoomIn(event)"
					onmouseleave="zoomOut(event)" />
			</div>
			<div class="flex-item">
				<img alt="" src="./resources/item/12.jpg" onmouseenter="zoomIn(event)"
					onmouseleave="zoomOut(event)" />
			</div>
			<div class="flex-item">
				<img alt="" src="./resources/item/12.jpg" onmouseenter="zoomIn(event)"
					onmouseleave="zoomOut(event)" />
			</div>
			<div class="flex-item">
				<img alt="" src="./resources/item/13.jpg" onmouseenter="zoomIn(event)"
					onmouseleave="zoomOut(event)" />
			</div>
			<div class="flex-item">
				<img alt="" src="resources/item/14.jpg" onmouseenter="zoomIn(event)"
					onmouseleave="zoomOut(event)" />
			</div>
		</div>
	</table>
	<table>
		<h1>컨테이너이름입력</h1>

		<div class="flex-container-large">
			<div class="flex-item">
				<img alt="" src="./resources/item/12.jpg" onmouseenter="zoomIn(event)"
					onmouseleave="zoomOut(event)" />
			</div>
			<div class="flex-item">
				<img alt="" src="./resources/item/12.jpg" onmouseenter="zoomIn(event)"
					onmouseleave="zoomOut(event)" />
			</div>
			<div class="flex-item">
				<img alt="" src="./resources/item/12.jpg" onmouseenter="zoomIn(event)"
					onmouseleave="zoomOut(event)" />
			</div>
			<div class="flex-item">
				<img alt="" src="./resources/item/13.jpg" onmouseenter="zoomIn(event)"
					onmouseleave="zoomOut(event)" />
			</div>
			<div class="flex-item">
				<img alt="" src="resources/item/14.jpg" onmouseenter="zoomIn(event)"
					onmouseleave="zoomOut(event)" />
			</div>
		</div>
	</table>
	</tr>
	</table>
	</div>
	<script>
		function zoomIn(event) {
			event.target.style.transform = "scale(1.2)";
			event.target.style.zIndex = 1;
			event.target.style.transition = "all 0.5s";
			event.target.style.opacity =0.5;
		}

		function zoomOut(event) {
			event.target.style.transform = "scale(1)";
			event.target.style.zIndex = 0;
			event.target.style.transition = "all 0.5s";
			event.target.style.opacity =1;
		}
	</script>

	<script src="/docs/5.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
		crossorigin="anonymous"></script>
</body>
</html>