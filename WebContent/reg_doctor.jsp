<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
    <title>新医生注册——毛毯熊的医院管理系统</title>
    <style>
        body{
            background-image: url("pic/background.png");
            background-size: 100%;
            text-align: center;
        }
        .form-main{
            margin: 75px auto;
            width: 550px;
            color: #fff;
        }
        .form-main a{
            color: rgba(255, 255, 255, 1);
            text-decoration: none;
        }
        .form-ceil {
            overflow: hidden;
            padding: 0 25px 15px 25px;
            background: rgba(0, 0, 0, 0.3);
            border-radius: 15px;
            text-align: left;
        }
        .form-ceil-left {
            float: left;
            width: 75%;
            padding-top: 25px;
        }
        .form-ceil-left h3 {
            margin-top: 0;
            color: #969696;
        }
        .form-ceil-left p {
            opacity: 0.8;
            color: #fff;
        }
        .form-group {
            margin-bottom: 15px;
        }
        .blank {
            width: 90%;
            float: left;
            position: relative;
            min-height: 1px;
            padding-left: 45px;
            padding-right: 15px;
        }
        .lab {
            position: absolute;
            width: 1px;
            height: 1px;
            margin: -1px;
            padding: 0;
            overflow: hidden;
            clip: rect(0, 0, 0, 0);
            border: 0;
        }
        input[type="text"], input[type="password"], textarea, textarea.form-control {
            display: block;
            width: 80%;
            height: 50px;
            margin: 0;
            padding: 0 20px;
            background: #fff;
            border: 1px solid #cccccc;
            font-family:  sans-serif;
            font-size: 18px;
            font-weight: 300;
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
        .sel {
            width: 160px;
            height: 50px;
            font-size: 16px;
            border-radius: 10px;
        }
        .btn {
            width: 50%;
            display: inline-block;
            height: 50px;
            padding: 0 20px;
            vertical-align: middle;
            margin-left: 80px;
            background: rgba(0,153,153,0.8);
            border: 0;
            font-family:  sans-serif;
            font-size: 20px;
            font-weight: 300;
            line-height: 50px;
            color: #fff;
            -moz-border-radius: 25px;
            -webkit-border-radius: 25px;
            border-radius: 25px;
            cursor: pointer;
        }
        .login{
            float: right;
        }
    </style>
</head>
<body>
	<div class="form-main">
	    <div class="form-ceil">
	        <div class="form-ceil-left">
	            <h3 style="color: rgba(255, 255, 255, 0.88);">新医生注册</h3>
	        </div>
	        <form role="form" action="Reg" method="post">
                <input type="hidden" name="usertype" value="doctor" >
	            <div class="form-group blank">
	                <label class="lab">sex</label>性别
                    <select class="sel" name="usersex">
                        <option value="0">男</option>
                        <option value="1">女</option>
                    </select>
                    <label class="lab">dept</label>科室
	                <select class="sel" name="dept">
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
	            </div>
	            <div class="form-group blank">
	                <label class="lab">name</label>姓名<input
	                    style="font-weight: bold" type="text" name="username"
	                    id="userName" class="form-control" required />
	            </div>
	            <div class="form-group blank">
	                <label class="lab" >password</label>密码<input
	                    style="font-weight: bold" type="password" name="password"
	                    class="form-password form-control" id="pwd1" required />
	            </div>
	            <div class="form-group blank">
	                <label class="lab" >pwdCheck</label>确认密码<input
	                    style="font-weight: bold" type="password"
	                    name="pwdCheck" class="form-control "
	                    id="pwd2" required onkeyup="checkPwd()" />
                    <span id="warning"></span>
	            </div>
	            <div class="form-group blank">
	                <button type="submit" class="btn" id="btn">注册</button>
	            </div>
	        </form>
	        <span><a href="login.jsp" class="login">登录</a></span>
	    </div>
	</div>
    <script type="text/javascript">
        function checkPwd() {
            var pwd1 = document.getElementById("pwd1").value;
            var pwd2 = document.getElementById("pwd2").value;
            if (pwd1!=pwd2) {
                document.getElementById("warning").innerHTML="两次密码不一致";
                document.getElementById("btn").disable=true;
            } else {
                document.getElementById("warning").innerHTML="";
                document.getElementById("btn").disable=false;
            }
        }
    </script>
</body>
</html>
