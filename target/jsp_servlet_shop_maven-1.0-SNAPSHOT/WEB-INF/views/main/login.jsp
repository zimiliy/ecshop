<%@ page language="java" pageEncoding="utf-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <title>ログイン</title>
    <link rel="icon" type="image/x-icon" href="${pageContext.request.contextPath}/resources/images/favicon.ico"/>
<%--    <style type="text/css">--%>
<%--        .box_login {--%>
<%--            width: 100%;--%>
<%--            height: 100%;--%>
<%--            background-color: aquamarine;--%>
<%--        }--%>

<%--        .login {--%>
<%--            margin-top: 200px;--%>
<%--            text-align: center;--%>
<%--        }--%>

<%--        h2 {--%>
<%--            font-family: "微软雅黑";--%>
<%--            font-size: 40px;--%>
<%--            color: black;--%>
<%--            text-align: center;--%>
<%--        }--%>
<%--    </style>--%>
</head>

<body style="background-color: aquamarine">
<div class="box_login">
    <form action="${pageContext.request.contextPath}/LoginServlet" method="post">
        <div class="login">
            <h3>
                ログイン
            </h3>
            <p>
                ユーザー名:<input type="text" name="username"/>
            </p>
            <p>
                パスワード:<input type="password" name="password"/>
            </p>
            <p>
                <input type="radio" name="role" value="customer"/>ユーザー
                <input type="radio" name="role" value="role"/>管理者
            </p>
            <p>
                <input id="log" type="submit" value="ログイン"/>
            </p>
            <p style="color: red">
                ${requestScope.msg}
            </p>
            <p>
                アカウントまた持っていません？<a href="${pageContext.request.contextPath}/ToRegisterServlet">さっそく登録</a>
            </p>
        </div>
    </form>
</div>
</body>
</html>
