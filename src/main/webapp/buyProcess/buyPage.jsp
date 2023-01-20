
<%@ page import="org.apache.ibatis.session.SqlSessionFactory"%>
<%@ page import="org.apache.ibatis.session.SqlSession"%>
<%@ page import="model.itemVO"%>
<%@ page import="model.cartItemVO"%>
<%@ page import="mybatis.Mybatis"%>
<%@ page import="java.util.List" %>
<%@ page import="model.soldItemVO" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%
SqlSessionFactory sqlSessionFactory = Mybatis.getSqlSessionFactory();
SqlSession sqlSession;
sqlSession = sqlSessionFactory.openSession(true);

//로그인한 id가 등록한 장바구니 목록을 가져옴
List<cartItemVO> cartList = sqlSession.selectList("cartListById", session.getAttribute("buyer_id"));

int itemSeq=cartList.get(0).getItem_seq();
int finalPrice=0;
%>

<%=cartList.get(0).getItem_seq() %>
<%= sqlSession.selectOne("getNameBySeq", cartList.get(0).getItem_seq()) %>

<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

*{
border:1px solid black;
}
.img-box{
width:200px;
height:200px;
object-fit: cover;

display: inline-block;
}

.search-img-thumbnail{
width:100%;

object-fit: cover;
}
#cartItem-detail{
display:inline-block;

}
#cartItem{
display:flex;
align-items: center;
justify-content: center;
}

</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>

</head>
<body>
제품 구매 페이지. itemDetail에서 넘어옴.
제품정보와 수량 전달받아 입력.
buyer가 장바구니에 담아둔 항목과 바로구매에서 가져온 항목을 더해서 보여줘야 함

<div id="cartItem-container">
<%for(int i=0;i<cartList.size();i++){
  int items=cartList.get(i).getItem_seq();
  String itemName= sqlSession.selectOne("getNameBySeq", items);
  int qty= cartList.get(i).getQty();
%>

<div id="cartItem">
<p class="img-box"><img src="../resources/item/<%=items %>.jpg" class="search-img-thumbnail"></p>

<div id="cartItem-detail">
<p><%=itemName %></p>
						<div class="prod-quantity__form">
							<input type="text" value=<%=qty %> name="quantity"
								class="quantity-count" readonly="true" />
							<button class="quantity-minus" type="button"
								onclick="valueMinus(this)">수량 -</button>
							<button class="quantity-plus" type="button"
								onclick="valuePlus(this)">수량 +</button>
								<button class="delete-from-cart" type="button" onclick="location.href='deleteFromCart.jsp?item_seq=<%=items%>'"> X </button>
								<br>
								
								
								<input type= "text" class="item-price" readonly="true" value=<%=sqlSession.selectOne("getDiscountedBySeq",items)%>>
								<span> x</span>
<input type="text" class="quantity-count" readonly="true" value=<%=qty %>>
<% int calculatedPrice= (int)sqlSession.selectOne("getDiscountedBySeq",items)*qty; %> 
<span>=</span>
<input type="text" class="calculated-price" value=<%=calculatedPrice %>>
	</div>
								
						</div>
						

</div>
</div>


<%
}
%>
</div>
최종가격: <input id="final-price" name="final-price" value="">
<input type="button" value="구매하기"/>


===

 제품 구매시 DB 처리하는 메소드

제품 구매했을 때
수량+ 제품정보를 forward 해서
구매하시겠습니까? 
예- > 해당 제품의 수량만큼의 quantity를 db에서 감소 처리함

ㄴif 수량>잔여수량일 경우 품절 메시지 띄우고 rollback()처리
rollback();
soldItemDB에 수량만큼의 quantity를 추가
ㄴif 제품id와 구매자 id가 동일한 행이 있을 경우 quantity 증가 처리


=======


<script>

var sum=0;
document.querySelectorAll(".calculated-price").forEach(function(item){

	sum+= parseInt(item.getAttribute("value"));
});

$('input[name=final-price]').attr('value',sum);

function thisValue(vm){
	var count= parseInt($(vm).parent().children(".quantity-count").attr("value"));
	return count;
}

function valuePlus(vm){

	var count= parseInt($(vm).parent().children(".quantity-count").attr("value"));
	var temp= count+1;
	count=parseInt($(vm).parent().children(".quantity-count").attr("value", temp));


	
	var calCount= parseInt($(vm).parent().children(".calculated-price").attr("value"));
	var temp2 = parseInt($(vm).parent().children(".item-price").attr("value"))*temp;

	calCount=parseInt($(vm).parent().children(".calculated-price").attr("value",temp2));

	}
	
	
function valueMinus(vm){
	var count= parseInt($(vm).parent().children(".quantity-count").attr("value"));
	var temp= count-1;
	if(temp>0){
		
		count=parseInt($(vm).parent().children(".quantity-count").attr("value", temp));

		}else if(temp==0){
			alert("선택된 제품을 장바구니에서 삭제하시겠습니까?");
		
		}
	var calCount= parseInt($(vm).parent().children(".calculated-price").attr("value"));
	var temp2 = parseInt($(vm).parent().children(".item-price").attr("value"))*temp;

	calCount=parseInt($(vm).parent().children(".calculated-price").attr("value",temp2));

			}
</script>
</body>
</html>