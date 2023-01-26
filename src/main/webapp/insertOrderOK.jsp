<%@page import="model.historyVO"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@page import="mybatis.Mybatis"%>
<%@page import="org.apache.ibatis.session.SqlSessionFactory"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>

<%
SqlSessionFactory sqlSessionFactory = Mybatis.getSqlSessionFactory();
SqlSession Session;
Session = sqlSessionFactory.openSession(true); 

session.setAttribute("prdSeq", 69);
session.setAttribute("prdCount", 5);

int prdNum = (int) session.getAttribute("prdSeq");
int prdCount =  (int) session.getAttribute("prdCount");
String buyerid = (String) session.getAttribute("buyerId");

//String address = Session.selectOne("getBuyerAddress", buyerid);
historyVO vo = new historyVO(prdNum, prdCount, "test", "서울시 대흥동");


try {
	out.print("성공");
	Session.selectList("insertOrderHistory", vo);
	
} catch(Exception e) {
	e.printStackTrace();
}

%>
</body>
</html>