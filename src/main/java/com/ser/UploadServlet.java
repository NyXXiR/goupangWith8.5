package com.ser;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Collection;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import model.itemVO;
import mybatis.Mybatis;

/**
 * Servlet implementation class UploadServlet
 */
@WebServlet("/Upload")
@MultipartConfig(location = "C:\\temp")
public class UploadServlet extends HttpServlet {
	

	
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");

		resp.setContentType("text/html; charset=utf-8");
		
		SqlSessionFactory sqlSessionFactory = Mybatis.getSqlSessionFactory();
		SqlSession sess;
	 	sess = sqlSessionFactory.openSession(true);
		
			

		PrintWriter writer = resp.getWriter();
		String contentType = req.getContentType();
		if (contentType != null
				&& contentType.toLowerCase().startsWith("multipart/")) {
			
			if (req.getParameter("pdName") == null) {
				writer.println("<script> alert('상품명을 작성하여주십시오.')</script>");
			}else if(req.getParameter("pdPrice") == null) {
				writer.println("<script> alert('상품가격을 작성하여주십시오.')</script>");
			}else if(req.getParameter("pdDiscount") == null) {
				writer.println("<script> alert('상품할인율을 작성하여주십시오.')</script>");
			}else if(req.getParameter("pdQTY") == null) {
				writer.println("<script> alert('상품수량을 작성하여주십시오.')</script>");
			}else if(req.getParameter("pdCategory") == null) {
				writer.println("<script> alert('상품카테고리를 작성하여주십시오.')</script>");
			}else if(req.getParameter("pdDesc") == null) {
				writer.println("<script> alert('상품설명을 작성하여주십시오.')</script>");
			}else {
			
			
			String productName = req.getParameter("pdName");
			String sellerID = req.getParameter("sellerID");
			int productPrice = Integer.valueOf(req.getParameter("pdPrice"));
			int productDiscount = Integer.valueOf(req.getParameter("pdDiscount"));
			int productQTY = Integer.valueOf(req.getParameter("pdQTY"));
			int productSelect = Integer.valueOf(req.getParameter("pdCategory"));
			String productDesc = req.getParameter("pdDesc");

			int inttemNum = sess.selectOne("itemNextval");
			printPartInfo(req, writer,inttemNum);
			
			
			itemVO item = new itemVO(productName, productPrice, productDiscount, sellerID, productSelect, productQTY,productDesc);
			sess.selectOne("ItemUpload", item);
			writer.println("<script> alert('상품등록의 성공하였습니다.')</script>");
			}
		} else {
			writer.println("<html><body>");
			writer.println("multipart가 아님");
		}
		
		writer.println("<script> location.href='mypage_master.jsp'</script>");
		writer.println("</body></html>");
	}

	private void printPartInfo(HttpServletRequest req, PrintWriter writer, int inttemNum)
			throws IOException, ServletException {
		int i = 1;
		Collection<Part> parts = req.getParts();
		for (Part part : parts) {
			String itemNum = String.valueOf(inttemNum);
			
			if (part.getHeader("Content-Disposition").contains("filename=")) {
				if (part.getSize() > 0) {
					part.write("C:\\goupangWith8.5\\src\\main\\webapp\\resources\\item\\" + itemNum+"("+i+").jpg");
					part.delete();
					i++;
					
				}
			} else {
				String value = req.getParameter(part.getName());
			}
		}
		i = 1;
	}

}