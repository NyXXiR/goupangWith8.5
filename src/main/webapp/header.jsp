<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="headerCSS.css" />
</head>
<body>
<%
String loginStatus = (String) session.getAttribute("buyerId");
// getAttribute는 반환형이 Object이므로 형변환 필요함
// 즉, 모든 클래스 타입을 속성의 값으로 사용 가능 하다는 것을 의미함.
%>

<div id="wrapper">
  <div id="left-slide-container">
      <div class="close-btn-box">
        <img src="./resources/header/close.png" class="slide-close-btn" onclick="closeNav()" />
      </div>
      <h1><a href="">메뉴</a></h1>
      <div style="height:5px; background:lightgray"></div>
      <a href="">A</a>
      <a href="">B</a>
      <a href="">C</a>
  </div>
      <div class="header-container">
        <div class="upper-header-white">
        
          <div class="header-left-box">
            <img src="./resources/header/menu1.png" class="left-slide-btn" onclick="openNav()" />
            <a href="header.jsp"><img src="./resources/header/goupang.jpg" class="logo" alt="	" /></a>
          </div>
          
          <div class="header-middle-box">
           <form action="search.jsp" class="search-container" method="POST">
                <select name="comboValue">
                  <option value="all">전체</option>
                  <option value="sellerId">판매자이름</option>
                  <option value="itemName">상품명</option>
                </select>
	            <div class="search-box">
	              <input type="text" class="search-bar" name="searchbar" placeholder="" />
	              <input type="submit" class="search-Btn" value=""/>
	            </div>
            </form>
          </div>
          
          <div class="header-right-box">
            <ul class="menu-bar">
           	<% if(loginStatus == null) {
           	} else { %>
            	 <li>
            	  <a href="#"><img src="./resources/header/account.png" alt="" class="account-img"/></a>
                	<div class="detail-box">
                  		<ul class="drop-menu-1">
		                    <li><a href="myPage.jsp">회원 정보</a></li>
		                    <li><a href="myPage.jsp">메뉴 1</a></li>
		                    <li><a href="myPage.jsp">메뉴 2</a></li>
		                    <li><a href="myPage.jsp">메뉴 3</a></li>
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
		                  if(loginStatus == null) {%>
		                  	<li><a href="login.jsp">로그인</a></li>
		                  <% } else{
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