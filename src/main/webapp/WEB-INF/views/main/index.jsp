<%@ page language="java"  pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <title>主页</title>
    <link rel="icon" href="/resources/images/bag.png" type="image/x-icon" />
</head>

<body>
    <p>${requestScope.loginUser.username}</p>
    <a href="${pageContext.request.contextPath}/ToEditorServlet" >我要改密码</a>
    <a href="${pageContext.request.contextPath}/LoginOutServlet" >退出</a>
</body>
</html>
