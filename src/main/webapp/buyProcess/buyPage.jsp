
<%@ page import="org.apache.ibatis.session.SqlSessionFactory"%>
<%@ page import="org.apache.ibatis.session.SqlSession"%>
<%@ page import="model.itemVO"%>
<%@ page import="model.cartItemVO"%>
<%@ page import="mybatis.Mybatis"%>
<%@ page import="java.util.List" %>
<%@ page import="model.soldItemVO" %>
<%@ page import= "java.util.HashMap" %>


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

.addressInput{
width:300px;
height:300px;

}
.addressContainer{
    display: flex;
    align-items: center;
    justify-content: center;
}

.hidingData{
display:none;
}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>

</head>
<body>


<div class="addressContainer">
주소입력 <input type="text" class="addressInput" placeholder="주소입력"/>
</div>
<div id="cartItem-container">
<%for(int i=0;i<cartList.size();i++){
  int items=cartList.get(i).getItem_seq();
  String itemName= sqlSession.selectOne("getNameBySeq", items);
  int qty= cartList.get(i).getQty();
  itemVO vo;
  HashMap<String, Integer> buyMap = new HashMap<>();
  
%>

<div id="cartItem">
<p class="img-box"><img src="../resources/item/<%=items %>(1).jpg" class="search-img-thumbnail"></p>

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
	
	<div class="hidingData">
						<input type="text" value=<%=items %> name="item-seq" class="item-seq"/>
						</div>
								</div>
						</div>
						




<%
}
%>
</div>

<div>
<span>최종가격: </span>
<input id="final-price" name="final-price" value="">
<button type="button" value="구매하기" onclick="buyAction()">구매하기</button>
</div>



===

 제품 구매시 DB 처리하는 메소드

제품 구매했을 때
수량+ 제품정보를 forward 해서
구매하시겠습니까? 
예- > 해당 제품의 수량만큼의 quantity를 db에서 감소 처리함

ㄴif 수량>잔여수량일 경우 품절 메시지 띄우고 rollback()처리
rollback();
soldItemDB에 수량만큼의 quantity를 추가



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



	sum=0;
	document.querySelectorAll(".calculated-price").forEach(function(item){

		sum+= parseInt(item.getAttribute("value"));
	});

	$('input[name=final-price]').attr('value',sum);
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
	
	sum=0;
	document.querySelectorAll(".calculated-price").forEach(function(item){

		sum+= parseInt(item.getAttribute("value"));
	});

	$('input[name=final-price]').attr('value',sum);
			}

</script>

<script>
function buyAction(){

var itemInfo= [];
	
var arr = document.querySelectorAll(".item-seq");
for(var i=0; i<arr.length;i++){

var item_seq=document.querySelectorAll(".item-seq")[i].value;
var qty = document.querySelectorAll(".quantity-count")[2*i].value;

itemInfo[i]=[item_seq, qty];

}

sessionStorage.setItem("itemInfo",itemInfo);
location.href("buyAction.jsp");	>>여기 오류남 여기부터 ㄱㄱ
	
}

</script>
</body>
</html>