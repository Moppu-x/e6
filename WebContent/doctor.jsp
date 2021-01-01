<%@ page import="org.zuel.app.model.Doctor" 
		 import="org.zuel.app.model.Dept" 
		 import="org.zuel.app.model.RegRecord"
		 import="org.zuel.app.service.PatientService"
		 import="org.zuel.app.service.DoctorService"
		 import="java.util.Date"
		 import="java.util.List"
		 import="java.text.SimpleDateFormat"
		 language="java" 
		 contentType="text/html; charset=UTF-8"
    	 pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
    <title>医生主页——毛毯熊的医院管理系统</title>
    <style>
        body{
            background-image: url("pic/doctor_home.png");
            background-size: 100%;
            background-attachment: fixed;
            text-align: center;
        }
        table {
            background-color: rgba(240, 248, 255, 0.6);
            border-radius: 8px;
            margin-bottom: 30px;
            border: 1px solid rgba(110, 185, 185, 0.8);
            border-collapse: collapse;
            margin-left: 22px;
        }
        table tr {
            height: 40px;
            border: 1px solid rgba(110, 185, 185, 0.8);
            border-collapse: collapse;
        }
        table tr th {
            width: 220px;
            font-size: 20px;
            color: rgba(13, 196, 196, 0.8);
            text-align: center;
        }
        table tr td {
            width: 220px;
            font-size: 18px;
            color:  rgba(78, 78, 78, 0.88);
            text-align: center;          
        }
        .block-1{
            margin: 40px auto;
            width: 420px;
            float: left;
            margin-left: 40px;
        }
        .block-2{
            margin: 40px auto;
            width: 985px;
            float: left;
            margin-left: 40px;
        }
        .block-main {
            overflow: hidden;
            padding: 0 25px 15px 25px;
            background: rgba(0, 0, 0, 0.3);
            border-radius: 18px;
            text-align: left;
        }
        .block-main-2 {
            overflow: hidden;
            padding: 0 25px 15px 25px;
            background: rgba(0, 0, 0, 0.3);
            border-radius: 18px;
            text-align: left;
            margin-top: 40px;
        }
        .block-in {
            text-align: left;
        }
        .block-head {
            width: 100%;
            padding-top: 12px;
        }
        .block-head h3 {
            margin-top: 12px;
            font-size: 25px;
            color: rgba(255, 255, 255, 0.88);
        }
        .block-head h4 {
            margin-top: 3px;
            font-size: 20px;
            color: rgba(255, 255, 255, 0.88);
        }
        .userinfo {
            margin: 10px;
            font-size: 16px;
        }
        .userinfo p{
            margin: 16px;
            font-size: 18px;
            font-family: sans-serif;
            color: aliceblue;
        }
        .blank {
            width: 90%;
            float: left;
            position: relative;
            margin-top: 10px;
            margin-bottom: 10px;
            min-height: 1px;
            padding-left: 45px;
            padding-right: 15px;
        }
        .btns {
            width: 90%;
            float: left;
            position: relative;
            margin-top: 10px;
            margin-bottom: 10px;
            min-height: 1px;
        }
        .sel {
            width: 160px;
            height: 50px;
            font-size: 16px;
            text-align: center;           
            margin-right: 40px;
            margin-bottom: 20px;
            border-radius: 5px;
        }
        .btn {
            width: 50%;
            display: inline-block;
            height: 50px;
            padding: 0 20px;
            vertical-align: middle;
            margin-left: 50px;
            margin-bottom: 15px ;
            background: rgba(0,153,153,0.8);
            border: 0;
            font-family:  sans-serif;
            font-size: 20px;
            font-weight: 350;
            line-height: 50px;
            color: #fff;
            -moz-border-radius: 25px;
            -webkit-border-radius: 25px;
            border-radius: 25px;
            cursor: pointer;
        }
        .btn-2 {
            width: 30%;
            display: inline-block;
            height: 50px;
            padding: 0 20px;
            vertical-align: middle;
            background: rgba(0,153,153,0.8);
            border: 0;
            font-family:  sans-serif;
            font-size: 20px;
            font-weight: 350;
            line-height: 50px;
            color: #fff;
            -moz-border-radius: 25px;
            -webkit-border-radius: 25px;
            border-radius: 25px;
            cursor: pointer;
        }
        a.button {
            -webkit-appearance: button;
            -moz-appearance: button;
            appearance: button;
            text-decoration: none;
            color: #fff;
            width: 20%;
            display: inline-block;
            height: 50px;
            padding: 0 10px;
            margin-left: 35px;
            background: rgba(0,153,153,0.8);
            border: 0;
            font-family:  sans-serif;
            font-size: 18px;
            font-weight: 350;
            text-align: center;
            line-height: 50px;
            -moz-border-radius: 25px;
            -webkit-border-radius: 25px;
            border-radius: 25px;
        }
        .finput{
            display: block;
            width: 50%;
            height: 50px;
            margin-bottom: 15px;
            padding: 0 20px;
            background: rgba(255,255,255,0.6);
            border: 1px solid #cccccc;
            font-family:  sans-serif;
            font-size: 18px;
            font-weight: 400;
            line-height: 50px;
            color: rgba(0,153,153,0.8);
            border-radius: 8px;
            -moz-box-shadow: none;
            -webkit-box-shadow: none;
            box-shadow: none;
            -o-transition: all .3s;
            -moz-transition: all .3s;
            -webkit-transition: all .3s;
            transition: all .3s;
        }
        .dinput{
            display: block;
            width: 50%;
            height: 50px;
            margin-bottom: 15px;
            margin-left: 15px;
            padding: 0 20px;
            background: rgba(255,255,255,0.6);
            border: 1px solid #cccccc;
            font-family:  sans-serif;
            font-size: 18px;
            font-weight: 400;
            line-height: 50px;
            color: rgba(0,153,153,0.8);
            border-radius: 8px;
            -moz-box-shadow: none;
            -webkit-box-shadow: none;
            box-shadow: none;
            -o-transition: all .3s;
            -moz-transition: all .3s;
            -webkit-transition: all .3s;
            transition: all .3s;
        }
        .lab {
            position: absolute;
            height: 10px;
            padding: 0;
            color: #fff;
            border: 0;
        }
        .blank p{
            color: rgba(255, 255, 255, 0.88);
            font-size: 18px;
            margin-top: 0;
            margin-bottom: 3px;
        }
    </style>
</head>
<body>
<%
	Doctor user = (Doctor)session.getAttribute("user");
	List<RegRecord> list = (List<RegRecord>)session.getAttribute("record");
    Dept dept = DoctorService.getDept(user);
    session.setAttribute("dept",dept);
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
%>
<div class="block-1">
    <div class="block-main">
        <div class="block-head">
            <h3><%=user.getName()%>医生,您好!</h3>
        </div>
        <div class="block-in">
            <div class="block-head">
                <h3>个人信息</h3>
            </div>
            <div class="userinfo">
                <p>姓名: <%=user.getName() %></p>
                <p>ID&nbsp;&nbsp;&nbsp;: <%=user.getId() %></p>
                <p>性别: 
                    <% if(user.getSex()==0) { %>
                        <%="男" %>
                    <% } else { %>
                        <%="女" %>
                    <% } %>
                </p>
                <p>科室: <%=DoctorService.getDeptName(user) %></p>
            </div>
        </div>
        <div class="block-in">
            <div class="block-head">
                <h3>更多操作</h3>
            </div>
            <div class="blank">
                <form action="doctorAction" method="post">
                    <button type="submit" class="btn" name="action" value="filter">筛选挂号记录</button>
                    <button type="submit" class="btn" name="action" value="refresh">刷新挂号记录</button>
                    <button type="submit" class="btn" name="action" value="deptinfo">科室信息</button>
                    <button type="submit" class="btn" name="action" value="logout">退出登录</button>
                </form>
            </div>
        </div>
    </div>
</div>
<div class="block-2">
    <div class="block-main">
        <div class="block-head">
            <h3>毛毯熊提示您：今天是<%=sdf.format(new Date()) %></h3>
        </div>
        <div class="block-in">
            <div class="block-head">
                <h3><%=DoctorService.getDeptName(user) %>共查询到<%=list.size() %>条挂号记录</h3>   
            </div>
            <table>
                <tr>
                    <th>记录号</th>
                    <th>姓名</th>
                    <th>挂号时间</th>
                    <th>挂号费(元)</th>
                </tr>
                <% if(list.size()>0){ %>
                	<% for(RegRecord item : list){ %>
                		<tr>
		                    <td><%=item.getId() %></td>
		                    <td><%=PatientService.getPatientName(item.getPatientId()) %></td>
		                    <td><%=item.getRegTime() %></td>
		                    <td><%=item.getPrice() %></td>
	                	</tr>
                	<% } %>
                <% } else { %>
	                <tr>
	                    <td></td>
	                    <td></td>
	                    <td></td>
	                    <td></td>
	                </tr>
	            <% } %>
            </table>
        </div>
    </div>
	<% if(request.getAttribute("more")!=null && request.getAttribute("more").equals("filter")) {%>
	    <div class="block-main-2">
	        <div class="block-head">
	            <h3>请选择筛选条件</h3>
	        </div>
	        <div class="blank">
	        	<form action="doctorAction" method="post">
		            <select class="sel" name="condition">
		                <option value="all">所有</option>
			            <option value="date">日期</option>
			            <option value="id">记录号</option>
		            </select>
                    <div>
                        <p>请输入条件</p>
                        <input type="text" name="fvalue" class="finput"  />
                    </div>
                    <div class="btns">          
                        <button type="submit" class="btn-2" name="action" value="doFilter">立即筛选</button>
                        <button type="submit" class="btn-2" name="action" value="endFilter">取消筛选</button>
                    </div>
	            </form>
	        </div>
            <% if(request.getAttribute("filterType")!=null){ %>
                <div class="blank">
                    <div class="block-head">
                        <h4>当前筛选条件： 
                            <%=request.getAttribute("filterType") %> <%=request.getAttribute("filterValue")%>
                        </h4>
                    </div>
                </div>
            <% } %>
	    </div>
	<% } %>

	<% if(request.getAttribute("more")!=null && request.getAttribute("more").equals("dept")) { %>
	    <% if(request.getAttribute("editState")==null){ %>
            <div class="block-main-2">
    	        <div class="block-head">
    	            <h3><%=dept.getName() %></h3>
    	        </div>
    		    <div class="userinfo">
    	            <p>科室ID: <%=dept.getId() %></p>
    	            <p>类&nbsp;&nbsp;型: <% if(dept.getType()==0) {
                                    out.print("门诊部");
                                }
                                else {
                                    out.print("住院部");
                                } %>
                    </p>
    	            <p>简&nbsp;&nbsp;介: <%=dept.getRemark() %></p>
    	        </div>
                <div class="blank">
    		        <form action="doctorAction" method="post">
                        <div class="btns">
    		                <button type="submit" class="btn-2" name="action" value="editInfo">修改信息</button>
                            <button type="submit" class="btn-2" name="action" value="return">返回</button>                       
    		            </div>
                    </form>
    	        </div>
    	    </div>
        <% } %>
        <% if(request.getAttribute("editState")!=null && request.getAttribute("editState").equals("inEdit")){ %>
            <div class="block-main-2">
                <div class="block-head">
                    <h3>修改信息</h3>
                </div>
                <form action="doctorAction" method="post">
                <div class="userinfo">                 
                    <p>科室名: <%=dept.getName() %></p>
                    <p>科室ID: <%=dept.getId() %></p>
                    <p>类&nbsp;&nbsp;&nbsp;型: <% if(dept.getType()==0) {
                                    out.print("门诊部");
                                }
                                else {
                                    out.print("住院部");
                                } %>
                    </p>
                    <div>
                        <p>请输入简介</p>
                        <input type="text" name="dvalue" class="dinput" />
                    </div>
                </div>
                    <div class="blank">                   
                        <div class="btns">
                            <button type="submit" class="btn-2" name="action" value="checkEdit">确定修改</button>
                            <button type="submit" class="btn-2" name="action" value="cancelEdit">取消</button>
                        </div>                    
                </div>
                </form>
            </div>
        <% } %>
    <% } %>
</div>
</body>
</html>