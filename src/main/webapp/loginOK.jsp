<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@page import="mybatis.Mybatis"%>
<%@page import="org.apache.ibatis.session.SqlSessionFactory"%>
<%@page import="DAO.*"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 마스터 아이디 정해놓고 해당 아이디로 로그인 하면 관리자 페이지 보이게 -->
	<%
	  
	  SqlSessionFactory sqlSessionFactory = Mybatis.getSqlSessionFactory();
	  SqlSession Session;
	  Session = sqlSessionFactory.openSession(true);
	  // mybatis 셋팅
	  String enteredID = request.getParameter("userID");
	  String enteredPassword = request.getParameter("userPassword");
	  // 입력값 저장
	  
	  String checkId = Session.selectOne("loginCheckID", enteredID);
	  String checkPw = Session.selectOne("loginCheckPw", enteredID);
	  String buyerName = Session.selectOne("selectBuyerName", enteredID);


	  if(enteredID == "" || enteredPassword == "") {
		  %>
		  <script>
				alert("아이디 혹은 비밀번호를 입력 해 주세요");
				window.location.href = 'login.jsp';
		  </script>
		  <%
		 return;
	  }
	 //공백검사
	 
	  if(enteredID.equals(checkId)) {
	  } else {
		  %>
		  <script>
				alert("존재하지 않는 아이디 입니다");
				window.location.href = 'login.jsp';
		  </script>
		  <%
		  return;
	  }
	 //아이디 db에 있는지 검사
	  if(enteredPassword.equals(checkPw)) {
		  session.setAttribute("buyerId", enteredID);
		  //로그인에 성공하면 buyerId 세션값을 입력받은 아이디로 설정
		  session.setAttribute("buyerName", buyerName);
		  //로그인에 성공하면 buyerName 세션값 로그인한 회원의 이름으로 저장
		  %>
			 <script> 
				 alert("<%=buyerName%> 님 환영합니다"); 
				window.location.href = 'header.jsp';
				//로그인 성공 시 돌아갈 화면
			</script>
			 <%
	  } else {
		  %>
		  <script>
				alert("비밀번호를 확인 해 주세요");
				window.location.href = 'login.jsp';
				// 아이디는 DB에 존재하지만 비밀번호가 틀렸을 시
		  </script>
		  <%
	  } %>
	  <%-- 해당 아이디가 DB에 존재한다면 해당 아이디의 비밀번호와 입력받은 비밀번호가 일치하는지 검사 --%>
			
</body>
</html>