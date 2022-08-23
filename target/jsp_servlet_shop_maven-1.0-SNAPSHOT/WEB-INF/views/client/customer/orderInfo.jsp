<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>株式会社N_Gネットショップ</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/client/css/main.css" type="text/css" />
</head>
<body class="main">
	<jsp:include page="../head.jsp" />
	<jsp:include page="../menu_search.jsp" />
	<div id="divpagecontent">
		<table width="100%" border="0" cellspacing="0">
			<tr>
				<td>
					<div style="text-align:right; margin:5px 10px 5px 0px">
						<a href="${pageContext.request.contextPath }/ToClientIndexServlet">ホームページ</a>
						&nbsp;&nbsp;&nbsp;&nbsp;&gt;&nbsp;&nbsp;&nbsp;
						<a href="${pageContext.request.contextPath }/ToMyAccountServlet">アカウント</a>
						&nbsp;&nbsp;&nbsp;&nbsp;&gt;&nbsp;&nbsp;&nbsp;
                        <a href="${pageContext.request.contextPath}/QueryOrderServlet?id=${user.uid}">注文履歴検索</a>
						&nbsp;&nbsp;&nbsp;&nbsp;&gt;&nbsp;&nbsp;&nbsp;注文履歴情報
					</div>
					<table cellspacing="0" class="infocontent">
						<tr>
							<td>
								<table width="100%" border="0" cellspacing="0">
									<tr>
										<td>
											<p>注文番号:${order.id}</p>
										</td>
									</tr>
									<tr>
										<td>
											<table cellspacing="1" class="carttable">
												<tr>
													<td width="10%">番号</td>
													<td width="40%">商品名</td>
													<td width="10%">かか</td>
													<td width="10%">数量</td>
													<td width="10%">小計</td>
												</tr>
											</table> 
											<c:forEach items="${productByOrder}" var="item" varStatus="vs">
												<table width="100%" border="0" cellspacing="0">
													<tr >
														<td width="10%">${vs.count }</td>
														<td width="40%">${item.name}</td>
                                                        <td width="10%">${item.price }</td>
                                                        <td width="10%" >${item.buynum }</td>
														<td width="10%">${item.buynum*item.price }</td>
													</tr>
												</table>
											</c:forEach>
											<table cellspacing="1" class="carttable">
												<tr>
													<td style="text-align:right; padding-right:40px;"><font
														style="color:#FF0000">合計：&nbsp;&nbsp;${order.money}</font>
													</td>
												</tr>
											</table>
											<p>
												住所：${order.receiverAddress }&nbsp;&nbsp;&nbsp;&nbsp;<br />
												名前：&nbsp;&nbsp;&nbsp;&nbsp;${order.receiverName }&nbsp;&nbsp;&nbsp;&nbsp;<br />
												連絡方法：${order.receiverPhone }&nbsp;&nbsp;&nbsp;&nbsp;
											</p>
											<hr>
											<c:if test="${order.paystate != 1 }">
											<p style="text-align:right">
												<a href="${pageContext.request.contextPath}/client/pay.jsp?id=${order.id}&money=${order.money}">
													<img src="${pageContext.request.contextPath }/resources/client/images/gif53_030.gif" width="204" height="51" border="0" />
												</a>
											</p>
											</c:if>
										</td>
									</tr>
								</table>
							</td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
	</div>
	<jsp:include page="../foot.jsp" />
</body>
</html>
