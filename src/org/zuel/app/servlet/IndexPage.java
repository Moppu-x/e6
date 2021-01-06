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
		String dest_page = "login.jsp";

		if(action.equals("reg_patient")) {
			dest_page = "reg_patient.jsp";
		}
		if(action.equals("reg_doctor")) {
			dest_page = "reg_doctor.jsp";
		}

		req.getRequestDispatcher(dest_page).forward(req, resp);
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req,resp);
	}
}
