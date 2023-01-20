<%@page import="java.util.List"%>
<%@ page import="model.cartItemVO"%>
<%@ page import="org.apache.ibatis.session.SqlSessionFactory"%>
<%@ page import="org.apache.ibatis.session.SqlSession"%>
<%@ page import="mybatis.Mybatis"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
// 필요한 변수 입력받음
int item_seq = Integer.parseInt(request.getParameter("item_seq"));
String buyer_id =String.valueOf(request.getParameter("buyer_id"));
int qty = Integer.parseInt(request.getParameter("quantity"));
int cnt = 0;

//조건 체크 위해 cartList 불러옴
SqlSessionFactory sqlSessionFactory = Mybatis.getSqlSessionFactory();
SqlSession sqlSession;
sqlSession = sqlSessionFactory.openSession(true);

List<cartItemVO> cartList = sqlSession.selectList("cartList");

for (int i = 0; i < cartList.size(); i++) {

  int seqList = cartList.get(i).getItem_seq();
  String buyerList = cartList.get(i).getBuyer_id();

  //겹칠 경우 qty만 추가 처리
  if (item_seq == seqList && buyer_id.equals(buyerList)) {

    Map<String, Object> map = new HashMap<>();

    map.put("item_seq", seqList);
    map.put("buyer_id", buyerList);
    map.put("qty", qty);


    int n = sqlSession.insert("cartQtyPlus", map);
    if (n > 0) {
  sqlSession.commit();
    } else {
  sqlSession.rollback();
    }
    cnt++;
  }
}

//겹치는 게 없을 경우 새로운 행 삽입

if (cnt == 0) {
  cartItemVO vo = new cartItemVO(item_seq, buyer_id, qty);

  int n = sqlSession.insert("cartItem", vo);

  if (n > 0) {
    sqlSession.commit();
  } else {
    sqlSession.rollback();
  }

}

response.sendRedirect("buyPage.jsp");
%>

