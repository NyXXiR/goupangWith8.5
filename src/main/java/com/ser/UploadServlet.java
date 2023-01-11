package com.ser;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Collection;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

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

		PrintWriter writer = resp.getWriter();
		writer.println("<html><body>");
		
		String contentType = req.getContentType();
		if (contentType != null
				&& contentType.toLowerCase().startsWith("multipart/")) {
			printPartInfo(req, writer);
		} else {
			writer.println("multipart가 아님");
		}
		writer.println("</body></html>");
	}

	private void printPartInfo(HttpServletRequest req, PrintWriter writer)
			throws IOException, ServletException {
		
		
		int i = 1;
		Collection<Part> parts = req.getParts();
		for (Part part : parts) {
			String itemNum = req.getParameter("itemNum");
			writer.println("<br/> name = " + part.getName());
			String contentType = part.getContentType();
			writer.println("<br/> contentType = " + contentType);
			if (part.getHeader("Content-Disposition").contains("filename=")) {
				writer.println("<br/> size = " + part.getSize());
				String fileName = part.getSubmittedFileName();
				writer.println("<br/> filename = " + itemNum+"("+i+")");
				if (part.getSize() > 0) {
					part.write("C:\\goupangWith8.5\\src\\main\\webapp\\resources\\item\\" + itemNum+"("+i+").jpg");
					part.delete();
					i++;
				}
			} else {
				String value = req.getParameter(part.getName());
				writer.println("<br/> value = " + value);
			}
			writer.println("<hr/>");
		}
		i = 1;
	}

}