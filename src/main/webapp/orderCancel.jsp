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

String status =  request.getParameter("status");
String buyer_id = (String) request.getAttribute("buyerId");
String orderNum = request.getParameter("orderNum");

HashMap<String, String> map = new HashMap<>();
map.put("buyer_id", buyer_id);
map.put("orderSeq", orderNum);


if(status.equals("stand-by")) {
	Session.selectOne("deleteOrderedItems", map);
		%>
		<script>
			alert("�ֹ� ��� ó�� �Ǿ����ϴ�.");
			location.href = 'javascript:history.back();';
		</script>
		<%
	// �ֹ� ��ҿϷ�.
} else {
		%>
		<script>
			alert(status + orderNum + "�߼� �Ϸ�� ��ǰ�� ��Ұ� �Ұ��� �մϴ�.");
			location.href = 'javascript:history.back();';
		</script>
		<%
	// �߼� ó�� �� ��ǰ���� �ֹ� ��Ұ� �Ұ��� �մϴ�.
}
%>
</body>
</html>