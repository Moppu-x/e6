<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
    <title><%= request.getAttribute("regmsg") %>——毛毯熊的医院管理系统</title>
    <style>
        body{
            background-image: url("pic/background.png");
            background-size: 100%;
            text-align: center;
        }
        .form-main{
            margin: 220px auto;
            width: 550px;
            color: #fff;
        }
        .form-ceil {
            overflow: hidden;
            padding: 0 25px 15px 25px;
            background: rgba(0, 0, 0, 0.3);
            border-radius: 15px 15px 0 0;
            text-align: center;
        }
        .form-floor {
            overflow: hidden;
            padding: 0 25px 15px 25px;
            background: rgba(0, 0, 0, 0.3);
            border-radius:   0 0 15px 15px;
            text-align: center;
        }
        .form-group {
            margin-bottom: 15px;
            width: 100%;
            float: left;
            position: relative;
            margin-top: 10px;
            min-height: 1px;
            padding-left: 15px;
            padding-right: 15px;
            cursor: pointer;
        }
        a.button {
            -webkit-appearance: button;
            -moz-appearance: button;
            appearance: button;
            text-decoration: none;
            color: #fff;
            width: 42%;
            display: inline-block;
            height: 50px;
            padding: 0 20px;
            vertical-align: middle;
            margin-right: 25px;
            background: rgba(0,153,153,0.8);
            border: 0;
            font-family:  sans-serif;
            font-size: 20px;
            font-weight: 300;
            line-height: 50px;
            -moz-border-radius: 25px;
            -webkit-border-radius: 25px;
            border-radius: 25px;
        }
    </style>
</head>
<body>
    <div class="form-main">
        <div class="form-ceil">
            <h3 style="color: rgba(255, 255, 255, 0.88);font-size: 25px;">毛毯熊提示您: <%= request.getAttribute("regmsg") %> </h3>
        </div>
        <div class="form-floor">
            <% if(request.getAttribute("regmsg").equals("注册成功")){ %>
            	<h3 style="color: rgba(255, 255, 255, 0.88);font-size: 20px;">您的ID是: <%= request.getAttribute("userid") %> </h3>
            	<div class="form-group">
                    <a href="login.jsp" class="button">前往登录</a>
                </div>
            <% } %>
            <% if(request.getAttribute("regmsg").equals("注册失败")){ %>
            	<h3 style="color: rgba(255, 255, 255, 0.88);font-size: 20px;">请尝试重新注册或联系管理员</h3>
            	<div class="form-group">
                    <a href="index.jsp" class="button" >返回首页</a>
                </div>
            <% } %>
        </div>        
    </div>
</body>
</html>