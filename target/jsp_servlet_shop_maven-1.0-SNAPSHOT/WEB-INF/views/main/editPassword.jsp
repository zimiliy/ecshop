<%@ page language="java"  pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <title>修改密码</title>
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
                    修改密码
                </h3>
                <p>
                    用 户 名:<input type="text" id="" name="username"/>
                </p>
                <p>
                    旧 密 码:<input type="password" id="password" name="password"/>
                </p>
                <p>
                    新 密 码:<input type="password"  name="newPassword"/>
                </p>
                <p>
                    确认密码:<input type="password" name="newPasswordTwo"/>
                </p>
                <p style="color: red">
                    ${requestScope.msg}
                </p>
                <p>
                    <input id=log type="submit" value="确认修改" />
                </p>
            </div>
        </form>
    </div>
</body>
</html>
