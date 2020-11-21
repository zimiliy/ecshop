<%@ page language="java"  pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <title>用户注册</title>
    <style type="text/css">
        .box{
            width: 100%;
            height: 100%;
            background-color: aquamarine;
        }
        .register{
            margin-top: 200px;
            text-align: center;
        }
        h2
        {
            font-family: "微软雅黑";
            font-size: 40px;
            color:black;
        }
    </style>
</head>

<body style="background-color: aquamarine">
<div class="box">
    <form action="${pageContext.request.contextPath}/RegisterServlet" method="post">
        <div class="register">
            <h3 >
                注册
            </h3>
            <p>
                用户名:<input type="text" name="username"/>
            </p>
            <p>
                密&emsp;码:<input type="password" name="password"/>
            </p>
            <p>
                手机号:<input type="text" name="phone"/>
            </p>
            <p>
                年&emsp;龄:<input type="text" name="age"/>
            </p>
            <p>
                <input type="checkbox" name="sex" value="0" />男
                <input type="checkbox" name="sex" value="1" />女
            </p>
            <p>
                <input id="reg" type="submit" value="立即注册"/>
            </p>
            <p>
                ${requestScope.msg}
            </p>
            <p>
                已有账号？<a href="${pageContext.request.contextPath}/ToLoginServlet">请登录</a>
            </p>
        </div>
    </form>
</div>
</body>
</html>
