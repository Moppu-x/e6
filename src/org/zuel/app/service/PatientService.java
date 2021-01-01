package org.zuel.app.service;

import java.util.Date;
import java.util.List;
import java.util.Scanner;
import java.text.SimpleDateFormat;

import org.zuel.app.dao.PatientDao;
import org.zuel.app.dao.RegRecordDao;
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

    //createPatient()方法用于新建Patient对象并写入数据库;
    public static Patient createPatient(Scanner in) {
        Patient patient = new Patient();
        patient.setAll(in);
        PatientDao.insertPatient(patient);
        List<Patient> p = 
        PatientDao.getPatient(null, patient.getName(), patient.getSex(), patient.getAge(), patient.getPassword());
        patient = p.get(0);
        return patient;
    }
    
    public static Patient newPatient (String name, int sex, String passwd, int age) {
		PatientDao.insertPatient(null, name, sex, age, passwd);
		List<Patient> p = PatientDao.getPatient(null, name, sex, age, passwd);
    	Patient patient = p.get(0);
    	return patient;   	
    }
    
    //getDeptName方法根据科室id返回科室名
    public static String getDeptName(int deptId) {
    	String deptName="";
    	switch(deptId) {
    		case 1:
    			deptName = "皮肤科";
    			break;
    		case 2:
    			deptName = "精神科";
    			break;
    		case 3:
    			deptName = "口腔科";
    			break;
    		case 4:
    			deptName = "儿科";
    			break;
    		case 5:
    			deptName = "内科";
    			break;
    		case 6:
    			deptName = "外科";
    			break;
    		case 7:
    			deptName = "中医科";
    			break;
    		case 8:
    			deptName = "呼吸内科";
    			break;
    		case 9:
    			deptName = "消化内科";
    			break;
    		case 10:
    			deptName = "骨科";
    			break;
    		case 11:
    			deptName = "肿瘤科";
    			break;
    		case 12:
    			deptName = "血液科";
    			break;
    		default:
    			break;
    	}
    	return deptName;
    }
    
    public static String getPatientName(int id) {
		String name = null;
		List<Patient> list = PatientDao.getPatient(id, null, null, null, null);
		if(list.size()>0) {
			name=list.get(0).getName();
		}
    	return name;
    }
}
