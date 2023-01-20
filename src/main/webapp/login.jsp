<%@page import="java.util.HashMap"%>
<%@page import="mybatis.Mybatis"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@page import="org.apache.ibatis.session.SqlSessionFactory"%>
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
          <img src="./resources/header/goupang.jpg" class="logo" alt="" />
        </div>
        <div class="login-container">
            <h2>Login</h2>
    
            <form action="loginOK.jsp" method="POST">
              <div class="box">
                <h4 class="id">ID</h4>
                <input class="input1" name="userID" type="text" placeholder="ID" />
              </div>
              <div class="box">
                <h4 class="password">password</h4>
                <input class="input1" name="userPassword" type="password" placeholder="PW" />
              </div>
    			<div><input type="checkbox" name="sellerLogin" value="seller"/>관리자 로그인</div>
              <input id="input2" type="submit" value="Log in" />
            </form>
            
            <%
            
      	  SqlSessionFactory sqlSessionFactory = Mybatis.getSqlSessionFactory();
      	  SqlSession Session;
      	  Session = sqlSessionFactory.openSession(true);
      	  
            HashMap<String, String> s1 = (HashMap<String,String>) session.getAttribute("itemDetail");
            
            //out.print(s1);
            
            out.print(s1);
            
            String getSeq = (String) request.getParameter("a");
            String getName = (String) request.getParameter("b");
            
            out.print(getSeq);
            out.print(getName);
            
            %>
          </div>
      </div>
    </div>
</body>
</html>