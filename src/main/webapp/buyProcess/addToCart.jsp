<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int item_seq = Integer.parseInt(request.getParameter("item_seq"));
String buyer_id= request.getParameter("buyer_id");
int qty = Integer.parseInt(request.getParameter("qty"));

이제 이 3개로 db에 입력하고 박스 띄우기까지 하면 됨




	Dao dao = Dao.getInstance();
	String str = dao.selectEmpTempJsonOne(empno);
	out.print(str);
	
	
	
	
%>