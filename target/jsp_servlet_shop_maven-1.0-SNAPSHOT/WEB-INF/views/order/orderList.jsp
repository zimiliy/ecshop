<%@ page language="java" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<HTML>
<HEAD>
    <title>订单</title>
	<meta http-equiv="Content-Language" content="zh-cn">
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link href="${pageContext.request.contextPath}/resources/css/Style.css" rel="stylesheet" type="text/css" />
	<script language="javascript" src="${pageContext.request.contextPath}/resources/js/public.js"></script>
	<script type="text/javascript">
	//删除订单
	function o_del() {   
		var msg = "この商品を削除しますか？";
		if (confirm(msg)==true){   
		return true;   
		}else{   
		return false;   
		}   
	}   
	</script>
</HEAD>
<body>
	<br />
	<form id="Form1" name="Form1" action="${pageContext.request.contextPath}/FindOrderServlet" method="post">
		<table cellSpacing="1" cellPadding="0" width="100%" align="center" bgColor="#f5fafe" border="0">
			<TBODY>
				<tr>
					<td class="ta_01" align="center" bgColor="#afd1f3">
						<strong>検　索　条　件</strong>
					</td>
				</tr>
				<tr>
					<td>
						<table cellpadding="0" cellspacing="0" border="0" width="100%">
							<tr>
								<td height="22" align="center" bgColor="#f5fafe" class="ta_01">
									注文番号</td>
								<td class="ta_01" bgColor="#ffffff">
									<input type="text" name="id" size="15" value="" id="Form1_userName" class="bg" />
								</td>
								<td height="22" align="center" bgColor="#f5fafe" class="ta_01">
									名前：</td>
								<td class="ta_01" bgColor="#ffffff">
									<input type="text" name="receiverName" size="15" value="" id="Form1_userName" class="bg" />
								</td>
							</tr>
							<tr>
								<td width="100" height="22" align="center" bgColor="#f5fafe" class="ta_01"></td>
								<td class="ta_01" bgColor="#ffffff">
									<font face="宋体" color="red"> &nbsp;</font>
								</td>
								<td align="right" bgColor="#ffffff" class="ta_01">
									<br /><br />
								</td>
								<td align="right" bgColor="#ffffff" class="ta_01">
									<button type="submit" id="search" name="search" value="検索" class="button_view">
										検索
									</button> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
									<input type="reset" name="reset" value="リセット" class="button_view" />
								</td>
							</tr>
						</table>
					</td>
				</tr>
				<tr>
					<td class="ta_01" align="center" bgColor="#afd1f3">
						<strong>注文履歴リスト</strong>
					</td>
				</tr>
				<tr>
					<td class="ta_01" align="right"></td>
				</tr>
				<tr>
					<td class="ta_01" align="center" bgColor="#f5fafe">
						<table cellspacing="0" cellpadding="1" rules="all"
							bordercolor="gray" border="1" id="DataGrid1"
							style="BORDER-RIGHT: gray 1px solid; BORDER-TOP: gray 1px solid; BORDER-LEFT: gray 1px solid; WIDTH: 100%; WORD-BREAK: break-all; BORDER-BOTTOM: gray 1px solid; BORDER-COLLAPSE: collapse; BACKGROUND-COLOR: #f5fafe; WORD-WRAP: break-word">
							<tr style="FONT-WEIGHT: bold; FONT-SIZE: 12pt; HEIGHT: 25px; BACKGROUND-COLOR: #afd1f3">
								<td align="center" width="20%">注文番号</td>
								<td align="center" width="10%">名前</td>
								<td align="center" width="15%">住所</td>
								<td align="center" width="10%">電話番号</td>
								<td width="11%" align="center">合計</td>
								<td width="8%" align="center">購入したユーザー</td>
								<td width="10%" align="center">注文状態</td>
								<td width="7%" align="center">見る</td>
								<td width="7%" align="center">削除</td>
							</tr>
							<c:forEach items="${orders}" var="order">
								<tr onmouseover="this.style.backgroundColor = 'white'"
									onmouseout="this.style.backgroundColor = '#F5FAFE';">
									<td style="CURSOR: hand; HEIGHT: 22px" align="center" width="20%">${order.id}</td>
									<td style="CURSOR: hand; HEIGHT: 22px" align="center" width="10%">${order.receiverName}</td>
									<td style="CURSOR: hand; HEIGHT: 22px" align="center" width="15%">${order.receiverAddress }</td>
									<td style="CURSOR: hand; HEIGHT: 22px" align="center" width="10%">${order.receiverPhone }</td>
									<td style="CURSOR: hand; HEIGHT: 22px" align="center">${order.money}</td>
									<td width="8%" align="center">${order.user.username}</td>
									<td width="10%" align="center">${order.paystate==0?"お支払してない":"お支払い済み"}</td>
									<td align="center" style="HEIGHT: 22px">
										<a href="${pageContext.request.contextPath}/FindOrderByIdServlet?id=${order.id}&type=admin">
											<img src="${pageContext.request.contextPath}/resources/images/button_view.gif" border="0" style="CURSOR: hand">
										</a>
									</td>
									<td align="center" style="HEIGHT: 22px">
                                        <!--  已支付，弹出提示框由操作人确认 -->
									    <c:if test="${order.paystate!=0 }">
											<a href="${pageContext.request.contextPath}/DeleteOrderServlet?id=${order.id}&type=admin" onclick="javascript:return o_del()">
												<img src="${pageContext.request.contextPath}/resources/images/i_del.gif" width="16" height="16" border="0" style="CURSOR: hand">
											</a>
										</c:if> 
										<!--  未支付 ，不能删除-->
										<c:if test="${order.paystate==0 }">
											<a href="javascript:alert('不能删除未支付订单')">
												<img src="${pageContext.request.contextPath}/resources/images/i_del.gif" width="16" height="16" border="0" style="CURSOR: hand">
											</a>
										</c:if>
									</td>
								</tr>
							</c:forEach>
						</table>
					</td>
				</tr>
			</TBODY>
		</table>
	</form>
</body>
</HTML>