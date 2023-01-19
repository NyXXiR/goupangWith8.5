<%@ page import="model.itemVO" %>
<%@ page import= "java.util.HashMap" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<% 
itemVO vo = new itemVO(3, "아이패드", 150000, 15, "lgh0334", "sysdate", 10, 100, "아이가 사용해요", 146);
int discounted = vo.getPrice() / 100 * (100-vo.getDiscount());
HashMap<String, String> itemMap = new HashMap<>();


// 구매 프로세스에 필요한 vo 값:              
itemMap.put("seq",Integer.toString(vo.getSeq()));
itemMap.put("name", vo.getItemname());
itemMap.put("category_num",Integer.toString(vo.getCategorynum()));
itemMap.put("price", Integer.toString(vo.getPrice()));
itemMap.put("discount",Integer.toString(vo.getDiscount()));
itemMap.put("discounted", Integer.toString(discounted));
itemMap.put("seller_id", vo.getSellerid());
itemMap.put("description", vo.getDescription());
// 수량(qty)은 detail.jsp에서 추가될 예정임
session.setAttribute("itemMap", itemMap);

//userName은 임시로 설정
session.setAttribute("buyer_id", "lgh0334");

//quantity 1로 설정해둠
session.setAttribute("quantity",1);

%>

<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<body>

<a href="itemDetail.jsp">상세페이지로</a>
<%= session.getAttribute("itemMap") %>


</body>
</html>