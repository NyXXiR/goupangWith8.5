<%@page import="DAO.historyDAO"%>
<%@page import="model.historyVO"%>
<%@page import="DAO.ItemDao2"%>
<%@page import="model.itemVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<% 
	historyDAO hd = historyDAO.getInstance();
	ItemDao2 id2 = ItemDao2.getInstance();

	String orderNumstr = null;
	if(request.getParameter("orderNum") == null){
		orderNumstr = "0";
	}else{
		orderNumstr = request.getParameter("orderNum");
	}
	int orderNum = Integer.valueOf(orderNumstr);
	
	historyVO order = hd.selectOne(orderNum);
	
	itemVO item = id2.reItemSearchOne(order.getItemNumber());
%>	
<form name="ReTouch1">
	<table class="OdTable">
		<tr>
			<td>
				<h3>주문 번호</h3>
			</td>
		</tr>
		<tr>
			<td class="pdInput"><input type="text" name="orderSeq" value="<%=order.getOrderSeq()%>" onlyread></td>
			<td class="pdInput"><input type="text" name="orderSeq" value="<%=order.getOrderDate()%>" onlyread></td>
		</tr>
	</table>
				
	<table class="OdTable">
		<tr>
			<td>
				<h3>상품 번호</h3>
			</td>
		</tr>
		<tr>
			<td class="pdInput"><input type="text" name="orderItemNum" value="<%=order.getItemNumber()%>" onlyread></td>
		</tr>
	</table>
	
	<table class="OdTable">
		<tr>
			<td>
				<h3>상품 이름</h3>
			</td>
		</tr>
		<tr>
			<td class="pdInput"><input type="text" name="orderItemName" value="<%=item.getItemname() %>" onlyread></td>
		</tr>
	</table>

	<table class="OdTable">
		<tr>
			<td>
				<h3>상품 수량</h3>
			</td>
		</tr>
		<tr>
			<td class="pdInput"><input type="text" name="orderItemCount" value="<%=order.getItemCount()%>"></td>
		</tr>
	</table>
	<table class="OdTable">
		<tr>
			<td>
				<h3>상품 사진</h3>
			</td>
		</tr>
		<tr>
			<td class="pdInputP">
					<img id="fakeInputP1" class="fakeInputP" src="./resources/item/<%=order.getItemNumber()%>(1).jpg"></img>
			</td>
		</tr>
	</table>

	<table class="OdTable">
		<tr>
			<td>	
				<h3>주문자</h3>
			</td>
		</tr>
		<tr>
			<td class="pdInput"><input type="text" name="pdDesc" id="pdInput2" value="<%=order.getBuyerid()%>" onlyread></td>
			<td class="pdInput"><input type="text" name="pdDesc" id="pdInput2" value="<%=order.getBuyerAddress()%>" ></td>
		</tr>
	</table>
	
	<table class="OdTable">
		<tr>
			<td>	
				<h3>주문 상태</h3>
			</td>
		</tr>
		<tr>
			<td class="pdInput"><input type="text" name="pdDesc" id="pdInput2" value="<%=order.getStatus()%>"></td>
		</tr>
	</table>
	<button id="button" type="submit">상  품  저  장</button>
</form>
