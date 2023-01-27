<%@ page import="org.apache.ibatis.session.SqlSessionFactory"%>
<%@ page import="org.apache.ibatis.session.SqlSession"%>
<%@ page import="model.itemVO"%>
<%@ page import="model.cartItemVO"%>
<%@ page import="mybatis.Mybatis"%>
<%@ page import="java.util.List" %>
<%@ page import="model.soldItemVO" %>
<%@ page import= "java.util.HashMap" %>
<%@ page import="model.historyVO" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<% SqlSessionFactory sqlSessionFactory = Mybatis.getSqlSessionFactory();
SqlSession sqlSession;
sqlSession = sqlSessionFactory.openSession(true);


String[] seqs= request.getParameterValues("item_seq");
String[] qtys= request.getParameterValues("qty");
String buyerAddress= request.getParameter("addressInput");
String buyerId= (String)session.getAttribute("buyerId");
HashMap<String, String> map= new HashMap<>();
historyVO vo;
int n=0;
for(int i=0; i<seqs.length;i++){
  map.put("seq", seqs[i]);
  map.put("qty", qtys[i]);
  int itemNumber= Integer.parseInt(seqs[i]);
  int itemCount= Integer.parseInt(qtys[i]);
  
vo= new historyVO(itemNumber,itemCount,buyerId,buyerAddress);
 
//구매 완료시 DB 3개 동시 수정
n=sqlSession.insert("itemquantityMinus", map);
if (n > 0) {
  sqlSession.commit();
  } else {
  sqlSession.rollback();
  	}
int m=  sqlSession.insert("insertOrderHistory", vo);
if (m > 0) {
  sqlSession.commit();
  } else {
  sqlSession.rollback();
  	}
int o= sqlSession.insert("deleteFromCartById", buyerId);
if (o > 0) {
  sqlSession.commit();
  } else {
  sqlSession.rollback();
  	}


}
%>

<h1>구매 완료</h1>
<button type="button" onclick="location.href='../view.jsp';"> 메인페이지로 돌아가기</button></div>

