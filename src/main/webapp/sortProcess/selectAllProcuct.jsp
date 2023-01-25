<%@page import="java.text.DecimalFormat"%>
<%@page import="model.itemVO"%>
<%@page import="java.util.List"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@page import="mybatis.Mybatis"%>
<%@page import="org.apache.ibatis.session.SqlSessionFactory"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>


<%

SqlSessionFactory sqlSessionFactory = Mybatis.getSqlSessionFactory();
SqlSession Session;
Session = sqlSessionFactory.openSession(true); 

DecimalFormat decFormat = new DecimalFormat("###,###");
List<itemVO> listByAll = Session.selectList("ItemAll");

	for(int i=0; i<listByAll.size(); i++) { 
		int discounted = listByAll.get(i).getPrice() / 100 * (100 - listByAll.get(i).getDiscount());
		int itemSeq = listByAll.get(i).getSeq();
			%>
			<!-- <img src="./resources/item/<%=listByAll.get(i).getImgsrc() %>" style="object-fit: cover; width: 100%; height: 100%;" class="card-img-top" alt="..."> -->
			
		<div class="card" style="width: 24%; height: 500px;">
			<div class="card-img-box">
				<img src="./resources/item/<%=listByAll.get(i).getImgsrc() %>" style="position: absolute; top: 0; left: 0; width: 100%; height: 100%;" class="card-img-top" alt="..."> 
			</div>
			<div class="card-body">
				<h5 class="card-title"><div id="itemName" class="text-large"><%=listByAll.get(i).getItemname()%></div></h5>
				<p class="card-text"></p>
				<%if(listByAll.get(i).getDiscount()==0) {
						%>
							<div id="itemPrice" class="text-small"><%= decFormat.format(listByAll.get(i).getPrice())%>원</div> 
						<% 
					} else {
						%>
							<div id="itemPrice" class="text-small" style="text-decoration:line-through; font-size: 13px;"><%=decFormat.format(listByAll.get(i).getPrice())%>원</div>
							<div id="itemDiscountPrice" class="text-large"><%= decFormat.format(discounted) %>원</div>
					    <% 
						}
						%>
				<div><a href="./itemDetail.jsp?a=<%=itemSeq %>" class="btn btn-primary" style="margin-bottom:0">구매하기</a></div>
			</div>
		</div>
<% 	}
%>
