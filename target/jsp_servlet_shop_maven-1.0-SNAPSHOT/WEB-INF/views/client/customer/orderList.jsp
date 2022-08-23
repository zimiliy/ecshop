<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
	<title>株式会社N_Gネットショップ</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/client/css/main.css" type="text/css" />
    <link rel="icon" type="image/x-icon" href="${pageContext.request.contextPath}/resources/images/favicon.ico"/>
    <script type="text/javascript">
	//删除订单
	function o_del() {   
	    var msg = "本当に削除しますか？";
	    if (confirm(msg)==true){   
	    return true;   
	    }else{   
	    return false;   
	    }   
	} 
	</script>
</head>
<body class="main">
	<jsp:include page="../head.jsp" />
	<jsp:include page="../menu_search.jsp" />
	<div id="divpagecontent">
		<table width="100%" border="0" cellspacing="0">
			<tr>
				<td width="25%">
					<table width="100%" border="0" cellspacing="0" style="margin-top:30px">
						<tr>
							<td class="listtitle">アカウント</td>
						</tr>
						<tr>
							<td class="listtd">
								<img src="${pageContext.request.contextPath }/resources/client/images/icon1.png" width="15" height="10" />
								&nbsp;&nbsp;&nbsp;&nbsp; 
								<a href="${pageContext.request.contextPath }/ToEditorCustomerServlet">情報更新</a>
							</td>
						</tr>
						<tr>
							<td class="listtd">
								<img src="${pageContext.request.contextPath }/resources/client/images/icon2.png" width="15" height="10" />
								&nbsp;&nbsp;&nbsp;&nbsp; 
								<a href="${pageContext.request.contextPath}/QueryOrderServlet?id=${user.uid}">注文履歴</a>
							</td>
						</tr>
						<tr>
							<td class="listtd">
								<img src="${pageContext.request.contextPath }/resources/client/images/icon3.png" width="15" height="10" />
								&nbsp;&nbsp;&nbsp;&nbsp; 
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
						&nbsp;&nbsp;&nbsp;&nbsp;&gt;&nbsp;&nbsp;&nbsp;&nbsp;
						注文履歴
					</div>
					<table cellspacing="0" class="infocontent">
						<tr>
							<td style="padding:20px"><p><b>注文履歴</b></p>
								<p>
									注文は<font style="color:#FF0000" >${orders.size()}</font>があります。
								</p>
								<table width="100%" border="0" cellspacing="0" class="tableopen">
									<tr>
										<td bgcolor="#A3E6DF" class="tableopentd01">注文番号</td>
										<td bgcolor="#A3D7E6" class="tableopentd01">名前</td>
										<td bgcolor="#A3CCE6" class="tableopentd01">注文時間</td>
										<td bgcolor="#A3B6E6" class="tableopentd01">状況</td>
										<td bgcolor="#A3E2E6" class="tableopentd01">操作</td>
									</tr>
									<c:forEach items="${orders}" var="order">
										<tr>
											<td class="tableopentd02">${order.id}</td>
											<td class="tableopentd02">${order.receiverName }</td>
											<td class="tableopentd02">${order.ordertime}</td>
											<td class="tableopentd02">${order.paystate==0?"お支払してない":"お支払済み"}</td>
											<td class="tableopentd03">
												<a href="${pageContext.request.contextPath}/QueryOrderByIdServlet?id=${order.id}">見る</a>&nbsp;&nbsp;
												<c:if test="${order.paystate==0 }">
													<a href="${pageContext.request.contextPath}/DeleteOrderByIdServlet?id=${order.id}"  onclick="javascript:return o_del()">削除</a>
												</c:if> 
												<c:if test="${order.paystate!=0 }">
													<a href="${pageContext.request.contextPath}/DeleteOrderByIdServlet?id=${order.id}&type=client" onclick="javascript:return o_del()">削除</a>
												</c:if>
											</td>
										</tr>
									</c:forEach>
								</table>
							</td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
	</div>
	<%@ include file="../foot.jsp" %>
</body>
</html>
