<%@page import="java.util.List"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@page import="mybatis.Mybatis"%>
<%@page import="org.apache.ibatis.session.SqlSessionFactory"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%	SqlSessionFactory sqlSessionFactory = Mybatis.getSqlSessionFactory();
	SqlSession sess;
	sess = sqlSessionFactory.openSession(true); %>
	<!DOCTYPE html>
	<html>

	<head>
		<meta charset="UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<title>Document</title>
		<link rel="stylesheet" href="./mypage_master.css">
	</head>

	<body>
		<div id="wrap">
			<jsp:include page="header.jsp" flush="false" />
			<%-- <jsp:params name="상균" value="header" /> --%>
			<section id="main">
				<div id="left">

					<!-- 목록 -->
					<ul id="category">
						<li>
							<h1 id="mypage" onclick="getPage(this.id)">마이페이지</h1>
						</li>
						<li>
							<h2 id="pdPage" onclick="getPage(this.id)">상품 등록</h2>
						</li>
						<li>
							<h2 id="dvPage" onclick="getPage(this.id)">배송 관리</h2>
						</li>
						<li>
							<h2 id="psPage" onclick="getPage(this.id)">게시글 관리</h2>
						</li>
					</ul>
				</div>

				<div id="center">
					<!-- 내용 -->
					<div id="changePage">
						<div class="myPage">
							<div class="pie-chart1">
								<span class="center">
								</span>
							</div>
							<div class="pie-chart2">
								<span class="center">
								</span>
							</div>
						</div>
					</div>
				</div>
			</section>
		</div>


		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
		<script>
			// 페이지 전환 영역
			function getPage(id) {
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
			//마이페이지 그래프영역
			<% 
			/* int itemRecord = sess.selectOne("ItemSaleRecordSum");
			List<Integer> salList = sess.selectList("ItemSaleRecordSum");
			
			salList.stream().peek(t -> t/itemRecord).forEach(t -> System.out.println(t)); */
			%>



			
			
			
			
			//상품등록 페이지 영역
			$(document).on('click', '#fakeInputP1', function (e) { $('#realInputP1').click(); });
			$(document).on('click', '#fakeInputP2', function (e) { $('#realInputP2').click(); });
			$(document).on('click', '#fakeInputP3', function (e) { $('#realInputP3').click(); });

			
			
			//상품등록 페이지 - 상품이미지 기능
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