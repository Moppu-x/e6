package org.zuel.app.service;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import org.zuel.app.dao.DeptDao;
import org.zuel.app.dao.DoctorDao;
import org.zuel.app.dao.PatientDao;
import org.zuel.app.dao.RegRecordDao;
import org.zuel.app.model.Dept;
import org.zuel.app.model.Doctor;
import org.zuel.app.model.Patient;
import org.zuel.app.model.RegRecord;

public class DoctorService {
    // login()方法用于医生登录(获取对应数据);
    public static Doctor login(int id, String password) {
        Doctor doctor = null;
        // doctor表中查询对应id和password的doctor数据;
        List<Doctor> dlist = DoctorDao.getDoctor(id, null, null, null, password);
        if (dlist.size() > 0) {
            doctor = dlist.get(0);
        }
        return doctor;
    }
    //获取科室
    public static Dept getDept(Doctor doctor) {
    	int deptId = doctor.getDeptId();
		Dept dept = null;
    	List<Dept> list = DeptDao.getDept(deptId,null,null,null);
    	if(list.size()>0) {
    		dept=list.get(0);
    	}
    	return dept;
    }
    
    //获取病人信息(除了密码)
    public static Patient getPatientInfo(int patient_id) {
		List<Patient> list = PatientDao.getPatient(patient_id, null, null, null, null);
    	Patient patient = null;
		if(list.size()>0) {
			patient = list.get(0);
		}
		patient.setPassword(null);
    	return patient;
    }

    // getRecord()查询挂号记录;
    public static List<RegRecord> getRecord(Doctor doctor) {
        List<RegRecord> rlist = new ArrayList<>();
        // 获取doctor的dept_id对应的挂号记录;
        rlist = RegRecordDao.getRegRecord(null, null, doctor.getDeptId(), null);
        return rlist;
    }

//    // showPatient()方法显示病人列表;
//    public static void showPatient(List<RegRecord> rList) {
//        Patient patient = null;
//        Iterator<RegRecord> iter = rList.iterator();
//        // 根据挂号记录的patient_id查询patient,并存放到map中
//        Map<Integer,Patient> map = new HashMap<>();
//        while (iter.hasNext()) {
//            patient = PatientDao.getPatient(iter.next().getPatientId(), null, null, null, null).get(0);
//            map.put(patient.getId(), patient);
//        }
//        //输出病人列表
//        for(Integer key : map.keySet()) {
//            System.out.println(map.get(key).toString());
//        }
//        System.out.println();
//    }

    // 挂号记录集合中对指定时间的记录进行统计;
    public static List<RegRecord> limitTime(List<RegRecord> rList, String time) {
        Iterator<RegRecord> iter = rList.iterator();
        List<RegRecord> fList = new ArrayList<>();
        RegRecord record=null;
        while (iter.hasNext()) {
            record=iter.next();
            if (record.getRegTime().substring(0, 10).equals(time)) {
                fList.add(record);
            }
        }
		return fList;
    }
    
    //newDoctor()方法用于新医生注册时新建对象
    public static Doctor newDoctor (String name, int sex, String passwd, int deptID) {
		DoctorDao.insertDoctor(null, name, deptID, sex, passwd);
		List<Doctor> d = DoctorDao.getDoctor(null, sex, deptID, name, passwd);
		Doctor doctor = null;
    	if(d.size()>0) {
    		doctor = d.get(0);
    	}
    	return doctor;   	
    }
    
    //编辑科室信息
    public static void editRemark(Doctor doctor,String remark) {
    	DeptDao.updateRemark(doctor.getDeptId(), remark);
    }
}
