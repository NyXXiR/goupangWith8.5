<%@page import="model.itemVO"%>
<%@page import="java.util.List"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@page import="mybatis.Mybatis"%>
<%@page import="org.apache.ibatis.session.SqlSessionFactory"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>


<%

SqlSessionFactory sqlSessionFactory = Mybatis.getSqlSessionFactory();
SqlSession Session;
Session = sqlSessionFactory.openSession(true); 

List<itemVO> sortItems = Session.selectList("sortBySalesRecord");

//request.setAttribute("sortedList", sortItems);

		for(int i=0; i<sortItems.size(); i++) { 
			request.setAttribute("vo", sortItems.get(i));
			int discounted = sortItems.get(i).getPrice() / 100 * (100 - sortItems.get(i).getDiscount());%>
			<div class="card" style="width: 24%">
				<img src="./resources/item/<%=i %>.jpg" class="card-img-top" alt="...">
				<div class="card-body">
					<h5 class="card-title"><div id="itemName" class="text-large"><%=sortItems.get(i).getItemname()%></div></h5>
					<p class="card-text"></p>
					<div id="itemPrice" class="text-small" style="text-decoration:line-through"><%=sortItems.get(i).getPrice()%>원</div>
					<div id="itemDiscountPrice" class="text-large"><%= discounted %>원</div>
					<div><a href="itemDetail.jsp?<%=sortItems.get(i) %>" class="btn btn-primary" style="margin-bottom:0">구매하기</a></div>
				</div>
			</div>
		<% 	}
		%>
