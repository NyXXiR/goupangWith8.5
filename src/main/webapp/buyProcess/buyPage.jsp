
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

%>

<%=cartList.get(0).getItem_seq() %>
<%= sqlSession.selectOne("getNameBySeq", cartList.get(0).getItem_seq()) %>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
제품 구매 페이지. itemDetail에서 넘어옴.
제품정보와 수량 전달받아 입력.
buyer가 장바구니에 담아둔 항목과 바로구매에서 가져온 항목을 더해서 보여줘야 함

<div id="cartItem-container">
<%for(int i=0;i<cartList.size();i++){
  int items=cartList.get(i).getItem_seq();
  String itemName= sqlSession.selectOne("getNameBySeq", items);
  
%>

<div id="cartItem">
<div class="img-box"><img src="../resources/item/<%=items %>.jpg" class="search-img-thumbnail" width="100%" height="225"></div> //이미지

<div><%=itemName %></div> //이름

<div><%=sqlSession.selectOne("getDiscountedBySeq",items) %></div> //가격x수량
</div>

<%
}
%>
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
ㄴif 제품id와 구매자 id가 동일한 행이 있을 경우 quantity 증가 처리


=======



</body>
</html>