<%@page import="java.util.HashMap"%>
<%@page import="model.historyVO"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@page import="mybatis.Mybatis"%>
<%@page import="org.apache.ibatis.session.SqlSessionFactory"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
    SqlSessionFactory sqlSessionFactory = Mybatis.getSqlSessionFactory();
    SqlSession Session;
    Session = sqlSessionFactory.openSession(true); 
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
String buyer_id = (String) session.getAttribute("buyerId");
String orderSeq = request.getParameter("orderSeq");
String status = request.getParameter("status");

HashMap<String, String> map = new HashMap<>();
map.put("buyer_id", buyer_id);
map.put("orderSeq", orderSeq);

if(status.equals("배송 준비중")) {
	Session.delete("deleteOrderedItems", map);
		%>
		<script>
			alert("주문 취소 처리 되었습니다.");
			window.location.href = 'mypage_consumer.jsp?right=pdPage.jsp';
		</script>
		<%
	// 주문 취소완료.
} else if(status.equals("배송중") || status.equals("배송 완료")){
		%>
		<script>
			alert("취소가 불가능한 상품입니다.");
			window.location.href = 'mypage_consumer.jsp?right=pdPage.jsp';
		</script>
		<%
	// 발송 처리 된 상품은 취소불가능.
} %>
</body>
</html>