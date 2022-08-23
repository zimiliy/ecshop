<%@ page language="java"  pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <title>パスワード更新</title>
    <style type="text/css">
        .box_editPassword{
            width: 100%;
            height: 100%;
            background-color: aquamarine;
        }
        .editPassword{
            margin-top: 200px;
            text-align: center;
        }
        h2
        {
            font-family: "微软雅黑";
            font-size: 40px;
            color:black;
            text-align: center;
        }
    </style>
</head>

<body style="background-color: aquamarine">
    <div class="box_editPassword">
        <form action="${pageContext.request.contextPath}/ResetPasswordServlet" method="post" >
            <div class="editPassword">
                <h3>
                    パスワード更新
                </h3>
                <p>
                    ユーザー名:<input type="text" id="" name="username"/>
                </p>
                <p>
                    パスワード:<input type="password" id="password" name="password"/>
                </p>
                <p>
                    新 パスワード:<input type="password"  name="newPassword"/>
                </p>
                <p>
                    パスワード確認:<input type="password" name="newPasswordTwo"/>
                </p>
                <p style="color: red">
                    ${requestScope.msg}
                </p>
                <p>
                    <input id=log type="submit" value="確定更新" />
                </p>
            </div>
        </form>
    </div>
</body>
</html>
