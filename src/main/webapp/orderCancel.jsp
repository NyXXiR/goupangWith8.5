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
			alert("�ֹ� ��� ó�� �Ǿ����ϴ�.");
			window.location.href = 'mypage_comsumer.jsp';
		</script>
		<%
	// �ֹ� ��ҿϷ�.
} else {
		%>
		<script>
			alert(status + orderNum + "�߼� �Ϸ�� ��ǰ�� ��Ұ� �Ұ��� �մϴ�.");
			window.location.href = 'mypage_comsumer.jsp';
		</script>
		<%
	// �߼� ó�� �� ��ǰ���� �ֹ� ��Ұ� �Ұ��� �մϴ�.
}
%>
</body>
</html>