<%@page import="model.historyVO"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@page import="mybatis.Mybatis"%>
<%@page import="org.apache.ibatis.session.SqlSessionFactory"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- hv객체의 해당 파라미터를 저장하여 해당 Vo를 update쿼리문으로 보내 상태 수정 후 주소값을 다시 이전 orderCarePage로 보냄 --> 

<%
SqlSessionFactory sqlSessionFactory=Mybatis.getSqlSessionFactory(); SqlSession sess;
sess=sqlSessionFactory.openSession(true); 

	String orderItemNumStr = request.getParameter("orderItemNum");
	String orderItemCountStr = request.getParameter("orderItemCount");
	
	String orderSeq = request.getParameter("orderSeq");
	int orderItemNum = Integer.valueOf(orderItemNumStr);
	int orderItemCount = Integer.valueOf(orderItemCountStr);
	String buyerAddress = request.getParameter("buyerAddress");
	String orderStatus = request.getParameter("orderStatus");
	
	historyVO hv = new historyVO(orderSeq,orderItemNum,orderItemCount,buyerAddress,orderStatus);
	sess.selectOne("updateOrderHistory",hv);
%>

<script>
alert("주문 정보가 수정되었습니다.");
location.href='mypage_master.jsp?right=orderCarePage.jsp';
</script>