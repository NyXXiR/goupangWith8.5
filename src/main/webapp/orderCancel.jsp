<%@page import="java.util.HashMap"%>
<%@page import="model.historyVO"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@page import="mybatis.Mybatis"%>
<%@page import="org.apache.ibatis.session.SqlSessionFactory"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
    <%
    SqlSessionFactory sqlSessionFactory = Mybatis.getSqlSessionFactory();
    SqlSession Session;
    Session = sqlSessionFactory.openSession(true); 
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
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


if(status.equals("stand-by")) {
	Session.delete("deleteOrderedItems", map);
		%>
		<script>
			alert("주문 취소 처리 되었습니다.");
			window.location.href = 'mypage_comsumer.jsp';
		</script>
		<%
	// 주문 취소완료.
} else {
		%>
		<script>
			alert(status + orderNum + "발송 완료된 상품은 취소가 불가능 합니다.");
			window.location.href = 'mypage_comsumer.jsp';
		</script>
		<%
	// 발송 처리 된 상품으로 주문 취소가 불가능 합니다.
}
%>
</body>
</html>