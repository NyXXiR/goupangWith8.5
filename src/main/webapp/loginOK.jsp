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
	<%
	  
	  SqlSessionFactory sqlSessionFactory = Mybatis.getSqlSessionFactory();
	  SqlSession Session;
	  Session = sqlSessionFactory.openSession(true);
	  // mybatis 셋팅
	  String enteredID = request.getParameter("userID");
	  String enteredPassword = request.getParameter("userPassword");
	  // 입력값 저장
	  
	  String isBuyerIdValid = Session.selectOne("buyerIdCheck", enteredID);
	  String isBuyerPwValid = Session.selectOne("buyerPwCheck", enteredID);

	  // 구매자 로그인 정보 확인
	  String isSellerIdValid = Session.selectOne("sellerIdCheck", enteredID); 
	  String isSellerPwValid = Session.selectOne("sellerPwCheck", enteredID);
	  // 판매자 로그인 정보 확인

	  String isSellerLogin = request.getParameter("sellerLogin");
	  //로그인 페이지 체크박스 값 리턴
	  
	  
	  // 구매자 로그인 모드
	  if(isSellerLogin == null) {
		  // 관리자 로그인 체크박스 값이 null이라면 아래 실행
		  if(isBuyerIdValid != null) {
			  if(isBuyerPwValid.equals(enteredPassword)) {
				  %>
				  <script>
				  <% session.setAttribute("buyerId", enteredID);%>
						alert("구매자 로그인 성공");
						window.location.href = 'view.jsp';
				  </script>
				  <%
				  //구매자 로그인 성공
			  } else {
				  %>
				  <script>
						alert("비밀번호를 확인 해 주세요");
						window.location.href = 'login.jsp';
				  </script>
				  <%
				  //구매자 비밀번호 틀림
			  }
		  } else {
			  %>
			  <script>
					alert("아이디가 존재하지 않습니다");
					window.location.href = 'login.jsp';
			  </script>
			  <%
			  //구매자 아이디 없음
		  }
		  
		  
	  } else {
		  // 판매자 로그인 모드
		  if(isSellerIdValid != null) {
			// 관리자 로그인 체크박스가 선택되었다면 아래 실행
			  if(isSellerPwValid.equals(enteredPassword)) {
				  %>
				  <script>
				  <% session.setAttribute("sellerID", enteredID);%>
						alert("판매자 로그인 성공");
						window.location.href = 'view.jsp';
				  </script>
				  <%
				  //판매자 로그인 성공
			  } else {
				  %>
				  <script>
						alert("비밀번호를 확인 해 주세요");
						window.location.href = 'login.jsp';
				  </script>
				  <%
				 //판매자 비밀번호 틀림
			  }
		  } else {
			  %>
			  <script>
					alert("아이디가 존재하지 않습니다");
					window.location.href = 'login.jsp';
			  </script>
			  <%
			  // 판매자 아이디 없음
		  }
	  }%>
		  
		  
</body>
</html>