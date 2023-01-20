<%@page import="DAO.ItemDao2"%>
<%@page import="model.itemVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<% 
	ItemDao2 id2 = ItemDao2.getInstance();

	String reItemNumstr = request.getParameter("reItemNum");
	if(request.getParameter("reItemNum") == null){
		reItemNumstr = "0";
	}else{
		reItemNumstr = request.getParameter("reItemNum");
	}
	int reItemNum = Integer.valueOf(reItemNumstr);
	
	itemVO reItem = id2.reItemSearchOne(reItemNum);
	System.out.println(reItem);
	String cateNameSea = id2.cateNameSearch(reItem.getCategorynum());		
%>	
<form action="ReTouch" name="ReTouch1" method="post" enctype="multipart/form-data">
	<input type="hidden" name="pdSeq" value="<%=reItem.getSeq() %>"/>
	<table class="pdTable">
		<tr>
			<td>
				<h3>상품명</h3>
			</td>
		</tr>
		<tr>
			<td class="pdInput"><input type="text" name="pdName" value="<%=reItem.getItemname()%>"></td>
		</tr>
	</table>
	
	<table class="pdTable">
		<tr>
			<td>
				<h3>상품 카테고리</h3>
			</td>
		</tr>
		<tr>
			<td><select name="pdCategory"  id = "pdSelect">
				<option selected value="<%=reItem.getCategorynum()%>"><%=cateNameSea %></option>
				<option value="10">Fashion</option>
				<option value="20">Beauty</option>
				<option value="30">Eletronic</option>
				<option value="40">Pantry</option>
				<option value="50">Car</option>
				<option value="60">Toy</option>
				<option value="70">ETC</option>
			</select>
		</tr>
	</table>

	<table class="pdTable">
		<tr>
			<td>
				<h3>가격</h3>
			</td>
		</tr>
		<tr>
			<td class="pdInput"><input type="text" name="pdPrice" value="<%=reItem.getPrice()%>"></td>
		</tr>
	</table>
	
	<table class="pdTable">
		<tr>
			<td>
				<h3>재고수량</h3>
			</td>
		</tr>
		<tr>
			<td class="pdInput"><input type="text" name="pdQTY" value="<%=reItem.getQty()%>"></td>
		</tr>
	</table>

	<table class="pdTable">
		<tr>
			<td>
				<h3>할인율</h3>
			</td>
		</tr>
		<tr>
			<td class="pdInput"><input type="text" name="pdDiscount" value="<%=reItem.getDiscount()%>"></td>
		</tr>
	</table>
	<table class="pdTable">
		<tr>
			<td>
				<h3>제품사진</h3>
			</td>
		</tr>
		<tr>
			<td class="pdInputP">
					<img id="fakeInputP1" class="fakeInputP" src="./resources/item/<%=reItem.getSeq()%>(1).jpg"></img>
					<input type="file" name="pdPhoto" accept="image/*" onchange="readURL1(this)" 
						id="realInputP1" class="realInput" value="./resources/item/<%=reItem.getSeq()%>(1).jpg">
					<img id="fakeInputP2" class="fakeInputP" src="./resources/item/<%=reItem.getSeq()%>(2).jpg"></img>
					<input type="file" name="pdPhoto" accept="image/*" onchange="readURL2(this)" 
						id="realInputP2" class="realInput" value="./resources/item/<%=reItem.getSeq()%>(2).jpg">
					<img id="fakeInputP3" class="fakeInputP" src="./resources/item/<%=reItem.getSeq()%>(3).jpg"></img>
					<input type="file" name="pdPhoto" accept="image/*" onchange="readURL3(this)" 
						id="realInputP3" class="realInput" value="./resources/item/<%=reItem.getSeq()%>(3).jpg">
			</td>
		</tr>
	</table>

	<table class="pdTable">
		<tr>
			<td>	
				<h3>상세설명</h3>
			</td>
		</tr>
		<tr>
			<td class="pdInput"><input type="text" name="pdDesc" id="pdInput2" value="<%=reItem.getDescription()%>"></td>
		</tr>
	</table>
	<button id="button" type="submit">상  품  저  장</button>
</form>
