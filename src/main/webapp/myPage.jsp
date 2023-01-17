<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<div class="myPage">
	<div class="graph1">
		<div class="itemSaleGraph">
			<canvas id="dougnutGraph">
			</canvas>			
		</div>
		<div class="itemMaxGraph">
			<canvas id="barGraph" style="height : 350px">
			</canvas>
		</div>
	</div>
	
	<div class="graph1">
		<table border="1" id="minSaleItem">
			<tr>
				<td style = "width : 100px">상품 번호</td>
				<td style = "width : 500px">상품 이름</td>
				<td style = "width : 100px">상품 가격</td>
				<td style = "width : 100px">상품 판매량</td>
				<td style = "width : 100px">상품 매출</td>
			</tr>
		</table>
	</div>
</div>