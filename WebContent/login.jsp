<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>用户登录——毛毯熊的医院管理系统</title>
    <style>
        body{
            background-image: url("pic/background.png");
            background-size: 100%;
            text-align: center;
        }
        .form-main{
            margin: 180px auto;
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
            margin-top: 10px;
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
            width: 120px;
            height: 50px;
            font-size: 16px;
        }
        .btn {
            width: 50%;
            display: inline-block;
            height: 50px;
            padding: 0 20px;
            vertical-align: middle;
            margin-left: 50px;
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
        .reg {
            float: right;
            font-size: 16px;
        }
        .msg {
        	float: left;
            position: relative;
            margin-top: 10px;
            margin-bottom: 10px;
            padding-left: 45px;
            /*padding-right: 15px;*/
            font-size: 16px;
            color: #ff0000;
        }
    </style>
</head>
<body>
<div class="form-main">
    <div class="form-ceil">
        <div class="form-ceil-left">
            <h3 style="color: rgba(255, 255, 255, 0.88);">用户登录</h3>
        </div>
        <form role="form" action="userLogin" method="post">
            <div class="form-group blank">
                <label class="lab" ></label>ID<input
                    style="font-weight: bold" type="text" name="ID"
                    id="ID" class="form-control" required  />
            </div>
            <div class="form-group blank">
                <label class="lab" >password</label>密码<input
                    style="font-weight: bold" type="password" name="password"
                    id="password" class="form-control" required />
            </div>
            <div class="form-group blank">
                <select class="sel" name="select-type">
                    <option value="patient">病人</option>
                    <option value="doctor">医生</option>
                </select>
                <button type="submit" class="btn">登录</button>
            </div>
        </form>
        <% if(request.getAttribute("errMsg")!=null){ %>
	        <span class="msg"><%=request.getAttribute("errMsg") %></span>
	    <% } %>
        <span><a href="register.jsp" class="reg">注册</a></span>
    </div>
</div>
</body>
</html>
