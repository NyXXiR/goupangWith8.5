<%@page import="java.util.List" %>
	<%@page import="org.apache.ibatis.session.SqlSession" %>
		<%@page import="mybatis.Mybatis" %>
			<%@page import="org.apache.ibatis.session.SqlSessionFactory" %>
				<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
					<% SqlSessionFactory sqlSessionFactory=Mybatis.getSqlSessionFactory(); SqlSession sess;
						sess=sqlSessionFactory.openSession(true); %>
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
			
<<<<<<< Updated upstream
<<<<<<< HEAD
			//salList.stream().peek(t -> t/itemRecord).forEach(t -> System.out.println(t));
			%> 
=======
			salList.stream().peek(t -> t/itemRecord).forEach(t -> System.out.println(t)); */
			%>
>>>>>>> d5e651a9b7e9b5a0f32616b010bfbc3af7fde5ac

=======
			//.pie-chart1
			<%
			int itemRecordH = sess.selectOne("ItemSaleRecordHSum");
			List < Integer > salListH = sess.selectList("ItemSaleRecordHSearch");
>>>>>>> Stashed changes

			double[] salarrH = new double[salListH.size()];

			for (int i = 0; i < salListH.size(); i++) {
				salarrH[i] = salListH.get(i);
				salarrH[i] = Math.round((salarrH[i] / itemRecordH * 100) * 100.0) / 100.0;
			}
			for (int i = 1; i < salListH.size(); i++) {
				salarrH[i] += salarrH[i-1];
				System.out.println(salarrH[i]);
			}
			%>
			
			
			
			//.pie-chart2
			<%
			int itemRecordR = sess.selectOne("ItemSaleRecordRSum");
			List < Integer > salListR = sess.selectList("ItemSaleRecordRSearch");
			
			double[] salarrR = new double[salListR.size()];

			for (int i = 0; i < salListR.size(); i++) {
				salarrR[i] = salListR.get(i);
				salarrR[i] = Math.round((salarrR[i] / itemRecordR * 100) * 100.0) / 100.0;
			}
			for (int i = 1; i < salListR.size(); i++) {
				salarrR[i] += salarrR[i-1];
				System.out.println(salarrR[i]);
			}
			%>
									
									$(function () {
										$('.pie-chart1').css({ "background": "conic-gradient(#7500f2 0% <%=salarrH[0]%>%,#0011ff <%=salarrH[0]%>% <%=salarrH[1]%>%,#03f0d1 <%=salarrH[1]%>% <%=salarrH[2]%>%,#0dfb05 <%=salarrH[2]%>% <%=salarrH[3]%>%,#d0fd06da <%=salarrH[3]%>% <%=salarrH[4]%>%,#fff83b <%=salarrH[4]%>% <%=salarrH[5]%>%,#f3a621 <%=salarrH[5]%>% <%=salarrH[6]%>%,#fc0101 <%=salarrH[6]%>% <%=salarrH[7]%>%,#fd00c2 <%=salarrH[7]%>% <%=salarrH[8]%>%,#9c9c9c <%=salarrH[8]%>% 100%)" });
									})
									
									$(function () {
										$('.pie-chart2').css({ "background": "conic-gradient(#7500f2 0% <%=salarrR[0]%>%,#0011ff <%=salarrR[0]%>% <%=salarrR[1]%>%,#03f0d1 <%=salarrR[1]%>% <%=salarrR[2]%>%,#0dfb05 <%=salarrR[2]%>% <%=salarrR[3]%>%,#d0fd06da <%=salarrR[3]%>% <%=salarrR[4]%>%,#fff83b <%=salarrR[4]%>% <%=salarrR[5]%>%,#f3a621 <%=salarrR[5]%>% <%=salarrR[6]%>%,#fc0101 <%=salarrR[6]%>% <%=salarrR[7]%>%,#fd00c2 <%=salarrR[7]%>% <%=salarrR[8]%>%,#9c9c9c <%=salarrR[8]%>% 100%)" });
									})
									


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