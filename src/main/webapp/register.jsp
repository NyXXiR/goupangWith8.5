<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" href="registerLoginCSS.css" />
</head>
<body>
 <div id="wrapper">
      <div class="signup-container">
        <h2>Sign Up</h2>

        <form action="registerOK.jsp" method="post">
          <div class="box">
            <h4 class="id">ID</h4>
            <input class="input1" name="userID" type="text" />
          </div>
          <div class="box">
            <h4 class="name">Name</h4>
            <input class="input1" name="userName" type="text" />
          </div>
          <div class="box">
            <h4 class="password">password</h4>

            <input class="input1" name="userPassword" type="password" />
          </div>

          <input id="input2" type="submit" value="Sign Up" />
        </form>
      </div>
      <div class="logo-container">
        <div class="logo-box">
          <img src="./resources/goupang.jpg" class="logo" alt="" />
        </div>
      </div>
    </div>
    
    <%
    
    %>
</body>
</html>