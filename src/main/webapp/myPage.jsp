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

<h1>�ֹ����� ��ȸ</h1>

	<table class="table" style="text-align: center; border: 1px solid #dddddd">
		<thead>
			<tr>
				<th colspan="2" style="background-color: #fafafa; text-align: center;"> ȸ�� ��� ��� </th>
			</tr>			
		</thead>
		<tbody>
			<tr>
				<td style="background-color: #fafafa; text-align:center;"><h5>�̸�</h5></td>
				<td><input class="form-control" type="text" id="registerName" size="20"></td>
			</tr>
			<tr>
				<td style="background-color: #fafafa; text-align:center;"><h5>����</h5></td>
				<td><input class="form-control" type="text" id="registerAge" size="20"></td>
			</tr>
			<tr>
				<td style="background-color: #fafafa; text-align:center;"><h5>����</h5></td>
				<td>
					<div class"form-group" style="text-align: center; margin: 0 aut0;">
						<div class="btn-group" data-toggle="buttons">
							<label class="btn btn-primary active">
								<input type="radio" name="registerGender" autocomplete="off" value="����" checked> ����
							</label>
							<label class="btn btn-primary">
								<input type="radio" name="registerGender" autocomplete="off" value="����"> ����
							</label>
						</div>
					</div>
				</td>
			</tr>
			<tr>
				<td style="background-color: #fafafa; text-align:center;"><h5>�̸���</h5></td>
				<td><input class="form-control" type="text" id="registerEmail" size="20"></td>
			</tr>
			<tr>
				<td colspan="2"><button class="btn btn-primary pull-right" onclick="registerFunction();" type="button">���</button></td>
			</tr>
			
		</tbody>
	</table>
</div>
</body>
</html>
