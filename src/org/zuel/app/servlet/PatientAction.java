package org.zuel.app.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.zuel.app.dao.RegRecordDao;
import org.zuel.app.model.Patient;
import org.zuel.app.model.RegRecord;
import org.zuel.app.service.PatientService;

public class PatientAction extends HttpServlet {

	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		//获取请求中的action参数(即点击了哪个按钮)
		String action = (String) request.getParameter("action");
		String destPage = "patient.jsp";
		if(action!=null && action.equals("record")) {
			//点击了挂号按钮
			request.setAttribute("more", "add");
		}
		if(action!=null && action.equals("refresh")) {
			//点击了刷新挂号记录按钮
			HttpSession session = request.getSession();
			Patient patient = (Patient) session.getAttribute("user");
    		List<RegRecord> list = RegRecordDao.getRegRecord(null,patient.getId(), null, null);    		
    		session.setAttribute("record", list);
		}
		if(action!=null && action.equals("logout")) {
			//点击了退出登录按钮
			HttpSession session = request.getSession();
			session.invalidate();
			destPage = "index.jsp";
		}
		if(action!=null && action.equals("addRecord")) {
			//挂号操作中点击了立即挂号按钮
			//获取科室id和病人对象
			int deptId = Integer.valueOf(request.getParameter("deptId"));
			HttpSession session = request.getSession();
			Patient patient = (Patient) session.getAttribute("user");
			//使用PatientService进行挂号
			RegRecord record = PatientService.register(patient, deptId);
			request.setAttribute("more",null);
			if(record!=null) {
				request.setAttribute("msg", "挂号成功");
				request.setAttribute("addResult", "success");
				request.setAttribute("newRecord", record);
			}
			else {
				request.setAttribute("msg", "挂号失败");
				request.setAttribute("addResult", "fail");
			}
		}
		if(action!=null && action.equals("cancelAdd")) {
			//挂号操作中点击了取消挂号按钮
			request.setAttribute("more", null);
		}
		if(action!=null && action.equals("check")) {
			//挂号成功后点击了确定按钮
			request.setAttribute("addResult",null);
			//更新挂号记录
			HttpSession session = request.getSession();
			Patient patient = (Patient) session.getAttribute("user");
    		List<RegRecord> list = RegRecordDao.getRegRecord(null,patient.getId(), null, null);    		
    		session.setAttribute("record", list);
		}
		if(action!=null && action.equals("retry")) {
			//挂号失败后点击了重试按钮
			request.setAttribute("addResult",null);
			request.setAttribute("msg",null);
			request.setAttribute("more","add");
		}
		request.getRequestDispatcher(destPage).forward(request, response);
	}

	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}

}
