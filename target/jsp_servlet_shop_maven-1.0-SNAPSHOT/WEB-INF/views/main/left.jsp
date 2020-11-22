<%@ page language="java" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<title>菜单</title>
	<link href="${pageContext.request.contextPath}/resources/css/left.css" rel="stylesheet" type="text/css">
</head>
	<body>
		<table width="100" border="0" cellspacing="0" cellpadding="0">
		  <tr>
		    <td height="12"></td>
		  </tr>
		</table>
		<table width="100%" border="1">
			  <tr>
			  	<td><a href="${pageContext.request.contextPath}/ProductServlet" target="mainFrame" class="left_list">商品管理</a></td>
			  </tr>
			  <tr>
			  	<td><a href="${pageContext.request.contextPath}/OrderServlet" target="mainFrame" class="left_list">订单管理</a></td>
			  </tr>
            <tr>
                <td><a href="${pageContext.request.contextPath}/ToEditorServlet" target="mainFrame" class="left_list">个人信息管理</a></td>
            </tr>
		</table>
	</body>
</html>
