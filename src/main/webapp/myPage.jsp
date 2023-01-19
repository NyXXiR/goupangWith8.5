<h1>hello!</h1>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>

  <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
    <script src="js/bootstrap.js"></script>
</head>
<body>

<div class="container">

<h1>주문내역 조회</h1>

	<table class="table" style="text-align: center; border: 1px solid #dddddd">
		<thead>
			<tr>
				<th colspan="2" style="background-color: #fafafa; text-align: center;"> 회원 등록 양식 </th>
			</tr>			
		</thead>
		<tbody>
			<tr>
				<td style="background-color: #fafafa; text-align:center;"><h5>이름</h5></td>
				<td><input class="form-control" type="text" id="registerName" size="20"></td>
			</tr>
			<tr>
				<td style="background-color: #fafafa; text-align:center;"><h5>나이</h5></td>
				<td><input class="form-control" type="text" id="registerAge" size="20"></td>
			</tr>
			<tr>
				<td style="background-color: #fafafa; text-align:center;"><h5>성별</h5></td>
				<td>
					<div class"form-group" style="text-align: center; margin: 0 aut0;">
						<div class="btn-group" data-toggle="buttons">
							<label class="btn btn-primary active">
								<input type="radio" name="registerGender" autocomplete="off" value="남자" checked> 남자
							</label>
							<label class="btn btn-primary">
								<input type="radio" name="registerGender" autocomplete="off" value="여자"> 여자
							</label>
						</div>
					</div>
				</td>
			</tr>
			<tr>
				<td style="background-color: #fafafa; text-align:center;"><h5>이메일</h5></td>
				<td><input class="form-control" type="text" id="registerEmail" size="20"></td>
			</tr>
			<tr>
				<td colspan="2"><button class="btn btn-primary pull-right" onclick="registerFunction();" type="button">등록</button></td>
			</tr>
			
		</tbody>
	</table>
</div>
</body>
</html>
