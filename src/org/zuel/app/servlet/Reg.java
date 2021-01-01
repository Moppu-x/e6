package org.zuel.app.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.zuel.app.model.Doctor;
import org.zuel.app.model.Patient;
import org.zuel.app.service.DoctorService;
import org.zuel.app.service.PatientService;

public class Reg extends HttpServlet {

	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req,resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		//获取注册用户的类型
		String userType = req.getParameter("usertype");
		//获取其他参数
		String name = req.getParameter("username");
		int sex = Integer.valueOf(req.getParameter("usersex"));
		String passwd = req.getParameter("password");
		//id用于保存新注册用户的id，初始值-1
		int id = -1;
		//如果是病人注册则使用patient服务的注册功能
		if(userType.equals("patient")) {
			int age = Integer.valueOf(req.getParameter("age"));
			Patient patient = PatientService.newPatient(name, sex, passwd, age);
			id = patient.getId();
		}
		//如果是医生注册则使用doctor服务的注册功能
		if(userType.equals("doctor")) {
			int deptID = Integer.valueOf(req.getParameter("dept"));
			Doctor doctor = DoctorService.newDoctor(name, sex, passwd, deptID);
			id = doctor.getId();
		}
		
		if(id==-1) {
			String msg = "注册失败";
			req.setAttribute("regmsg", msg);
		}
		else {
			String msg = "注册成功";
			req.setAttribute("regmsg", msg);
			req.setAttribute("userid", id);
		}
		//转到注册结果页面
		req.getRequestDispatcher("/reg_result.jsp").forward(req, resp);
	}
	
}
