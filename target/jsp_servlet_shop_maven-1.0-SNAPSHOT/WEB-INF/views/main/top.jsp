<%@ page language="java" pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Language" content="zh-cn">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style type="text/css">
BODY {
	MARGIN: 0px;
	BACKGROUND-COLOR: #ffffff
}

BODY {
	FONT-SIZE: 12px;
	COLOR: #000000
}

TD {
	FONT-SIZE: 12px;
	COLOR: #000000
}

TH {
	FONT-SIZE: 12px;
	COLOR: #000000
}
.height1{width:100%; height:74px; }
.img_logo{
	min-width:100%;
	max-width:100%;
	height:74px;
}

</style>
<link href="${pageContext.request.contextPath}/resources/css/Style.css"
	rel="stylesheet" type="text/css">

<script type="text/javascript">
	function exitSys() {
		var flag = window.confirm("ログアウトしますか?");
		if (flag) {
            window.top.open('', '_parent', '');
            window.top.close();
            window.location.href = "${pageContext.request.contextPath}/ToLoginServlet";
		}
	}
</script>
</HEAD>
<body>
	<div class="height1">
		<img class="img_logo" src="${pageContext.request.contextPath}/resources/images/top_bg.jpg">
	</div>
	<table width="100%" border="0" cellspacing="0" cellpadding="0">
		<tr>
			<td height="26" valign="bottom"
				background="${pageContext.request.contextPath}/resources/images/mis_01.jpg">
				<table width="100%" border="0" cellspacing="0" cellpadding="0">
					<tr>
						<td width="85%" align="left">
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
							<font color="#000000">
								<script language="JavaScript">								
									tmpDate = new Date();
									date = tmpDate.getDate();
									month = tmpDate.getMonth() + 1;
									year = tmpDate.getFullYear();
									document.write(year);
									document.write("年");
									document.write(month);
									document.write("月");
									document.write(date);
									document.write("日 ");

									myArray = new Array(6);
									myArray[0] = "日曜日"
									myArray[1] = "月曜日"
									myArray[2] = "火曜日"
									myArray[3] = "水曜日"
									myArray[4] = "木曜日"
									myArray[5] = "金曜日"
									myArray[6] = "土曜日"
									weekday = tmpDate.getDay();
									if (weekday == 0 | weekday == 6) {
										document.write(myArray[weekday])
									} else {
										document.write(myArray[weekday])
									};								
								</script> 
							</font>
						</td>
						<td width="15%">
							<table width="100%" border="0" cellspacing="0" cellpadding="0">
								<tr>
									<td width="16" background="${pageContext.request.contextPath}/resources/images/mis_05b.jpg">
										<img src="${pageContext.request.contextPath}/resources/images/mis_05a.jpg" width="6" height="18">
									</td>
									<td width="155" valign="bottom" background="${pageContext.request.contextPath}/resources/images/mis_05b.jpg">
										<font color="blue">
                                            <a href="javascript:void(0)" onclick="exitSys()">ログアウト</a>
                                        </font>
                                    </td>
									<td width="10" align="right" background="${pageContext.request.contextPath}/resources/images/mis_05b.jpg">
										<img src="${pageContext.request.contextPath}/resources/images/mis_05c.jpg" width="6" height="18">
									</td>
								</tr>
							</table>
						</td>
						<td align="right" width="5%"></td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
</body>
</HTML>
