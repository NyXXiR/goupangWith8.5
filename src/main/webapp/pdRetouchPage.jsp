<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div id="itemList">
	<form action="mypage_master.jsp" onsubmit=""searchItem id="itemSearchInput">
		<input type="hidden" name="right" value="pdRetouchPage.jsp">
		<select name="searchItemkey">
			<option selected value="itemname">상품명</option>
			<option value="seq">상품번호</option>
			<option value="price">상품가격</option>
			<option value="category">카테고리</option>
		</select>
		<input name="searchItemValue" type="text"/>
		<button type="submit" form="itemSearchInput">검  색</button>
	</form>
    <table id="itemListTable">
        <thead>
            <tr>
                <th>상품 번호</th>
                <th>상품 이름</th>
                <th>상품 가격</th>
                <th>할 인 율</th>
                <th>카테 고리</th>
            </tr>
        </thead>
        <tbody id="itemListadd">
            
        </tbody>
    </table>
   	<label id="itemAllCount">전체 상품 수</label><br>
   	<label id="itemCount"></label>
</div>