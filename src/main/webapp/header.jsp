<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@page import="mybatis.Mybatis"%>
<%@page import="org.apache.ibatis.session.SqlSessionFactory"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>header</title>
<link rel="stylesheet" href="headerCSS.css" />
</head>
<body>
<%
SqlSessionFactory sqlSessionFactory = Mybatis.getSqlSessionFactory();
SqlSession Session;
Session = sqlSessionFactory.openSession(true); 

String loginStatus = (String) session.getAttribute("buyerId");
String sellerLoginStatus = (String) session.getAttribute("sellerId");
// getAttribute는 반환형이 Object이므로 형변환 필요함
// 즉, 모든 클래스 타입을 속성의 값으로 사용 가능 하다는 것을 의미함.
%>

<div id="wrapper">
  <div id="left-slide-container">
      <div class="close-btn-box">
        <img src="./resources/header/close.png" class="slide-close-btn" onclick="closeNav()" />
      </div>
      <h1><a href="#">특가 상품</a></h1>
      <div style="height:5px; background:lightgray"></div>
      <a href="#">A</a>
      <a href="#">B</a>
      <a href="#">C</a>
  </div>
      <div class="header-container">
        <div class="upper-header-white">
        
          <div class="header-left-box">
            <img src="./resources/header/menu1.png" class="left-slide-btn" onclick="openNav()" />
            <a href="view.jsp"><img src="./resources/header/goupang.jpg" class="logo" alt="	" /></a>
          </div>
          
          <div class="header-middle-box">
           <form action="search2.jsp" class="search-container" method="POST">
	            <div class="search-box">
	              <input type="text" class="search-bar" name="searchbar" placeholder="" />
	              <input type="submit" class="search-Btn" value=""/>
	            </div>
            </form>
          </div>
          
          <div class="header-right-box">
            <ul class="menu-bar">
           	<% if(loginStatus == null && sellerLoginStatus == null) {
           		// 판매자, 구매자 어느쪽도 로그인이 되어있지 않으면 아래 실행 x
           	} else { %>
           	<!-- 관리자, 구매자 어느쪽이라도 세션에 값이 저장되어 있다면 이하 실행 -->
            	 <li>
            	  <a href="#"><img src="./resources/header/account.png" alt="" class="account-img"/></a>
                	<div class="detail-box">
                  		<ul class="drop-menu-1">
                  		<% 
                  		if(sellerLoginStatus != null) {%>
<<<<<<< Updated upstream
                  		<!-- 판매자 로그인이 되어있으면 -->
=======
                  		<!-- 판매자 로그인 세션에 값이 NULL이 아닌 경우 아래 실행 -->
>>>>>>> Stashed changes
                  			<li><a href="mypage_master.jsp?seller_id=">관리자 페이지</a></li>
                  		<% 	} else { %> 
                  		<!-- 구매자 로그인이 되어있으면 -->
		                    <li><a href="mypage_consumer.jsp?buyer_id=<%=loginStatus %>">회원 정보</a></li>
		                    <li><a href="mypage.jsp">메뉴 1</a></li>
		                    <li><a href="mypage.jsp">메뉴 2</a></li>
		                    <li><a href="mypage.jsp">메뉴 3</a></li>
		                <% } %>
                  		</ul>
                	</div>
             	 </li>
             <%
             }
             %>
	              <li>
	                <a href="#"><img src="./resources/header/home.png" alt="" class="home-img" /></a>
	              </li>
	              <li>
	                <a href="#"><img src="./resources/header/cart.png" alt="" class="cart-img" /></a>
	              </li>
	              <li class="drop2">
	                <a href=""><img src="./resources/header/menu.png" alt="" class="menu-img" /></a>
	                <div class="detail-box2">
	                  <ul class="drop-menu-2">
		                  <%
		                  if(loginStatus == null && sellerLoginStatus == null) {%>
<<<<<<< Updated upstream
		                  <!-- 판매자, 구매자 어느쪽이라도 로그인이 안되어있다면 -->
=======
		                  <!-- 구매자, 판매자 세션 모두 null일 경우에 메뉴가 출력되게끔 -->
>>>>>>> Stashed changes
		                  	<li><a href="login.jsp">로그인</a></li>
		                  <% } else{
		                	  //로그인 세션에 값이 저장되어있다면(로그인 상태라면)
		                	  %> 
		                	  <li><a href="logout.jsp">로그아웃</a></li>
		                	  <% 
		                  }
		                  %>
	                    <li><a href="register.jsp">회원가입</a></li>
	                  </ul>
	                </div>
	              </li>
            </ul>
          </div>
        </div>
        <div class="bottom-header-black">
          <div class="bottom-container"></div>
        </div>
      </div>

    <script>
      function openNav() {
        document.getElementById("left-slide-container").style.width = "350px";
        document.querySelector("header").style.backgroundColor =
          "rgb(245, 245, 245)";
        // document.getElementById("main").style.marginLeft = "250px";
      }

      function closeNav() {
        document.getElementById("left-slide-container").style.width = "0px";
        document.querySelector("header").style.backgroundColor = "white";
        // document.getElementById("main").style.marginLeft = "0";
      }
      
      document.charset = "UTF-8"; 
    </script>
    </div>
    </body>
</html>