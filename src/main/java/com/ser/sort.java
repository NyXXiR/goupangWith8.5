package com.ser;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import model.itemVO;
import mybatis.Mybatis;

@WebServlet("/sort")
public class sort extends HttpServlet {
	
	SqlSessionFactory sqlSessionFactory = Mybatis.getSqlSessionFactory();
	SqlSession Session = sqlSessionFactory.openSession(true);
	
	private static final long serialVersionUID = 1L;
       
    public sort() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}
	
	public void sortItemsByRanking(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<itemVO> sortItems = Session.selectList("sortBySalesRecord");
		
		request.setAttribute("sortedList", sortItems);
		RequestDispatcher dispatcher = request.getRequestDispatcher("/search2.jsp");
		dispatcher.forward(request, response);
		System.out.println("전송완료");
		
	}

}
