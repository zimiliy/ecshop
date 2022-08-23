<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
	<title>株式会社N_Gネットショップ</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/client/css/main.css" type="text/css" />
    <link rel="icon" type="image/x-icon" href="${pageContext.request.contextPath}/resources/images/favicon.ico"/>
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/client/js/order.js"></script>
</head>
<body class="main">
	<jsp:include page="head.jsp" />
	<jsp:include page="menu_search.jsp" />
	<div id="divpagecontent">
		<table width="100%" border="0" cellspacing="0">
			<tr>
				<td><div style="text-align:right; margin:5px 10px 5px 0px">
						<a href="${pageContext.request.contextPath }/ToClientIndexServlet">ホームページ</a>
						   &nbsp;&nbsp;&nbsp;&nbsp;&gt;&nbsp;&nbsp;&nbsp;
						<a href="${pageContext.request.contextPath}/AddCartServlet">&nbsp;カート</a>
						   &nbsp;&nbsp;&nbsp;&nbsp;&gt;&nbsp;&nbsp;&nbsp;&nbsp;注文履歴
					</div>
					<form id="orderForm" action="${pageContext.request.contextPath}/AddOrderServlet" method="post">
						<table cellspacing="0" class="infocontent">
							<tr>
								<td>
								<table width="100%" border="0" cellspacing="0">
										<tr>
											<td>
												<p>${user.username}様！welcome　to 株式会社N_Gの決済センター！</p>
											</td>
										</tr>
										<tr>
											<td>
											    <table cellspacing="1" class="carttable">
													<tr>
														<td width="10%">番号</td>
														<td width="40%">商品名</td>
														<td width="10%">価格</td>
														<td width="10%">種類</td>
														<td width="10%">数量</td>
														<td width="10%">合計</td>
													</tr>
												</table> 
												<c:set value="0" var="totalPrice"/>
												<c:forEach items="${cart}" var="entry" varStatus="vs">
													<table width="100%" border="0" cellspacing="0">
														<tr>
															<td width="10%">${vs.count}</td>
															<td width="40%">${entry.key.name }</td>
															<td width="10%">${entry.key.price }</td>
															<td width="10%">${entry.key.category}</td>
															<td width="10%">
															  <input name="text" type="text" value="${entry.value}" style="width:20px" readonly="readonly"/>
															</td>
															<td width="10%">${entry.key.price*entry.value}</td>
														</tr>
													</table>
													<c:set var="totalPrice" value="${totalPrice+entry.key.price*entry.value}"/>
												</c:forEach>

												<table cellspacing="1" class="carttable">
													<tr>
														<td style="text-align:right; padding-right:40px;"><font
															style="color:#FF0000">合計：&nbsp;&nbsp;${totalPrice}円</font>
															<input type="hidden" name="money" value="${totalPrice}">
														</td>
													</tr>
												</table>
												<p>
													住所：<input id="receiverAddress" name="receiverAddress" type="text" value=""style="width:350px" onkeyup="checkReceiverAddress();" />
													&nbsp;&nbsp;&nbsp;&nbsp;
													<span id="receiverAddressMsg"></span>
													<br/>
												        名前：&nbsp;&nbsp;&nbsp;&nbsp;<input id="receiverName" name="receiverName" type="text" value="${user.username}" style="width:150px" onkeyup="checkReceiverName();" />
												    <span id="receiverNameMsg"></span>
												    &nbsp;&nbsp;&nbsp;&nbsp;
													<br/> 
													連絡方式：<input type="text" id="receiverPhone" name="receiverPhone" value="${user.iphone}" style="width:150px" onkeyup="checkReceiverPhone();" />
													<span id="receiverPhoneMsg"></span>
													&nbsp;&nbsp;&nbsp;&nbsp;
												</p>
												<hr />
												<p style="text-align:right">
													<img src="${pageContext.request.contextPath}/resources/client/images/gif53_029.gif" width="204" height="51" border="0" onclick="checkOnSubmit();"/>
												</p>
											</td>
										</tr>
									</table>
								</td>
							</tr>
						</table>
					</form>
				</td>
			</tr>
		</table>
	</div>
	<jsp:include page="foot.jsp" />
</body>
</html>
