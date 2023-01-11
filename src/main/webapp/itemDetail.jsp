<%@ page import="model.itemVO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
  <% itemVO vo =new itemVO(3,"아이패드",150000,0,"lgh0334","2023-01-09 16:25:39.000","전자기기");
  
  int discounted = vo.getPrice()/100*(100-vo.getDiscount());
  
  %>  
    
  
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>상세 페이지</title>

<style>
*{
border: 1px solid black;
box-sizing: border-box;
padding:0px;
margin:0px;

}
#itemDetail-container{
}

#itemImg{
width: 300px;
height: 300px;
background-color:tomato;
display: flex;

}
.prod-buy-quantity .quantity-count {
    display: table;
    width: auto;
    border: 1px solid #ccc;
    }
.text-small{
font-size:10px;
}
.text-medium{
	font-size:20px;
}
.text-large{
	font-size:30px;
}
#itemDetail-text > *{
    display:block;
}
#itemDetail-info{
	display:flex;
justify-content: center;
}
.prod-quantity__form{
display:inline;
}

.buy-action{
display:flex;}
</style>


</head>
<jsp:include page="header.jsp" flush="false"/>
<body>
<article id=itemDetail-container>
	<section id=itemDetail-info>
	<!-- 이미지파일명은 item의 PK와 일치해야 함 -->
	<figure id="itemImg"><img src="./resources/item/1.jpg" alt=""/>
	<div><!-- 판매자id 입력 --></div>
	</figure>
	<span id="itemDetail-text">
	<div id="itemDetail">
	<div id="itemDetail-category" class="text-medium"><!-- 대분류 입력 --><%= vo.getCategory() %></div>
	<div id="itemDetail-name" class="text-large"><!-- 제품명 입력 --><%= vo.getName() %></div>
	<div id="itemDetail-price" class="text-small"><!-- 제품가격 입력 -->제품가격: <%= vo.getPrice() %></div>
	<div id="itemDetail-discount" class="text-medium"><!-- 할인율 입력 -->할인율: <%= vo.getDiscount() %> </div>
	<div id="itemDetail-discountPrice" class="text-large"><!-- 할인적용가격 입력.... -->할인적용가격: <%= discounted %></div>
<div class="prod-quantity__form">
        <input type="text" value="1" class="quantity-count" readonly="true"  >
            <button class="quantity-minus" type="button" onclick="valueMinus(1)">수량 -  </button>
            <button class="quantity-plus" type="button" onclick="valuePlus(1)">수량  +  </button>
        </div>
        <div class="buy-action">
      <form action="buyPage.jsp" method="post">
      <input type="file" value="사진테스트">
<input type="submit" value="장바구니 담기">
</form>
<!--  
1. 받아야 할 정보들을 모아둔다
상세정보보기 페이지에서 해당 제품의 itemDB 정보를 미리 받아둬야 편함.
로그인id = session.getAttribute("signedUser")
제품정보 = seq
quantity = .quantity-count의 value값


2. ajax로 장바구니에 담겼습니다. 팝업과 구매페이지로 이동하기 버튼을 띄운다. 구매하기로 이동하기 버튼은 바로구매에 다시 사용한다.
 -->

<form action="buyPage.jsp" method="post">
<input type="submit" value="바로구매">
</form>

        </div>
        
	</div>
	
</span>





	</section>
	<section id=itemDescription>
        <h1>제품 설명</h1>
	<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Modi cumque quisquam culpa perspiciatis doloremque iste exercitationem repellat tempora alias doloribus. Pariatur perspiciatis aspernatur repudiandae harum corporis eaque minus modi repellendus?</p>
	</section>
	<!-- userID 인식해서 구매자일 경우 댓글달기 활성화,
	제품판매 당사자일 경우 답글달기 활성화-->
	<section id=itemReply>댓글란</section>
</article>

<article>
</article>


<script>

function valuePlus(num){
	var cnt =document.querySelector(".quantity-count");
	cnt.value= parseInt(cnt.value)+num;
	}
function valueMinus(num){
		var cnt =document.querySelector(".quantity-count");
		cnt.value= parseInt(cnt.value)-num;
		if(cnt.value==0){
			cnt.value=1;}
	}

	
</script>

</body>
</html>