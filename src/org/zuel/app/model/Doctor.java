package org.zuel.app.model;

import java.util.Scanner;

public class Doctor {
    //医生类;
    private int id;
    private int sex;        //0表示男，1表示女;
    private int dept_id;
    private String name;
    private String password;

    public Doctor() {}
    public Doctor(int id,String name,int sex,int dept_id,String password) {
        this.id = id;
        this.name = name;
        this.sex = sex;
        this.dept_id = dept_id;
        this.password = password;
    }

    //各个属性的getter和setter方法;
    public int getId() {
        return id;
    }
    public void setId(int id) {
        this.id = id;
    }
    public int getSex() {
        return sex;
    }
    public void setSex(int sex) {
        this.sex = sex;
    }
    public int getDeptId() {
        return dept_id;
    }
    public void setDeptId(int dept_id) {
        this.dept_id = dept_id;
    }
    public String getName() {
        return name;
    }
    public void setName(String name) {
        this.name = name;
    }
    public String getPassword() {
        return password;
    }
    public void setPassword(String password) {
        this.password = password;
    }

    //setAll()方法获取输入并赋值给各属性;
    public void setAll(Scanner input) {
        System.out.println("Input the attributes of doctor");
        System.out.print("id: ");
        setId(input.nextInt());
        System.out.print("sex(0 for male, 1 for female): ");
        setSex(input.nextInt());
        System.out.print("department id: ");
        setDeptId(input.nextInt());
        System.out.print("name: ");
        setName(input.next());
        System.out.print("password: ");
        setPassword(input.next());
        System.out.println("Inputs for doctor done.");
    }

    //重写toString()方法;
    public String toString() {
        return "Doctor: id: "+id+" name: "+name+" sex: "+sex+" department id: "+dept_id;
    }
}
