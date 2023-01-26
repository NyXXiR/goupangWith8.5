<%@page import="model.itemVO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
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
	
	//String address = Session.selectOne("getBuyerAddress", buyerid);
	
	  
	   %>
	   <form action="insertOrderOK.jsp">
	   	<input type="submit" value="주문내역 업데이트"/>
	   </form>
	   
	   
	   <%
	   			//String buyerId = (String) session.getAttribute("buyerId");
			List<Integer> list = Session.selectList("getCatenumFromHistory", "test");
			out.print(list);
			
			int[] arr = new int[list.size()];
			
			for(int i=0; i<arr.length; i++) {
				arr[i] = list.get(i);
			}
			
			
			Map<Integer, Integer> map = new HashMap<Integer, Integer>();
			
			int answer = 0, maxVal = -1, maxValCnt = 0;
			for (int i = 0; i < arr.length; i++) {
				int t = map.getOrDefault(arr[i], 0) + 1;
				map.put(arr[i], t);
				if(maxValCnt<t) {maxVal = arr[i]; maxValCnt = t;}
			}
			
			for(Integer i: map.keySet()) {
				if(map.get(i)==maxValCnt && i!=maxVal)
					out.print(-1);
			}
			
			out.print(maxVal);
			
			List<itemVO> itemList1 = Session.selectList("getItemByCatenum", maxVal);
		%>
	   
	  </body>
</html>