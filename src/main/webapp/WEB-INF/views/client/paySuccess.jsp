<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
	<title>株式会社N_G</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/client/css/main.css" type="text/css" />
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/client/js/my.js"></script>
</head>
<body class="main">
	<jsp:include page="head.jsp"/>
	<jsp:include page="menu_search.jsp" />
	<div id="divcontent">
		<table width="850px" border="0" cellspacing="0">
			<tr>
				<td style="padding:30px; text-align:center"><table width="60%"
						border="0" cellspacing="0" style="margin-top:70px">
						<tr>
							<td style="width:98">
								<img src="${pageContext.request.contextPath}/resources/client/images/paySuccess.png" width="128" height="128" />
							</td>
							<td style="padding-top:30px">
								<font style="font-weight:bold; color:#FF0000">購入しました、ありがとうございます。</font><br /><br />
								<a href="${pageContext.request.contextPath }/ToClientIndexServlet">
									<span id="second">5</span>秒後ホームページへ戻ります。</a>
								</a>
							</td>
						</tr>
					</table>
					<h1>&nbsp;</h1>
				</td>
			</tr>
		</table>
	</div>
	<jsp:include page="foot.jsp"/>
</body>
</html>
