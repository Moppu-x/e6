<%@ page import="org.zuel.app.model.Patient" 
		 import="org.zuel.app.model.RegRecord"
		 import="org.zuel.app.service.PatientService"
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
    <title>病人主页——毛毯熊的医院管理系统</title>
    <style>
        body{
            background-image: url("pic/patient_home.png");
            background-size: 100%;
            background-attachment: fixed;
            text-align: center;
        }
        table {
            background-color: rgba(255, 254, 239, 0.6);
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
        .sel {
            width: 160px;
            height: 50px;
            font-size: 16px;
            text-align: center;           
            margin-right: 40px;
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
            color: #fffedf;
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
            color: #fffedf;
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
            color: #fffedf;
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
    </style>
</head>
<body>
<%
	Patient user = (Patient)session.getAttribute("user");
	List<RegRecord> list = (List<RegRecord>)session.getAttribute("record");
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
%>
<div class="block-1">
    <div class="block-main">
        <div class="block-head">
            <h3><%=user.getName()%>,您好!</h3>
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
                <p>年龄: <%=user.getAge() %></p>
            </div>
        </div>
        <div class="block-in">
            <div class="block-head">
                <h3>更多操作</h3>
            </div>
            <div class="blank">
                <form action="patientAction" method="post">
                    <button type="submit" class="btn" name="action" value="record">挂号</button>
                    <button type="submit" class="btn" name="action" value="refresh">刷新挂号记录</button>
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
                <h3>共查询到<%=list.size() %>条挂号记录</h3>   
            </div>
            <table>
                <tr>
                    <th>记录号</th>
                    <th>科室</th>
                    <th>挂号时间</th>
                    <th>挂号费(元)</th>
                </tr>
                <% if(list.size()>0){ %>
                	<% for(RegRecord item : list){ %>
                		<tr>
		                    <td><%=item.getId() %></td>
		                    <td><%=PatientService.getDeptName(item.getDeptId()) %></td>
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
	<% if(request.getAttribute("more")!=null && request.getAttribute("more").equals("add")) {%>
	    <div class="block-main-2">
	        <div class="block-head">
	            <h3>请选择科室进行挂号</h3>
	        </div>
	        <div class="blank">
	        	<form action="patientAction" method="post">
		            <select class="sel" name="deptId">
		                <option value="1">皮肤科</option>
			            <option value="2">精神科</option>
			            <option value="3">口腔科</option>
			            <option value="4">儿科</option>
			            <option value="5">内科</option>
			            <option value="6">外科</option>
			            <option value="7">中医科</option>
			            <option value="8">呼吸内科</option>
			            <option value="9">消化内科</option>
			            <option value="10">骨科</option>
			            <option value="11">肿瘤科</option>
			            <option value="12">血液科</option>
		            </select>               
	                <button type="submit" class="btn-2" name="action" value="addRecord">立即挂号</button>
	                <button type="submit" class="btn-2" name="action" value="cancelAdd">取消挂号</button>
	            </form>
	        </div>
	    </div>
	<% } %>

	<% if(request.getAttribute("addResult")!=null) {%>
	    <div class="block-main-2">
	        <div class="block-head">
	            <h3><%=request.getAttribute("msg") %></h3>
	        </div>
	        <% if(request.getAttribute("addResult").equals("success")){ %>
		        <div class="block-head">
		            <h4>本次挂号的信息</h4>
		        </div>
		        <div class="userinfo">
		        <% RegRecord newRecord = (RegRecord)request.getAttribute("newRecord"); %>
	                <p>记录号: <%=newRecord.getId() %></p>
	                <p>科室: <%=PatientService.getDeptName(newRecord.getDeptId()) %></p>
	                <p>挂号时间: <%=newRecord.getRegTime() %></p>
	                <p>挂号费: <%=newRecord.getPrice() %></p>
	            </div>
	            <div class="blank">
		            <form action="patientAction" method="post">
		                <button type="submit" class="btn-2" name="action" value="check">确定</button>
		            </form>
	        </div>
	        <% } %>
	        <% if(request.getAttribute("addResult").equals("fail")){ %>
		        <div class="block-head">
		            <h4>请返回重试</h4>
		        </div>
		        <div class="blank">
		            <form action="patientAction" method="post">
		                <button type="submit" class="btn-2" name="action" value="retry">返回重试</button>
		            </form>
		        </div>
	        <% } %>
	    </div>
    <% } %>
</div>
</body>
</html>
