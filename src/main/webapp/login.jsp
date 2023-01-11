<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Document</title>
    <link rel="stylesheet" href="registerLoginCSS.css" />
</head>
<style>

    
</style>
<body>
 <div id="wrapper">
      <div class="logo-container">
        <div class="logo-box">
          <img src="./resources/goupang.jpg" class="logo" alt="" />
        </div>
        <div class="login-container">
            <h2>Login</h2>
    
            <form action="loginOK.jsp" method="POST">
              <div class="box">
                <h4 class="id">ID</h4>
                <input class="input1" name="userID" type="text" />
              </div>
              <div class="box">
                <h4 class="password">password</h4>
                <input class="input1" name="userPassword" type="password" />
              </div>
    
              <input id="input2" type="submit" value="Log in" />
            </form>
          </div>
      </div>
    </div>
    <!-- 로그인할 때 입력한 id/pw를 DB와 대조한 뒤 세션을 [로그인] 상태로 바꿔줘야 함-->
</body>
</html>