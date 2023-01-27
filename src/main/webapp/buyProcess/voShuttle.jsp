<%@ page import="model.itemVO" %>
<%@ page import= "java.util.HashMap" %>
<%@ page import="mybatis.Mybatis"%>
<%@ page import="java.util.List"%>
<%@ page import="org.apache.ibatis.session.SqlSessionFactory"%>
<%@ page import="org.apache.ibatis.session.SqlSession"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<% 

//로그인 정보가 없을 경우 메인화면으로 돌려보냄
if(session.getAttribute("buyerId")==null){
response.sendRedirect("view.jsp");
}

SqlSessionFactory sqlSessionFactory = Mybatis.getSqlSessionFactory();
SqlSession sqlSession;
sqlSession = sqlSessionFactory.openSession(true);

itemVO vo = sqlSession.selectOne("getVOBySeq", request.getParameter("item_seq"));

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

//userName은 임시로 설정, 로그인하지 않았을 경우 돌려보냄
//session.setAttribute("buyerId", "lgh0334");



//quantity 1로 설정해둠
session.setAttribute("quantity",1);

response.sendRedirect("itemDetail.jsp");
%>

<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<body>

</body>
</html>