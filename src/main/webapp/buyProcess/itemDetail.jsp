<%@ page import="model.itemVO" %>
<%@ page import= "java.util.HashMap" %>
<%@ page import="org.apache.ibatis.session.SqlSessionFactory"%>
<%@ page import="org.apache.ibatis.session.SqlSession"%>
<%@ page import="model.itemVO"%>
<%@ page import="model.cartItemVO"%>
<%@ page import="mybatis.Mybatis"%>
<%@ page import="java.util.List" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<% HashMap<String,String> itemMap =(HashMap<String, String>) session.getAttribute("itemMap"); %>
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
display:flex;
}

.buy-action{
display:flex;}
</style>


</head>
<jsp:include page="../header.jsp" flush="false"/>
<body>
<article id=itemDetail-container>
	<section id=itemDetail-info>
	<!-- 이미지파일명은 item의 PK와 일치해야 함 -->
	<figure id="itemImg"><img src="../resources/item/3.jpg" alt=""/>
	<div><!-- 판매자id 입력 --></div>
	</figure>
	
	
	
	<span id="itemDetail-text">
	<div id="itemDetail">
	<div id="itemDetail-category" class="text-medium"><!-- 대분류 입력 --><%= itemMap.get("category_num") %></div>
	<div id="itemDetail-name" class="text-large"><!-- 제품명 입력 --><%= itemMap.get("name") %></div>
	<div id="itemDetail-price" class="text-small"><!-- 제품가격 입력 -->제품가격: <%= itemMap.get("price") %></div>
	<div id="itemDetail-discount" class="text-medium"><!-- 할인율 입력 -->할인율: <%= itemMap.get("discount") %> </div>
	<div id="itemDetail-discountPrice" class="text-large"><!-- 할인적용가격 입력.... -->할인적용가격: <%= itemMap.get("discounted") %></div>
	
	 <form action="buyPage.jsp" method="post">
		<div class="prod-quantity__form">
        <input type="text" value="1" name="quantity "class="quantity-count" readonly="true"  >
            <button class="quantity-minus" type="button" onclick="valueMinus(1)">수량 -  </button>
            <button class="quantity-plus" type="button" onclick="valuePlus(1)">수량  +  </button>
        </div>

<input type="button" value="장바구니 담기" onClick="<% addtoCart(); %>">
<!--  .quantity-count의 value를 select
버튼을 클릭하면 
1. cartDB에 데이터를 반영
2. fetch로 "장바구니에 담겼습니다" 출력
3. 구매페이지로 이동 버튼 생성
  -->

<input type="submit" value="바로구매">
<!--  .quantity-count의 value를 select
버튼을 클릭하면 
1. cartDB에 데이터를 반영
3. 구매페이지로 이동 
  -->
</form>

<!--  


2. ajax로 장바구니에 담겼습니다. 팝업과 구매페이지로 이동하기 버튼을 띄운다. 구매하기로 이동하기 버튼은 바로구매에 다시 사용한다. fetch를 써보고
 -->

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

//seq, buyer_id, quantity로 이뤄진 cartItemVO를 받고 cartItemDB에 인서트.

	
</script>

<%!  public void addtoCart(int num){

	
	SqlSessionFactory sqlSessionFactory = Mybatis.getSqlSessionFactory();
	SqlSession sqlSession;
	sqlSession = sqlSessionFactory.openSession(true);

	cartItemVO vo = new cartItemVO("10","ninja","3");

	int n =sqlSession.insert("cartItem", vo);
	if (n > 0) {
    sqlSession.commit();
    System.out.println("추가 성공");
    } else {
      sqlSession.rollback();
    System.out.println("추가 실패");
  
    }
}
%>

</body>
</html>