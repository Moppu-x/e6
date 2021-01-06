package org.zuel.app.service;

import java.util.Date;
import java.util.List;
import java.text.SimpleDateFormat;

import org.zuel.app.dao.DeptDao;
import org.zuel.app.dao.PatientDao;
import org.zuel.app.dao.RegRecordDao;
import org.zuel.app.model.Dept;
import org.zuel.app.model.Patient;
import org.zuel.app.model.RegRecord;

public class PatientService {
    // register()方法用于挂号;
    public static RegRecord register(Patient patient, Integer deptId) {
        RegRecord record = new RegRecord();
        record.setPatientId(patient.getId());
        record.setDeptId(deptId);
        //获取当前时间作为挂号时间
        Date date = new Date();
        record.setRegTime(date);
        //获取挂号时间的小时数以判断挂号费
        SimpleDateFormat formater = new SimpleDateFormat("HH");
        Integer hour = Integer.valueOf(formater.format(date));
        //分时段收费，非工作时间收费较高
        if (hour<8 || hour>18) {
            record.setPrice(15);   
        } else {
            record.setPrice(10);
        }
        //向reg_record表写入新数据;
        RegRecordDao.insertRegRecord(record);
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		List<RegRecord> rList = RegRecordDao.getRegRecord(null, patient.getId(), deptId, sdf.format(date));
		if(rList.size()>0){
            record = rList.get(0);
        }
        return record;       
    } 

    //login()方法用于已有病人登录;
    public static Patient login(int id,String password) {
        Patient patient = null;
        List<Patient> pList = PatientDao.getPatient(id, null, null, null, password);
        if(pList.size()>0){
            patient = pList.get(0);
        }
        return patient;
    }

//    //createPatient()方法用于新建Patient对象并写入数据库;
//    public static Patient createPatient(Scanner in) {
//        Patient patient = new Patient();
//        patient.setAll(in);
//        PatientDao.insertPatient(patient);
//        List<Patient> p = 
//        PatientDao.getPatient(null, patient.getName(), patient.getSex(), patient.getAge(), patient.getPassword());
//        patient = p.get(0);
//        return patient;
//    }
    
    //病人注册时用于创建新对象
    public static Patient newPatient (String name, int sex, String passwd, int age) {
		PatientDao.insertPatient(null, name, sex, age, passwd);
		List<Patient> p = PatientDao.getPatient(null, name, sex, age, passwd);
    	Patient patient = p.get(0);
    	return patient;   	
    }
    
    //获取挂号记录的科室id对应的科室名
    public static String getDeptName(int deptId) {
    	String name = null;
    	List<Dept> list = DeptDao.getDept(deptId, null, null, null);
    	if(list.size()>0) {
    		name = list.get(0).getName();
    	}
    	return name;
    }

}
