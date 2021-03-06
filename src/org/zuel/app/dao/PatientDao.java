package org.zuel.app.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.zuel.app.model.Patient;
import org.zuel.app.myutils.DbUtil;

public class PatientDao {
    //PatientDao实现对数据表patient的增删改查;
    //insertPatient()增加数据;
    public static void insertPatient(Integer id,String name,Integer sex,Integer age,String password) {
        try {
            //定义插入数据的sql语句;
        	String sql = "INSERT INTO patient VALUES(";
        	if(id!=null){
                sql+=id+",";
            }
        	else{ sql+="null,"; }
            if(name!=null){
                sql+="'"+name+"',";
            }
            else{ sql+="null,"; }
            if(sex!=null){
                sql+=sex+",";
            }
            else{ sql+="null,"; }
            if(age!=null){
                sql+=age+",";
            }
            else{ sql+="null,"; }
            if(password!=null){
                sql+="'"+password+"'";
            }
            else{ sql+="null"; }
            sql+=")";
            //创建connection和statement;
            Connection conn = DbUtil.getConn();
            PreparedStatement pst = conn.prepareStatement(sql);
            //执行语句;
            pst.executeUpdate();

            //关闭连接和statement;
            DbUtil.close(pst, conn);
        } catch (SQLException e) {
            System.out.println("Something went wrong...");
            e.printStackTrace();
        }
    }
    public static void insertPatient(Patient patient) {
        //根据对象将记录插入数据表;
        try {
            //定义插入数据的sql语句;
            final String sql = "INSERT INTO patient VALUES(?,?,?,?,?)";
            //创建connection和statement;
            Connection conn = DbUtil.getConn();
            PreparedStatement pst = conn.prepareStatement(sql);
            //设置preparedstatement的参数;
            pst.setInt(1, patient.getId());
            pst.setString(2, patient.getName());
            pst.setInt(3, patient.getSex());
            pst.setInt(4, patient.getAge());
            pst.setString(5, patient.getPassword());
            //执行语句;
            int rs = pst.executeUpdate();
            if(rs>0){
                System.out.println("Insertion complete.");
            }
            else{
                System.out.println("Insertion failed.");
            }
            //关闭连接和statement;
            DbUtil.close(pst, conn);
        } catch (SQLException e) {
            System.out.println("Something went wrong...");
            e.printStackTrace();
        }
    }

    //deletePatient()删除数据;
    public static void deletePatient(int id) {
        //根据id删除数据表中对应的记录;
        try {
            //定义删除数据的sql语句;
            final String sql = "DELETE FROM patient WHERE id=?";
            //创建connection和statement;
            Connection conn = DbUtil.getConn();
            PreparedStatement pst = conn.prepareStatement(sql);
            //设置preparedstatement的参数;
            pst.setInt(1, id);
            //执行语句;
            int rs = pst.executeUpdate();
            if(rs>0){
                System.out.println("Deletion complete.");
            }
            else{
                System.out.println("Deletion failed.");
            }
            //关闭连接和statement;
            DbUtil.close(pst, conn);
        } catch (SQLException e) {
            System.out.println("Something went wrong...");
            e.printStackTrace();
        }
    }

    //updatePatient()修改password;
    public static void updatePatient(int id,String password) {
        //根据id修改password;
        try {
            //定义修改数据的sql语句;
            final String sql = "UPDATE patient SET password=? WHERE id=?";
            //创建connection和statement;
            Connection conn = DbUtil.getConn();
            PreparedStatement pst = conn.prepareStatement(sql);
            //设置preparedstatement的参数;
            pst.setString(1, password);
            pst.setInt(2, id);
            //执行语句;
            int rs = pst.executeUpdate();
            if(rs>0){
                System.out.println("Update complete.");
            }
            else{
                System.out.println("Update failed.");
            }
            //关闭连接和statement;
            DbUtil.close(pst, conn);
        } catch (SQLException e) {
            System.out.println("Something went wrong...");
            e.printStackTrace();
        }
    }

    //execute()方法用于执行查询的sql语句;
    private static List<Patient> execute(String sql) throws SQLException{
        List<Patient> patientlist = new ArrayList<>();
        Patient patient;
        //创建连接、statement和resultset;
        Connection conn = DbUtil.getConn();
        PreparedStatement pst = conn.prepareStatement(sql);
        ResultSet rs = pst.executeQuery();
        //将结果集存放到patientlist集合中;
        while (rs.next()) {
            patient = new Patient();
            patient.setId(rs.getInt("id"));
            patient.setName(rs.getString("name"));
            patient.setSex(rs.getInt("sex"));
            patient.setAge(rs.getInt("age"));
            patient.setPassword(rs.getString("password"));
            patientlist.add(patient);
        }
        //关闭资源;
        DbUtil.close(rs, pst, conn);
        return patientlist;
    }

    //getPatient()查询病人数据;
    public static List<Patient> getPatient(Integer id,String name,Integer sex,Integer age,String password ) {
        //查询数据，返回一个Patient集合;
        List<Patient> patientlist = new ArrayList<>();
        try {
            //定义查询语句：
            String sql = "SELECT * FROM patient WHERE 1=1";
            if(id!=null){
                sql+=" and id="+id;
            }
            if(name!=null){
                sql+=" and name= '"+name+"'";
            }
            if(sex!=null){
                sql+=" and sex="+sex;
            }
            if(age!=null){
                sql+=" and age="+age;
            }
            if(password!=null){
                sql+=" and password= '"+password+"' ";
            }
            patientlist = execute(sql);
        } catch (Exception e) {
            System.out.println("Something went wrong...");
            e.printStackTrace();
        }
        return patientlist;
    }

}
