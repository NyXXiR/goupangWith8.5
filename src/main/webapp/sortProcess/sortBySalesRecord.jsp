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
List<itemVO> sortItems = Session.selectList("sortBySalesRecord");


						for(int i=0; i<sortItems.size(); i++) { 
						int discounted = sortItems.get(i).getPrice() / 100 * (100 - sortItems.get(i).getDiscount());
						int itemSeq = sortItems.get(i).getSeq();
							%>
							
						<div class="card" style="width: 24%; height: 500px;">
							<div class="card-img-box">
								<img src="./resources/item/<%=sortItems.get(i).getImgsrc() %>" style="position: absolute; top: 0; left: 0; width: 100%; height: 100%;" class="card-img-top" alt="..."> 
							</div>
							<div class="card-body">
								<h5 class="card-title"><div id="itemName" class="text-large"><%=sortItems.get(i).getItemname()%></div></h5>
								<p class="card-text"></p>
								<%if(sortItems.get(i).getDiscount()==0) {
									%>
										<div id="itemPrice" class="text-small"><%= decFormat.format(sortItems.get(i).getPrice())%>원</div> 
									<% 
								} else {
									%>
										<div id="itemPrice" class="text-small" style="text-decoration:line-through; font-size: 13px;"><%=decFormat.format(sortItems.get(i).getPrice())%>원</div>
										<div id="itemDiscountPrice" class="text-large"><%= decFormat.format(discounted) %>원</div>
								    <% 
									}
									%>
								<div><a href="./itemDetail.jsp?a=<%=itemSeq %>" class="btn btn-primary" style="margin-bottom:0">구매하기</a></div>
							</div>
						</div>
				<% 	}
				%>
