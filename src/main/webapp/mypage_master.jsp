<%@page import="model.itemVO3"%>
<%@page import="model.itemVO"%>
<%@page import="java.util.List" %>
<%@page import="org.apache.ibatis.session.SqlSession" %>
<%@page import="mybatis.Mybatis" %>
<%@page import="org.apache.ibatis.session.SqlSessionFactory" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<% SqlSessionFactory sqlSessionFactory=Mybatis.getSqlSessionFactory(); SqlSession sess;
sess=sqlSessionFactory.openSession(true); %>

<%
	String right = request.getParameter("right");
	
	if(right == null){
		right = "myPage.jsp";
	}
%>
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
						<h1 id="myPage" onclick="location.href='mypage_master.jsp?right=myPage.jsp'">마이페이지</h1>
					</li>
					<li>
						<h2 id="pdPage" onclick="location.href='mypage_master.jsp?right=pdPage.jsp'">상품 등록</h2>
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
						<jsp:include page="<%=right %>"></jsp:include>
				</div>
			</div>
		</section>
	</div>


	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>
	<script>
//마이페이지 그래프영역


//최다 판매
<%
int itemRecordH = sess.selectOne("ItemSaleRecordHSum");
List <itemVO> salListH = sess.selectList("ItemSaleRecordHSearch");

double[] salarrH = new double[salListH.size()];
for (int i = 0; i < salListH.size(); i++) {
	salarrH[i] = salListH.get(i).getSalerecord();
	salarrH[i] = Math.round((salarrH[i] / itemRecordH * 100) * 100.0) / 100.0;
}
/* for (int i = 1; i < salListH.size(); i++) {
	salarrH[i] += salarrH[i-1];
} */
%>
<%-- $(function () {
	$('.pie-chart1').css({ "background": "conic-gradient(#7500f2 0% <%=salarrH[0]%>%,#0011ff <%=salarrH[0]%>% <%=salarrH[1]%>%,#03f0d1 <%=salarrH[1]%>% <%=salarrH[2]%>%,#0dfb05 <%=salarrH[2]%>% <%=salarrH[3]%>%,#d0fd06da <%=salarrH[3]%>% <%=salarrH[4]%>%,#fff83b <%=salarrH[4]%>% <%=salarrH[5]%>%,#f3a621 <%=salarrH[5]%>% <%=salarrH[6]%>%,#fc0101 <%=salarrH[6]%>% <%=salarrH[7]%>%,#fd00c2 <%=salarrH[7]%>% <%=salarrH[8]%>%,#9c9c9c <%=salarrH[8]%>% 100%)" });
}) --%>

const dougnut = document.getElementById('dougnutGraph');
 new Chart(dougnut, {
   type: 'doughnut',
   data: {
     labels: ['상품번호 : <%=salListH.get(0).getSeq()%>, 상품 이름 : <%=salListH.get(0).getItemname()%>','상품번호 : <%=salListH.get(1).getSeq()%>, 상품 이름 : <%=salListH.get(1).getItemname()%>','상품번호 : <%=salListH.get(2).getSeq()%>, 상품 이름 : <%=salListH.get(2).getItemname()%>','상품번호 : <%=salListH.get(3).getSeq()%>, 상품 이름 : <%=salListH.get(3).getItemname()%>','상품번호 : <%=salListH.get(4).getSeq()%>, 상품 이름 : <%=salListH.get(4).getItemname()%>','상품번호 : <%=salListH.get(5).getSeq()%>, 상품 이름 : <%=salListH.get(5).getItemname()%>','상품번호 : <%=salListH.get(6).getSeq()%>, 상품 이름 : <%=salListH.get(6).getItemname()%>','상품번호 : <%=salListH.get(7).getSeq()%>, 상품 이름 : <%=salListH.get(7).getItemname()%>','상품번호 : <%=salListH.get(8).getSeq()%>, 상품 이름 : <%=salListH.get(8).getItemname()%>','상품번호 : <%=salListH.get(9).getSeq()%>, 상품 이름 : <%=salListH.get(9).getItemname()%>'],
   datasets: [{
     label: '# of Votes',
     data: ['<%=salarrH[0]%>','<%=salarrH[1]%>','<%=salarrH[2]%>','<%=salarrH[3]%>','<%=salarrH[4]%>','<%=salarrH[5]%>','<%=salarrH[6]%>','<%=salarrH[7]%>','<%=salarrH[8]%>','<%=salarrH[9]%>'],
        backgroundColor: [
	        'rgb(255, 000, 000)','rgb(255, 001, 204)','rgb(255, 153, 000)','rgb(255, 204, 102)','rgb(152, 255, 153)',
	        'rgb(000, 204, 000)','rgb(000, 255, 204)','rgb(000, 051, 204)','rgb(102, 000, 204)','rgb(153, 153, 153)'
	      ],			        
        borderWidth: 1
      }]
    },
    options: {
      scales: {
        y: {
          beginAtZero: true
        }
      }
    }
  });
  
 
		
//최대 매출
<%
int sumMaxSale = sess.selectOne("Itemprice*recordSum");
 List<itemVO3> MaxSalList = sess.selectList("Itemprice*recordSearch");
 
 double[] dobSalList = new double[MaxSalList.size()];
 for (int i=0; i<dobSalList.length; i++) {
  dobSalList[i] = MaxSalList.get(i).getMulti();
  dobSalList[i] =  Math.round((dobSalList[i] / sumMaxSale * 100.0)*100.0)/100.0;
 }%>



const bar = document.getElementById('barGraph');
new Chart(bar, {
  type: 'bar',
  data: {
    labels: ['상품번호 : <%=MaxSalList.get(0).getSeq()%>, 상품 이름 : <%=MaxSalList.get(0).getItemname()%>','상품번호 : <%=MaxSalList.get(1).getSeq()%>, 상품 이름 : <%=MaxSalList.get(1).getItemname()%>','상품번호 : <%=MaxSalList.get(2).getSeq()%>, 상품 이름 : <%=MaxSalList.get(2).getItemname()%>','상품번호 : <%=MaxSalList.get(3).getSeq()%>, 상품 이름 : <%=MaxSalList.get(3).getItemname()%>','상품번호 : <%=MaxSalList.get(4).getSeq()%>, 상품 이름 : <%=MaxSalList.get(4).getItemname()%>','상품번호 : <%=MaxSalList.get(5).getSeq()%>, 상품 이름 : <%=MaxSalList.get(5).getItemname()%>','상품번호 : <%=MaxSalList.get(6).getSeq()%>, 상품 이름 : <%=MaxSalList.get(6).getItemname()%>','상품번호 : <%=MaxSalList.get(7).getSeq()%>, 상품 이름 : <%=MaxSalList.get(7).getItemname()%>','상품번호 : <%=MaxSalList.get(8).getSeq()%>, 상품 이름 : <%=MaxSalList.get(8).getItemname()%>','상품번호 : <%=MaxSalList.get(9).getSeq()%>, 상품 이름 : <%=MaxSalList.get(9).getItemname()%>'],
   datasets: [{
     label: '최대 매출 상품',
     data: ['<%=MaxSalList.get(0).getMulti()%>','<%=MaxSalList.get(1).getMulti()%>','<%=MaxSalList.get(2).getMulti()%>','<%=MaxSalList.get(3).getMulti()%>','<%=MaxSalList.get(4).getMulti()%>','<%=MaxSalList.get(5).getMulti()%>','<%=MaxSalList.get(6).getMulti()%>','<%=MaxSalList.get(7).getMulti()%>','<%=MaxSalList.get(8).getMulti()%>','<%=MaxSalList.get(9).getMulti()%>'],
        backgroundColor: [
	        'rgb(255, 000, 000)','rgb(255, 001, 204)','rgb(255, 153, 000)','rgb(255, 204, 102)','rgb(152, 255, 153)',
	        'rgb(000, 204, 000)','rgb(000, 255, 204)','rgb(000, 051, 204)','rgb(102, 000, 204)','rgb(153, 153, 153)'
	      ],			        
        borderWidth: 1
      }]
    },
    options: {
      scales: {
        y: {
          beginAtZero: true
        }
      }
    }
  });



//최소 판매
<%
int itemRecordR = sess.selectOne("ItemSaleRecordRSum");
List <itemVO3> salListR = sess.selectList("ItemSaleRecordRSearch");

%>
$(function(){
	<% for(int i=0; i<salListR.size(); i++){%>
var str = "<tr><td>"+<%=salListR.get(i).getSeq()%> + "</td>";
str += "<td>"+"<%=salListR.get(i).getItemname()%>"+ "</td>" ;
str += "<td>"+<%=salListR.get(i).getPrice()%>+ "</td>";
str += "<td>"+<%=salListR.get(i).getSalerecord()%>+ "</td>";
str += "<td>"+<%=salListR.get(i).getMulti()%>+"</td></tr>";
$('#minSaleItem').append(str);
<%}%>
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