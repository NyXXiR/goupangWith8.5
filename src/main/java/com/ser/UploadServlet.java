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
		int inttemNum = sess.selectOne("itemNextval");
			++inttemNum;

		PrintWriter writer = resp.getWriter();
		System.out.println("서블릿");
		String contentType = req.getContentType();
		if (contentType != null
				&& contentType.toLowerCase().startsWith("multipart/")) {
			printPartInfo(req, writer,inttemNum);
			
			String productName = req.getParameter("pdName");
			int productPrice = Integer.valueOf(req.getParameter("pdPrice"));
			int productDiscount = Integer.valueOf(req.getParameter("pdDiscount"));
			int productQTY = Integer.valueOf(req.getParameter("pdQTY"));
			int productSelect = Integer.valueOf(req.getParameter("pdCategory"));
			String productDesc = req.getParameter("pdDesc");
			System.out.println(productName);
			System.out.println(productPrice);
			System.out.println(productDiscount);
			System.out.println(productQTY);
			System.out.println(productSelect);
			itemVO item = new itemVO(productName, productPrice, productDiscount, "ninja", productSelect, productQTY,productDesc);
			System.out.println(item);
			sess.selectOne("ItemUpload", item);
			
		} else {
			writer.println("<html><body>");
			writer.println("multipart가 아님");
		}
		
		writer.println("<script>location.href='mypage_master.jsp'</script>");
		writer.println("</body></html>");
	}

	private void printPartInfo(HttpServletRequest req, PrintWriter writer, int inttemNum)
			throws IOException, ServletException {
		System.out.println("메서드");
	    
		
		
		int i = 1;
		Collection<Part> parts = req.getParts();
		for (Part part : parts) {
			String itemNum = String.valueOf(inttemNum);
			String contentType = part.getContentType();
			System.out.println("파라미터 시작");
			
			if (part.getHeader("Content-Disposition").contains("filename=")) {
				String fileName = part.getSubmittedFileName();
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