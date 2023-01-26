<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%
		String sellerID = (String) session.getAttribute("sellerId");
	%>
<form action="Upload" name="upload1" method="post" enctype="multipart/form-data">
	<table class="pdTable">
		<tr>
			<td>
				<h3>상품명</h3>
			</td>
		</tr>
		<tr>
			<td class="pdInput"><input type="text" name="pdName"></td>
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
				<option value="0">카테고리 선택</option>
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
			<td class="pdInput"><input type="text" name="pdPrice"></td>
		</tr>
	</table>
	
	<table class="pdTable">
		<tr>
			<td>
				<h3>재고수량</h3>
			</td>
		</tr>
		<tr>
			<td class="pdInput"><input type="text" name="pdQTY"></td>
		</tr>
	</table>

	<table class="pdTable">
		<tr>
			<td>
				<h3>할인율</h3>
			</td>
		</tr>
		<tr>
			<td class="pdInput"><input type="text" name="pdDiscount"></td>
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
					<img id="fakeInputP1" class="fakeInputP" ></img>
					<input type="file" name="pdPhoto" accept="image/*" onchange="readURL1(this)" required
						id="realInputP1" class="realInput">
					<img id="fakeInputP2" class="fakeInputP" ></img>
					<input type="file" name="pdPhoto" accept="image/*" onchange="readURL2(this)" required
						id="realInputP2" class="realInput">
					<img id="fakeInputP3" class="fakeInputP" ></img>
					<input type="file" name="pdPhoto" accept="image/*" onchange="readURL3(this)" required
						id="realInputP3" class="realInput">
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
			<td class="pdInput"><input type="text" name="pdDesc" id="pdInput2"></td>
		</tr>
	</table>
	<input type="hidden" name="sellerid" value="<%=sellerID %>"/>
	<button id="button" type="submit">상  품  저  장</button>
</form>
