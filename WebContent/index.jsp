<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
    <title>毛毯熊的医院管理系统</title>
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
        }
        .btn {
            width: 50%;
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
            color: #fffedf;
            -moz-border-radius: 25px;
            -webkit-border-radius: 25px;
            border-radius: 25px;
            cursor: pointer;
        }
    </style>
</head>
<body>
    <div class="form-main">
        <div class="form-ceil">
            <h3 style="color: rgba(255, 255, 255, 0.88);font-size: 25px;">欢迎使用毛毯熊的医院管理系统</h3>
        </div>
        <div class="form-floor">
            <form role="form" action="index" method="POST">
                <div class="form-group">
                    <button type="submit" class="btn" name="action" value="login">登录</button>
                </div>
                <div class="form-group">
                    <button type="submit" class="btn" name="action" value="reg_patient">新病人注册</button>
                </div>
                <div class="form-group">
                    <button type="submit" class="btn" name="action" value="reg_doctor">新医生注册</button>
                </div>
            </form>
        </div>        
    </div>
</body>
</html>