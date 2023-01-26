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

<!-- 변경 가능한 목록은 상품수량, 주소지, 주문상태만 변경 가능하여, itemCount, address, status를 제외한 모든 input에 readonly를 부여 -->
<!-- 저장을 누르면 form 전체를 orderStChange로 보내고 혹시 모를 다른 input들의 값을 사용할 수도 있다고 판단하여 disabled 대신 readonly사용 -->
<form action="mypage_master.jsp" method="post" name="orderUpdate">
	<input type="hidden" name="right" value="orderStChange.jsp" readonly>
	<table class="OdTable">
		<tr>
			<td>
				<h3>주문 번호</h3>
			</td>
		</tr>
		<tr>
			<td class="pdInput"><input type="text" name="orderSeq" value="<%=order.getOrderSeq()%>" readonly></td>
			<td class="pdInput"><input type="text" name="orderdate" value="<%=order.getOrderDate()%>" readonly></td>
		</tr>
	</table>
				
	<table class="OdTable">
		<tr>
			<td>
				<h3>상품 번호</h3>
			</td>
		</tr>
		<tr>
			<td class="pdInput"><input type="text" name="orderItemNum" value="<%=order.getItemNumber()%>" readonly></td>
		</tr>
	</table>
	
	<table class="OdTable">
		<tr>
			<td>
				<h3>상품 이름</h3>
			</td>
		</tr>
		<tr>
			<td class="pdInput"><input type="text" value="<%=item.getItemname() %>" readonly></td>
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
					<img name="orderImg" src="./resources/item/<%=order.getItemNumber()%>(1).jpg"></img>
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
			<td class="pdInput"><input type="text" name="buyerId" id="pdInput2" value="<%=order.getBuyerid()%>" readonly></td>
			<td class="pdInput"><input type="text" name="buyerAddress" id="pdInput2" value="<%=order.getBuyerAddress()%>" ></td>
		</tr>
	</table>
	
	<table class="OdTable">
		<tr>
			<td>	
				<h3>주문 상태</h3>
			</td>
		</tr>
		<tr>
			<td class="pdInput">
			<select name="orderStatus">
				<option selected value="<%=order.getStatus()%>"><%=order.getStatus()%></option>
				<option value="배송 준비중">배송 준비중</option>
				<option value="배송중">배송중</option>
				<option value="배송완료">배송완료</option>
			</select>
		</tr>
	</table>
	<button id="button" type="submit">주  문  저  장</button>
</form>
