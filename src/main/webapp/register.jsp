<%@page import="model.historyVO"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@page import="mybatis.Mybatis"%>
<%@page import="org.apache.ibatis.session.SqlSessionFactory"%>
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
            <input class="input1" name="userID" type="text" placeholder="ID"/>
          </div>
          <div class="box">
            <h4 class="name">Name</h4>
            <input class="input1" name="userName" type="text" placeholder="Name"/>
          </div>
          <div class="box">
            <h4 class="address">Address</h4>
            <input class="input1" name="userAddress" type="text" placeholder="Address"/>
          </div>
          <div class="box">
            <h4 class="password">password</h4>

            <input class="input1" name="userPassword" type="password" placeholder="PW"/>
          </div>

          <input id="input2" type="submit" value="Sign Up" />
        </form>
      </div>
      <div class="logo-container">
        <div class="logo-box">
          <img src="./resources/header/goupang.jpg" class="logo" alt="" />
        </div>
      </div>
    </div>
    
    
    <%
      SqlSessionFactory sqlSessionFactory = Mybatis.getSqlSessionFactory();
	  SqlSession Session;
	  Session = sqlSessionFactory.openSession(true); 
	  
    session.setAttribute("prdSeq", 5);
    session.setAttribute("prdCount", 5);
    
	int prdSeq = (int) session.getAttribute("prdSeq");
	int prdCount =  (int) session.getAttribute("prdCount");
	String buyerid = (String) session.getAttribute("buyerId");
	
	String address = Session.selectOne("getBuyerAddress", buyerid);
	
	  
	   %>
	   <form action="insertOrderOK.jsp">
	   	<input type="submit" value="주문내역 업데이트"/>
	   </form>
	  </body>
</html>