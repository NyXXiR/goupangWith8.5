<%@page import="DAO.historyDAO"%>
<%@page import="model.historyVO"%>
<%@page import="DAO.ItemDao2"%>
<%@page import="model.itemVO3"%>
<%@page import="model.itemVO"%>
<%@page import="java.util.List" %>
<%@page import="org.apache.ibatis.session.SqlSession" %>
<%@page import="mybatis.Mybatis" %>
<%@page import="org.apache.ibatis.session.SqlSessionFactory" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% SqlSessionFactory sqlSessionFactory=Mybatis.getSqlSessionFactory(); SqlSession sess;
sess=sqlSessionFactory.openSession(true); 

	String sellerID = (String) session.getAttribute("sellerId");

	ItemDao2 itemdao = ItemDao2.getInstance();
	historyDAO hisDao = historyDAO.getInstance();

	String right = request.getParameter("right");
	if(request.getParameter("right") == null){
		right = "myPageMain.jsp";
	}else{
		right = request.getParameter("right");
	}
	/* System.out.print(right); */
	
	
	
	String numstr = request.getParameter("pageNum");
	int pageNum;
	if(request.getParameter("pageNum") == null){
		pageNum = 1;
	}else{
		pageNum = Integer.valueOf(numstr);
	}
	
	
	String listPage = request.getParameter("listPage");
	int minListPage;
	/* System.out.println(numstr); */
	if(request.getParameter("listPage") == null){
		minListPage = 1;
	}else{
		minListPage = Integer.valueOf(listPage);
	}
	
	
	//상품 등록된 갯수의 10.0으로 나누고 ceil로 올림처리하여 필요한 상품페이지를 반환받음
	//최대 상품이 98개라면 10개씩 등록했을때 9개의 페이지와 8개가 남게되는데, 남는 상품들을 위해서 올림 처리하여 8개도 보여지기 위해 (10번째 페이지를 위해) 올림처리
	int itemC = sess.selectOne("ItemAllCount");
	int maxListPage = (int)Math.ceil(itemC/10.0); 
	/* int maxListPage = 11; */ 
	int showListPage = minListPage+9;
	
	showListPage = showListPage < maxListPage ? showListPage : maxListPage;

%>
<c:set var="minListPage" value="<%=minListPage%>"/>
<c:set var="showListPage" value="<%=showListPage%>"/>
<c:set var="maxListPage" value="<%=maxListPage%>"/>


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
		<section id="main">
			<div id="left">

				<!-- 목록 -->
				<ul id="category">
					<li>
						<h1 id="myPage" onclick="location.href='mypage_master.jsp?right=myPageMain.jsp'">마이페이지</h1>
					</li>
					<li>
						<h2 id="pdPage" onclick="location.href='mypage_master.jsp?right=pdUpdatePage.jsp'">상품 등록</h2>
					</li>
					<li>
						<h2 id="pdPage" onclick="location.href='mypage_master.jsp?right=pdRetouchPage.jsp'">상품 수정</h2>
					</li>
					<li>
						<h2 id="dvPage" onclick="location.href='mypage_master.jsp?right=orderCarePage.jsp'">주문/배송 관리</h2>
					</li>
					<li>
						<h2 id="psPage" onclick="getPage(this.id)">게시글 관리</h2>
					</li>
				</ul>
			</div>

			<div id="center">
				<!-- 내용 -->
				<div id="changePage">
					<jsp:include page="<%=right %>"/>
					<div id="span" style="display : none"></div>	
						
				</div>
			</div>
		</section>
	</div>


	<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
	<script>
	
	
/*  *//*  *//*  *//*  *//*  *//*  *//*  *//*  *//*  *//*  *//*  *//*  *//*  *//*  *//*  *//*  *//*  *//*  *//*  *//*  *//*  *//*  *//*  *//*  *//*  */	
//마이페이지 그래프영역


//최다 판매 도넛 그래프
//최다 판매 상품 10개의 판매량을 합하여 itemRecordH에 대입시키고
//최다 판매 상품 10개를 List로 불러와 salercord, 즉  판매량 / 판매량의 합(itemRecordH)을 하여 최다 판매량의 퍼센트 비율을 구하여 도출하고 double배열에 담아준다.
//chart.js를 사용하여 도넛모양의 차트를 불러오고 chart.js의 data영역에 double배열인 salarrH를 순서대로 대입하여 퍼센트 비율을 나타냄
<%
int itemRecordH = sess.selectOne("ItemSaleRecordHSum");
List <itemVO> salListH = sess.selectList("ItemSaleRecordHSearch");

double[] salarrH = new double[salListH.size()];
for (int i = 0; i < salListH.size(); i++) {
	salarrH[i] = salListH.get(i).getSalerecord();
	salarrH[i] = Math.round((salarrH[i] / itemRecordH * 100) * 100.0) / 100.0;
}

%>


//최대 매출
//최대 매출을 확인하기 위하여 item가격과 판매량을 곱하여 가장 높은 매출을 기록한 상품을 10위까지 불러오고 더하여 sumMaxSale의 담아준다.
//똑같이 10위까지의 상품을 list의 담아주고 매출 / 전체매출을 해주어 매출의 퍼센트 비율을 반환 받는다.
//최대 매출은 bar형식의 그래프를 사용하여 아이템별 매출비율과 매출을 대입함
<%
int sumMaxSale = sess.selectOne("Itemprice*recordSum");
List<itemVO3> MaxSalList = sess.selectList("Itemprice*recordSearch");
%>



<%
//right가 mypagemain일때만 chart.js실행
if(right.equals("myPageMain.jsp")){
%>

let dougnut = document.getElementById('dougnutGraph');
let bar = document.getElementById('barGraph');

if(dougnut == null || bar == null){
	dougnut = document.getElementById('span');
	bar = document.getElementById('span');
}

 new Chart(dougnut, {
   type: 'doughnut',
   data: {
     labels: ['상품번호 : <%=salListH.get(0).getSeq()%>, 상품 이름 : <%=salListH.get(0).getItemname()%>',
    	 '상품번호 : <%=salListH.get(1).getSeq()%>, 상품 이름 : <%=salListH.get(1).getItemname()%>',
    	 '상품번호 : <%=salListH.get(2).getSeq()%>, 상품 이름 : <%=salListH.get(2).getItemname()%>',
    	 '상품번호 : <%=salListH.get(3).getSeq()%>, 상품 이름 : <%=salListH.get(3).getItemname()%>',
    	 '상품번호 : <%=salListH.get(4).getSeq()%>, 상품 이름 : <%=salListH.get(4).getItemname()%>',
    	 '상품번호 : <%=salListH.get(5).getSeq()%>, 상품 이름 : <%=salListH.get(5).getItemname()%>',
    	 '상품번호 : <%=salListH.get(6).getSeq()%>, 상품 이름 : <%=salListH.get(6).getItemname()%>',
    	 '상품번호 : <%=salListH.get(7).getSeq()%>, 상품 이름 : <%=salListH.get(7).getItemname()%>',
    	 '상품번호 : <%=salListH.get(8).getSeq()%>, 상품 이름 : <%=salListH.get(8).getItemname()%>',
    	 '상품번호 : <%=salListH.get(9).getSeq()%>, 상품 이름 : <%=salListH.get(9).getItemname()%>'],
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
  

new Chart(bar, {
  type: 'bar',
  data: {
    labels: ['상품번호 : <%=MaxSalList.get(0).getSeq()%>, 상품 이름 : <%=MaxSalList.get(0).getItemname()%>',
    	'상품번호 : <%=MaxSalList.get(1).getSeq()%>, 상품 이름 : <%=MaxSalList.get(1).getItemname()%>',
    	'상품번호 : <%=MaxSalList.get(2).getSeq()%>, 상품 이름 : <%=MaxSalList.get(2).getItemname()%>',
    	'상품번호 : <%=MaxSalList.get(3).getSeq()%>, 상품 이름 : <%=MaxSalList.get(3).getItemname()%>',
    	'상품번호 : <%=MaxSalList.get(4).getSeq()%>, 상품 이름 : <%=MaxSalList.get(4).getItemname()%>',
    	'상품번호 : <%=MaxSalList.get(5).getSeq()%>, 상품 이름 : <%=MaxSalList.get(5).getItemname()%>',
    	'상품번호 : <%=MaxSalList.get(6).getSeq()%>, 상품 이름 : <%=MaxSalList.get(6).getItemname()%>',
    	'상품번호 : <%=MaxSalList.get(7).getSeq()%>, 상품 이름 : <%=MaxSalList.get(7).getItemname()%>',
    	'상품번호 : <%=MaxSalList.get(8).getSeq()%>, 상품 이름 : <%=MaxSalList.get(8).getItemname()%>',
    	'상품번호 : <%=MaxSalList.get(9).getSeq()%>, 상품 이름 : <%=MaxSalList.get(9).getItemname()%>'],
   datasets: [{
     label: '최대 매출 상품',
     data: ['<%=MaxSalList.get(0).getMulti()%>','<%=MaxSalList.get(1).getMulti()%>','<%=MaxSalList.get(2).getMulti()%>',
    	 '<%=MaxSalList.get(3).getMulti()%>','<%=MaxSalList.get(4).getMulti()%>','<%=MaxSalList.get(5).getMulti()%>',
    	 '<%=MaxSalList.get(6).getMulti()%>','<%=MaxSalList.get(7).getMulti()%>','<%=MaxSalList.get(8).getMulti()%>','<%=MaxSalList.get(9).getMulti()%>'],
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
//판매량을 오름차순으로 정렬하여 가장 적게팔린 상품들을 10위까지 리스트로 받아서 table의 추가

<%
List <itemVO3> salListR = sess.selectList("ItemSaleRecordRSearch");
String itemMinSale = itemdao.itemMinTable(salListR);
%>
$('#minSaleItem').append("<%=itemMinSale%>");

<%
}
%>					
						
	



						
/*  *//*  *//*  *//*  *//*  *//*  *//*  *//*  *//*  *//*  *//*  *//*  *//*  *//*  *//*  *//*  *//*  *//*  *//*  *//*  *//*  *//*  *//*  *//*  */
//상품등록 페이지 영역
//input을 히든으로 두고 img박스를 클릭했을때 input 클릭반응을 이끌어내기 위해서 img박스에 클릭이벤트를 부여
$(document).on('click', '#fakeInputP1', function (e) { $('#realInputP1').click(); });
$(document).on('click', '#fakeInputP2', function (e) { $('#realInputP2').click(); });
$(document).on('click', '#fakeInputP3', function (e) { $('#realInputP3').click(); });

//상품등록 페이지 - 상품이미지 기능
//input에 accept="image/*"을 설정해두어 img파일들만 추가 가능한데, img파일을 선택하게 되면 세트로 묶여있는 img박스에 src영역에 선택한img파일의 주소값을 가져와 이미지가 보여지게 하는 기능
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




/*  *//*  *//*  *//*  *//*  *//*  *//*  *//*  *//*  *//*  *//*  *//*  *//*  *//*  *//*  *//*  *//*  *//*  *//*  *//*  *//*  *//*  */
//상품 수정 페이지 영역
//등록된 상품 리스트

//상품 리스트의 페이지 번호를 눌렀을때 pageNum을 파라미터로 받기 위한 기능
function locationNum(num){
	location.href="mypage_master.jsp?right=pdRetouchPage.jsp&pageNum="+num;
}		


$(function(){
<%	
	//상품 등록된 갯수를 불러와서 테이블 하단의 표시
int itemCount = sess.selectOne("ItemAllCount");
%>	$("#itemAllCount").html("전체 상품 수 :"+<%=itemCount%>);
<%


	
//상단에서 minListPage와 MaxListPage, showListPage를 설정해 두었는데,
//상품을 리스트화 했을때 10번 페이지가 넘어가게 되면 다음버튼이 활성화되게 하며 클릭시 minListPage, 다시 노출될 번호를 11로 지정해준다.
//마지막 번호와 현재보여지는 showListPage의 숫자가 같을때 다음 페이지가 사라지게 설정
//a 태그와 상단의 locationNum메서드 처리
for(int i=minListPage; i<= showListPage; i++){
%>	$('#itemCount').append("<a href='javascript:;' onclick='locationNum(<%=i%>)'>"+<%=i%>+"</a>");
<%
}
%>
	if(${minListPage == 1}){
		$('#itemCountMoveF').css("display","none");
	}else{
		$('#itemCountMoveF').css("display","block");
	}
		
	if(${maxListPage == showListPage}){
		$('#itemCountMoveT').css("display","none");
	}else{
		$('#itemCountMoveT').css("display","block");
	}


$('#itemCountMoveF').on('click',function(){
	location.href="mypage_master.jsp?right=pdRetouchPage.jsp&listPage="+<%=minListPage-10%>;
})
$('#itemCountMoveT').on('click',function(){
	location.href="mypage_master.jsp?right=pdRetouchPage.jsp&listPage="+<%=minListPage+10%>;
})
<%



// itemdao2의 설정해둔 메서드를 불러오는데,itemRetouchListMain는 내가 누른 상품리스트 pageNum,즉 상품수정 목록에 있는 상품리스트 하단의 페이지 번호를 받아 보여질 상품의 List를 반환받는데,
// 누른 값이 없다면(null&0일경우) 1이 반환되어 제일 앞부분의 영역이 노출되고,2를 누른다면 pageNum으로 매개변수가 들어가고 메서드에서 int x = (num-1)*10; int y = (num*10)-1; 처리하여
//최대값과 최솟값을 만들어 해당 영역을 잡아준 후 리스트를 반환받아 for문으로 테이블 추가
//상품이름을 눌렀을때 해당 상품의 seq로 서치하여 item수정영역으로 보내 수정할 수 있도록 처리
List<itemVO> itemList = itemdao.itemRetouchListMain(pageNum);
String itemTableEl = itemdao.itemListTable(itemList);
%>
$('#itemListadd').html("<%=itemTableEl%>");
	
})




/* //수정영역인 pdRetouchitempage로 이동하면서 파라미터값으로 seq를 보낸다. */
function callRetouchItem(num){
	location.href="mypage_master.jsp?right=pdRetouchItemPage.jsp&reItemNum="+num;
}





//수정할 상품을 찾는 기능
$(function(){
	<%
	String str = "pdRetouchPage2.jsp";
	if(right.equals(str)){
		String itemK = request.getParameter("searchItemkey");
		String itemV = request.getParameter("searchItemValue");
		List<itemVO> itemSearchList =  itemdao.itemSearchList(itemK,itemV);
		String itemEle = itemdao.itemListTable(itemSearchList);
	%>$('#itemListadd2').html("<%=itemEle%>");
	  $("#itemAllCount2").html("검색 상품 수 :"+<%=itemSearchList.size()%>);
	<%	
	}
	%>
})




/*  *//*  *//*  *//*  *//*  *//*  *//*  *//*  *//*  *//*  *//*  *//*  *//*  *//*  *//*  *//*  *//*  *//*  *//*  *//*  *//*  *//*  */
//주문내역 처리영역
$(function(){
	
<%
List<historyVO> orderList = sess.selectList("orderAllSelect");
String orderstr = hisDao.orderTable(orderList);
%>
$('#orderTableAdd').append("<%=orderstr%>");
})

function orderStChange(num){
	location.href="mypage_master.jsp?right=orderStPage.jsp&orderNum="+num;
}

</script>

</body>

</html>