<%@ page language="java"  pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <title>用户注册</title>
<%--    <style type="text/css">--%>
<%--        .box{--%>
<%--            width: 100%;--%>
<%--            height: 100%;--%>
<%--            background-color: aquamarine;--%>
<%--        }--%>
<%--        .register{--%>
<%--            margin-top: 200px;--%>
<%--            text-align: center;--%>
<%--        }--%>
<%--        h2--%>
<%--        {--%>
<%--            font-family: "微软雅黑";--%>
<%--            font-size: 40px;--%>
<%--            color:black;--%>
<%--        }--%>
<%--    </style>--%>
</head>

<body style="background-color: aquamarine">
<div class="box">
    <form action="${pageContext.request.contextPath}/RegisterServlet" method="post">
        <div class="register">
            <h3 >
                登録
            </h3>
            <p>
                ユーザー名:<input type="text" name="username"/>
            </p>
            <p>
                パスワード:<input type="password" name="password"/>
            </p>
            <p>
                メールアドレス:<input type="text" name="phone"/>
            </p>
            <p>
                年　齢:<input type="text" name="age"/>
            </p>
            <p>
                <input type="checkbox" name="sex" value="0" />男
                <input type="checkbox" name="sex" value="1" />女
            </p>
            <p>
                <input id="reg" type="submit" value="登録"/>
            </p>
            <p>
                ${requestScope.msg}
            </p>
            <p>
                アカウントを持っています？<a href="${pageContext.request.contextPath}/ToLoginServlet">ログイン</a>
            </p>
        </div>
    </form>
</div>
</body>
</html>
