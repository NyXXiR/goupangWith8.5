<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

	<!DOCTYPE html>
	<html>

	<head>
		<meta charset="UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<title>Document</title>
		<link rel="stylesheet" href="./mypage.css">
	</head>

	<body>
		<div id="wrap">
			<header id="header"> </header>
			<section id="main">

				<div id="left">
					<!-- 목록 -->
					<ul id="category">
						<li>
							<h1 id="myPage" onclick="getPage(this.id)" val="1">마이페이지</h1>
						</li>
						<li>
							<h2 id="pdPage" onclick="getPage(this.id)" val="2">상품 관리</h2>
						</li>
						<li>
							<h2 id="dvPage" onclick="getPage(this.id)" val="3">배송 관리</h2>
						</li>
						<li>
							<h2 id="psPage" onclick="getPage(this.id)" val="4">게시글 관리</h2>
						</li>
					</ul>
				</div>

				<div id="center">
					<!-- 내용 -->
					<div id="changePage">
						<table class="pdTable">
							<tr>
								<td>
									<h3>상품번호<% %></h3>
								</td>
							</tr>
						</table>

						<table class="pdTable">
							<tr>
								<td>
									<h3>상품명</h3>
								</td>
							</tr>
							<tr>
								<td class="pdInput"><input type="text" name="pdName"></td>
							</tr>
						</table>

						<table class="pdTable">
							<tr>
								<td>
									<h3>가격</h3>
								</td>
							</tr>
							<tr>
								<td class="pdInput"><input type="text" name="pdPrice"></td>
							</tr>
						</table>
						
						<table class="pdTable">
							<tr>
								<td>
									<h3>재고수량</h3>
								</td>
							</tr>
							<tr>
								<td class="pdInput"><input type="text" name="pdPrice"></td>
							</tr>
						</table>

						<table class="pdTable">
							<tr>
								<td>
									<h3>제품사진</h3>
								</td>
							</tr>
							<tr>
								<td class="pdInputP">
									<form action="upload" name="upload1" method="post" enctype="multipart/form-data">
										<img id="fakeInputP1" class="fakeInputP" ></img>
										<input type="file" name="pdPhoto" accept="image/*" onchange="readURL1(this)" required
											id="realInput">
									</form>
									<form action="upload" name="upload2" method="post" enctype="multipart/form-data">
										<img id="fakeInputP2" class="fakeInputP" ></img>
										<input type="file" name="pdPhoto" accept="image/*" onchange="readURL2(this)" required
											id="realInput">
									</form>
									<form action="upload" name="upload3" method="post" enctype="multipart/form-data">
										<img id="fakeInputP3" class="fakeInputP" ></img>
										<input type="file" name="pdPhoto" accept="image/*" onchange="readURL3(this)" required
											id="realInput">
									</form>
								</td>
							</tr>
						</table>

						<table class="pdTable">
							<tr>
								<td>
									<h3>상세설명</h3>
								</td>
							</tr>
							<tr>
								<td class="pdInput"><input type="text" name="pdEx" id="pdInput2"></td>
							</tr>
						</table>

					</div>
				</div>
			</section>
		</div>


		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
		<script>
			function getPage(id) {
				// console.log(id);
				var xhttp;
				xhttp = new XMLHttpRequest();
				xhttp.onreadystatechange = function () {
					if (this.readyState == 4 && this.status == 200) {
						document.getElementById("changePage")
							.innerHTML = xhttp.responseText;
					}
				}
				xhttp.open("GET", "./" + id + ".jsp", true);
				xhttp.send();
			}

			for (let i = 1; i < 4; i++) {
				$('#fakeInputP' + i).click(function () {
					$('#realInputP' + i).click();
				})
			}

			
			
			
			
			function readURL1(input) {
				if (input.files && input.files[0]) {
					const reader = new FileReader();

					reader.onload = (e) => {
						const previewImage = document.getElementById('fakeInputP1');
						previewImage.src = e.target.result;
					}
					reader.readAsDataURL(input.files[0]);
				}
			}
			function readURL2(input) {
				if (input.files && input.files[0]) {
					const reader = new FileReader();

					reader.onload = (e) => {
						const previewImage = document.getElementById('fakeInputP2');
						previewImage.src = e.target.result;
					}
					reader.readAsDataURL(input.files[0]);
				}
			}
			function readURL3(input) {
				if (input.files && input.files[0]) {
					const reader = new FileReader();

					reader.onload = (e) => {
						const previewImage = document.getElementById('fakeInputP3');
						previewImage.src = e.target.result;
					}
					reader.readAsDataURL(input.files[0]);
				}
			}

		</script>

	</body>

	</html>