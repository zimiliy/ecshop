<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>商城</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/client/css/main.css" type="text/css" />
    <link rel="icon" type="image/x-icon" href="${pageContext.request.contextPath}/resources/images/favicon.ico"/>
</head>
<body class="main">
	<jsp:include page="../head.jsp" />
	<jsp:include page="../menu_search.jsp" />
	<div id="divpagecontent">
		<table width="100%" border="0" cellspacing="0">
			<tr>
				<td width="25%">
					<table width="100%" border="0" cellspacing="0"
						style="margin-top:30px">
						<tr>
							<td class="listtitle">我的帐户</td>
						</tr>
						<tr>
							<td class="listtd">
								<img src="${pageContext.request.contextPath }/resources/client/images/icon1.png" width="15" height="10" />&nbsp;&nbsp;&nbsp;&nbsp;
								<a href="${pageContext.request.contextPath }/ToEditorCustomerServlet">用户信息修改</a>
							</td>
						</tr>
						<tr>
							<td class="listtd">
								<img src="${pageContext.request.contextPath }/resources/client/images/icon2.png" width="15" height="10" />&nbsp;&nbsp;&nbsp;&nbsp;
                                <a href="${pageContext.request.contextPath}/QueryOrderServlet?id=${user.uid}">订单查询</a>
							</td>
						</tr>
						<tr>
							<td class="listtd">
								<img src="${pageContext.request.contextPath }/resources/client/images/icon3.png" width="15" height="10" />&nbsp;&nbsp;&nbsp;&nbsp;
								<a href="${pageContext.request.contextPath}/LoginOutServlet">用戶退出</a>
							</td>
						</tr>
					</table>
				</td>
				<td>
					<div style="text-align:right; margin:5px 10px 5px 0px">
						<a href="${pageContext.request.contextPath }/ToClientIndexServlet">首页</a>
						&nbsp;&nbsp;&nbsp;&nbsp;&gt;&nbsp;&nbsp;&nbsp;
						<a href="${pageContext.request.contextPath }/ToMyAccountServlet">&nbsp;我的帐户</a>
						&nbsp;&nbsp;&nbsp;&nbsp;&gt;&nbsp;&nbsp;&nbsp;&nbsp;用户信息修改
					</div>
                    <form action="${pageContext.request.contextPath}/EditorCustomerServlet" method="post" style="margin-left: 80px">
                        <table cellspacing="0" class="infocontent">
                            <tr>
                                <td>
                                    <table width="100%" border="0" cellspacing="2" class="upline">
                                        <tr>
                                            <td style="text-align:right">用户名：</td>
                                            <td style="padding-left:20px">${user.username }</td>
                                            <td>&nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td style="text-align:right">修改密码：</td>
                                            <td><input type="password" name="password" class="textinput" /></td>
                                            <td><font color="#999999">密码设置至少6位，请区分大小写</font></td>
                                        </tr>
                                        <tr>
                                            <td style="text-align:right">重复密码：</td>
                                            <td><input type="password" name="password"  class="textinput" /></td>
                                            <td>&nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td style="text-align:right">性别：</td>
                                            <td colspan="2">&nbsp;&nbsp;
                                                <input type="radio" name="sex" value="0" ${user.sex=='0'?'checked':'' }/> 男
                                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                <input type="radio" name="sex" value="1"  ${user.sex=='1'?'checked':'' }/> 女
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="text-align:right">联系方式：</td>
                                            <td colspan="2">
                                                <input name="iphone" type="text" value="${user.iphone}" class="textinput" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="text-align:right">&nbsp;</td>
                                            <td>&nbsp;</td>
                                            <td>&nbsp;</td>
                                        </tr>
                                    </table>
                                    <p style="text-align:center">
                                        <a href="${pageContext.request.contextPath}/EditorCustomerServlet">
                                            <img src="${pageContext.request.contextPath }/resources/client/images/botton_gif_025.gif" border="0" width="140" height="35"/>
                                        </a>
                                    </p>
                                    <p style="text-align:center">&nbsp;</p>
                                </td>
                            </tr>
                        </table>
                    </form>

				</td>
			</tr>
		</table>
	</div>
	<jsp:include page="../foot.jsp" />
</body>
</html>
