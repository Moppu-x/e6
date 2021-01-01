package org.zuel.app.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class IndexPage extends HttpServlet{

	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		//获取用户点击了哪个按钮，转至对应页面
		String action = (String)req.getParameter("action");
		if (action.equals("login")) {
			req.getRequestDispatcher("/login.jsp").forward(req, resp);
		}
		if(action.equals("reg_patient")) {
			req.getRequestDispatcher("/reg_patient.jsp").forward(req, resp);
		}
		if(action.equals("reg_doctor")) {
			req.getRequestDispatcher("/reg_doctor.jsp").forward(req, resp);
		}
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req,resp);
	}	
}
