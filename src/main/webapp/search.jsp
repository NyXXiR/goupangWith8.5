<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.itemVO"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@page import="mybatis.Mybatis"%>
<%@page import="org.apache.ibatis.session.SqlSessionFactory"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>검색 버튼 누르면 출력되는 화면</title>
<style>
.wrapper {
	width:1280px;
	margin: 0 auto;
}
</style>
</head>
<body>
	  
<div class="wrapper">
<jsp:include page="header.jsp" flush="false"/>
<h1>검색결과 출력</h1>

<%

SqlSessionFactory sqlSessionFactory = Mybatis.getSqlSessionFactory();
SqlSession Session;
Session = sqlSessionFactory.openSession(true); 

String comboValue = request.getParameter("comboValue");
String enteredText = request.getParameter("searchbar");

List<itemVO> listBySellerId = Session.selectList("searchItemsBySellerId", enteredText);
List<itemVO> listByAll = Session.selectList("searchItemsByNameOrSellerId", enteredText);
List<itemVO> listByItemName = Session.selectList("searchItemByItemName", enteredText);




if(enteredText == null || enteredText == "") {
	out.println("공백");
	return;
} 
if(comboValue == null) {
	out.println("comboValue null");
	return;
}
if(comboValue.equals("all")) {
	out.println(listByAll);
	return;
}
if(comboValue.equals("sellerId")) {
	out.println(listBySellerId);
	return;
}
if(comboValue.equals("itemName")) {
	out.println(listByItemName);
	return;
}

	
/* if(comboValue.equals("all")) */
/* if(comboValue.equals(""))
out.println(list); */
%> <br/><br/><br/><% 
out.println("comboValue = " + comboValue);
%> <br/><br/><br/><% 




%>

<jsp:include page="footer.jsp" flush="false"/>
</div>
</body>
</html>