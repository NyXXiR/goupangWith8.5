<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@page import="mybatis.Mybatis"%>
<%@page import="org.apache.ibatis.session.SqlSessionFactory"%>
<%@page import="model.*"%>
<%@page import="DAO.*"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<%
	
	  SqlSessionFactory sqlSessionFactory = Mybatis.getSqlSessionFactory();
	  SqlSession Session;
	  Session = sqlSessionFactory.openSession(true); 
		// mybatis 설정값 사용하기 위한 기초 셋팅
      String userID = request.getParameter("userID");
	  String userPassword = request.getParameter("userPassword");
	  String userName = request.getParameter("userName");
		// 폼 태그 안의 값을 불러와서 변수에 담기
	  buyerVO buyer = new buyerVO(userID, userPassword, userName);
	  	// seq 제외하고 회원가입 페이지에서 실제로 가져오는 값을 통해 새로운 객체 생성
	  	
	  	
		if (userID != "" && userPassword != "" && userName != "") {
			  Session.insert("signUpBuyer", buyer);
			  %>
				  <script>
				  alert("<%= request.getParameter("userName")%> 님 회원가입 완료 되었습니다");
				  window.location.href = 'header.jsp';
				  </script>
			  <%
			  Session.commit();
			  //response.sendRedirect("header.jsp");
		} else {
			  %>
				  <script>
				  alert("아이디와 비밀번호를 확인 해 주세요");
				  window.location.href = 'register.jsp';
				  </script>
			  <%
			  Session.rollback();
			//response.sendRedirect("register.jsp");
		  }
		  %>
	 

</body>
</html>