<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action ="guestBookProc.jsp">
id <input type ="text" name="guestId"><br>
아이디 <input type ="text" name ="guestName"><br>
비밀번호 <input type ="password" name ="guestPassword"><br>
남길 메시지 <br>
<textarea name ="guestMessage" cols="30" rows="3"></textarea>
<input type ="submit">
</form>


</body>
</html>