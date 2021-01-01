package org.zuel.app.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.zuel.app.dao.RegRecordDao;
import org.zuel.app.model.Doctor;
import org.zuel.app.model.RegRecord;
import org.zuel.app.service.DoctorService;

public class DoctorAction extends HttpServlet {

	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		//获取医生页面的动作(按钮)
		String action = request.getParameter("action");
		//目的页面
		String destPage = "doctor.jsp";
		if(action.equals("filter")) {
			//点击了筛选按钮
			request.setAttribute("more", "filter");
			if(request.getAttribute("filterType")!=null) {
				request.removeAttribute("filterType");
			}
		}
		if(action.equals("refresh")) {
			//点击了刷新挂号记录按钮
			HttpSession session = request.getSession();
			Doctor doctor = (Doctor) session.getAttribute("user");
    		List<RegRecord> list = RegRecordDao.getRegRecord(null,null, doctor.getDeptId(), null);    		
    		session.setAttribute("record", list);
		}
		if(action.equals("deptinfo")) {
			//点击了科室信息按钮
			request.setAttribute("more", "dept");
			if(request.getAttribute("editState")!=null) {
				request.removeAttribute("editState");
			}
		}
		if(action.equals("logout")) {
			//点击了退出登录按钮
			HttpSession session = request.getSession();
			request.removeAttribute("more");
			session.invalidate();
			destPage = "index.jsp";
		}
		if(action.equals("doFilter")) {
			//筛选界面点击了立即筛选按钮
			String condition = request.getParameter("condition");
			String conValue = request.getParameter("fvalue");
			HttpSession session = request.getSession();
			Doctor doctor = (Doctor) session.getAttribute("user");
    		List<RegRecord> list = RegRecordDao.getRegRecord(null,null, doctor.getDeptId(), null); 
    		String filterType = "所有";
    		String filterValue = "";
			if(condition.equals("date")) {
				list = DoctorService.limitTime(list, conValue);
				filterType = "指定日期";
				filterValue = conValue;
			}
			if(condition.equals("id")) {
				Iterator<RegRecord> iter = list.iterator();
		        List<RegRecord> fList = new ArrayList<>();
		        RegRecord record=null;
		        while (iter.hasNext()) {
		            record=iter.next();
		            if (record.getId()==Integer.valueOf(conValue)) {
		                fList.add(record);
		            }
		        }
		        list = fList;
				filterType = "指定记录号";
				filterValue = conValue;
			}
			request.setAttribute("filterType", filterType);
			request.setAttribute("filterValue", filterValue);
			if(request.getAttribute("more")==null) {
				request.setAttribute("more", "filter");
			}
			session.setAttribute("record", list);
		}
		if(action.equals("endFilter")) {
			//筛选界面点击了取消筛选按钮
			HttpSession session = request.getSession();
			Doctor doctor = (Doctor) session.getAttribute("user");
    		List<RegRecord> list = RegRecordDao.getRegRecord(null,null, doctor.getDeptId(), null); 
    		session.setAttribute("record", list);
			request.setAttribute("more", null);
		}
		if(action.equals("editInfo")) {
			//科室信息界面点击了修改信息按钮
			request.setAttribute("more", "dept");
			request.setAttribute("editState", "inEdit");
		}
		if(action.equals("return")) {
			//科室信息界面点击了返回按钮
			request.setAttribute("more", null);
			if(request.getAttribute("editState")!=null) {
				request.removeAttribute("editState");
			}
			if(request.getAttribute("filterType")!=null) {
				request.removeAttribute("filterType");
			}
		}
		if(action.equals("checkEdit")) {
			//修改信息界面点击了确定
			String remark = request.getParameter("dvalue");
			HttpSession session = request.getSession();
			Doctor doctor = (Doctor) session.getAttribute("user");
			DoctorService.editRemark(doctor, remark);
			request.setAttribute("editState", null);
			request.setAttribute("more", "dept");
		}
		if(action.equals("cancelEdit")) {
			//修改信息界面点击了取消
			if(request.getAttribute("editState")!=null) {
				request.removeAttribute("editState");
			}
			if(request.getAttribute("more")==null) {
				request.setAttribute("more","dept");
			}
		}
		//跳转到目的页面
		request.getRequestDispatcher(destPage).forward(request, response);
	}
	
}
