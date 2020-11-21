<%@ page language="java" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
	<meta http-equiv="Content-Language" content="zh-cn">
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link href="${pageContext.request.contextPath}/resources/css/Style.css" type="text/css" rel="stylesheet" />
<style type="text/css">
</style>
<style>
BODY {SCROLLBAR-FACE-COLOR: #cccccc; SCROLLBAR-HIGHLIGHT-COLOR: #ffffFF; SCROLLBAR-SHADOW-COLOR: #ffffff; SCROLLBAR-3DLIGHT-COLOR: #cccccc; SCROLLBAR-ARROW-COLOR:  #ffffff; SCROLLBAR-TRACK-COLOR: #ffffFF; SCROLLBAR-DARKSHADOW-COLOR: #cccccc; }
</style>
</head>
<body style="background-color: #afd1f3;">
<form name="Form1" method="post" id="Form1" >
	<table width="100%" border="0" height="88" background="${pageContext.request.contextPath}/resources/images/back1.jpg">
		<tr>
			<td colspan=3 class="ta_01" align="center" bgcolor="#f59f1d"><strong>系统首页</strong></td>
		</tr>
		<tr>
			<td width="65%" height="84" align="center" valign="top" >
				<br />
                <span class="size:48;">登录成功！欢迎你：<p>${requestScope.loginUser.username}</p></span>
			</td>
		</tr>
		<tr><td height=2></td></tr>	
	</table>
	</form>
</body>
</html>