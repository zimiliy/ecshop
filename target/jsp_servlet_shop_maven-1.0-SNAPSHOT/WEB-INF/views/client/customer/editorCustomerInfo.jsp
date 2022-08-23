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
							<td class="listtitle">アカウント</td>
						</tr>
						<tr>
							<td class="listtd">
								<img src="${pageContext.request.contextPath }/resources/client/images/icon1.png" width="15" height="10" />&nbsp;&nbsp;&nbsp;&nbsp;
								<a href="${pageContext.request.contextPath }/ToEditorCustomerServlet">個人情報更新</a>
							</td>
						</tr>
						<tr>
							<td class="listtd">
								<img src="${pageContext.request.contextPath }/resources/client/images/icon2.png" width="15" height="10" />&nbsp;&nbsp;&nbsp;&nbsp;
                                <a href="${pageContext.request.contextPath}/QueryOrderServlet?id=${user.uid}">注文履歴</a>
							</td>
						</tr>
						<tr>
							<td class="listtd">
								<img src="${pageContext.request.contextPath }/resources/client/images/icon3.png" width="15" height="10" />&nbsp;&nbsp;&nbsp;&nbsp;
								<a href="${pageContext.request.contextPath}/LoginOutServlet">ログアウト</a>
							</td>
						</tr>
					</table>
				</td>
				<td>
					<div style="text-align:right; margin:5px 10px 5px 0px">
						<a href="${pageContext.request.contextPath }/ToClientIndexServlet">ホームページ</a>
						&nbsp;&nbsp;&nbsp;&nbsp;&gt;&nbsp;&nbsp;&nbsp;
						<a href="${pageContext.request.contextPath }/ToMyAccountServlet">&nbsp;アカウント</a>
						&nbsp;&nbsp;&nbsp;&nbsp;&gt;&nbsp;&nbsp;&nbsp;&nbsp;個人情報更新
					</div>
                    <form action="${pageContext.request.contextPath}/EditorCustomerServlet" method="post" style="margin-left: 80px">
                        <table cellspacing="0" class="infocontent">
                            <tr>
                                <td>
                                    <table width="100%" border="0" cellspacing="2" class="upline">
                                        <tr>
                                            <td style="text-align:right">ユーザー名：</td>
                                            <td style="padding-left:20px">${user.username }</td>
                                            <td>&nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td style="text-align:right">パスワード更新：</td>
                                            <td><input type="password" name="password" class="textinput" /></td>
                                            <td><font color="#999999">パスワードは6桁以上を入力してください</font></td>
                                        </tr>
                                        <tr>
                                            <td style="text-align:right">もう一度パスワードを入力：</td>
                                            <td><input type="password" name="password"  class="textinput" /></td>
                                            <td>&nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td style="text-align:right">性別：</td>
                                            <td colspan="2">&nbsp;&nbsp;
                                                <input type="radio" name="sex" value="0" ${user.sex=='0'?'checked':'' }/> 男
                                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                <input type="radio" name="sex" value="1"  ${user.sex=='1'?'checked':'' }/> 女
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="text-align:right">連絡方法：</td>
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
