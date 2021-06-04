<%@ page language="java" pageEncoding="utf-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <title>用户登录</title>
    <link rel="icon" type="image/x-icon" href="${pageContext.request.contextPath}/resources/images/favicon.ico"/>
    <style type="text/css">
        .box_login {
            width: 100%;
            height: 100%;
            background-color: aquamarine;
        }

        .login {
            margin-top: 200px;
            text-align: center;
        }

        h2 {
            font-family: "微软雅黑";
            font-size: 40px;
            color: black;
            text-align: center;
        }
    </style>
</head>

<body style="background-color: aquamarine">
<div class="box_login">
    <form action="${pageContext.request.contextPath}/LoginServlet" method="post">
        <div class="login">
            <h3>
                登录
            </h3>
            <p>
                用户名:<input type="text" name="username"/>
            </p>
            <p>
                密&emsp;码:<input type="password" name="password"/>
            </p>
            <p>
                <input type="checkbox" name="role" value="customer"/>用户
                <input type="checkbox" name="role" value="role"/>管理员
            </p>
            <p>
                <input id="log" type="submit" value="登录"/>
            </p>
            <p style="color: red">
                ${requestScope.msg}
            </p>
            <p>
                还没有账号？<a href="${pageContext.request.contextPath}/ToRegisterServlet">立即注册</a>
            </p>
        </div>
    </form>
</div>
</body>
</html>
