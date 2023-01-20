
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@ page import="org.apache.ibatis.session.SqlSessionFactory"%>
<%@ page import="org.apache.ibatis.session.SqlSession"%>
<%@ page import="model.itemVO"%>
<%@ page import="model.cartItemVO"%>
<%@ page import="mybatis.Mybatis"%>
<%@ page import="java.util.List" %>
<%@ page import="model.soldItemVO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <%
    //필요한 변수 입력받음
    String seq = request.getParameter("item_seq");

    //parameter에 입력할 map을 생성
     Map<String, Object> map = new HashMap<>();
    
    map.put("item_seq",seq);
    map.put("buyer_id", session.getAttribute("buyer_id"));
    
    
    //넘겨받은 item_seq의 row를 삭제
    SqlSessionFactory sqlSessionFactory = Mybatis.getSqlSessionFactory();
SqlSession sqlSession;
sqlSession = sqlSessionFactory.openSession(true);

   
   int n= sqlSession.insert("deleteFromCart", map);
    if (n > 0) {
      sqlSession.commit();
      } else {
      sqlSession.rollback();
      }
    
    response.sendRedirect("buyPage.jsp");
    %>
    
    