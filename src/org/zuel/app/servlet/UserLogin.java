package org.zuel.app.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.zuel.app.dao.RegRecordDao;
import org.zuel.app.model.Doctor;
import org.zuel.app.model.Patient;
import org.zuel.app.model.RegRecord;
import org.zuel.app.service.DoctorService;
import org.zuel.app.service.PatientService;

public class UserLogin extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        //获取登录用户的类型
        String userType = request.getParameter("select-type");
        //获取id和密码
        Integer userid = Integer.valueOf(request.getParameter("ID"));
        String passwd = request.getParameter("password");
        //判断用户类型
        //病人
        if(userType.equals("patient")) {
        	Patient patient = PatientService.login(userid, passwd);
        	if(patient==null) {
        		//登录失败，返回登录页面并显示错误信息
        		request.setAttribute("errMsg", "ID或密码错误，请重试");
        		request.getRequestDispatcher("login.jsp").forward(request, response);
        	}
        	else {
        		//登录成功，在session中存入patient对象和该病人的挂号记录列表
        		HttpSession session = request.getSession();
        		List<RegRecord> list = RegRecordDao.getRegRecord(null,patient.getId(), null, null);
        		session.setAttribute("user",patient);
        		session.setAttribute("record", list);
        		//转至病人主页
        		request.getRequestDispatcher("patient.jsp").forward(request, response);
        	}
        }
        //医生
        if(userType.equals("doctor")) {
        	Doctor doctor = DoctorService.login(userid, passwd);
        	if(doctor==null) {
        		//登录失败，返回登录页面并显示错误信息
        		request.setAttribute("errMsg", "ID或密码错误，请重试");
        		request.getRequestDispatcher("login.jsp").forward(request, response);
        	}
        	else {
        		//登录成功，在session中存入doctor对象和该医生部门的挂号记录列表
        		HttpSession session = request.getSession();
        		List<RegRecord> list = RegRecordDao.getRegRecord(null, null, doctor.getDeptId(), null);
        		session.setAttribute("user",doctor);
        		session.setAttribute("record", list);
        		//转至医生主页
        		request.getRequestDispatcher("doctor.jsp").forward(request, response);
        	}
        }
        
    }

	
    @Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}
 
}