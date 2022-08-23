<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>株式会社N_Gネットショップ</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/client/css/main.css" type="text/css" />
<script>
    //当商品数量发生变化时触发该方法
	function changeProductNum(count, totalCount, id) {
		count = parseInt(count);
		totalCount = parseInt(totalCount);
		//如果数量为0，判断是否要删除商品
		if (count == 0) {
			var flag = window.confirm("本当に削除しますか?");

			if (!flag) {
				count = 1;
			}
		}
		if (count > totalCount) {
			alert("商品数量が上限を超えています");
			count = totalCount;
		}
		location.href = "${pageContext.request.contextPath}/ChangeCartServlet?id=" + id + "&count=" + count;
	}
	//删除购物车中的商品
	function cart_del() {   
	    var msg = "商品を削除しますか？";
	    if (confirm(msg)==true){   
	    return true;   
	    }else{   
	    return false;   
	    }   
	}   
</script>
</head>
<body class="main">
	<jsp:include page="head.jsp" />
	<jsp:include page="menu_search.jsp" />
	<div id="divpagecontent">
		<table width="100%" border="0" cellspacing="0">
			<tr>
				<td>
					<div style="text-align:right; margin:5px 10px 5px 0px">
						<a href="${pageContext.request.contextPath }/ToClientIndexServlet">ホームページ</a>
						&nbsp;&nbsp;&nbsp;&nbsp;&gt;&nbsp;&nbsp;&nbsp;&nbsp;カート
					</div>
					<table cellspacing="0" class="infocontent">
						<tr>
							<td>
								<img src="${pageContext.request.contextPath}/resources/images/top_bg.jpg" width="900" height="89" />
								<table width="100%" border="0" cellspacing="0">
									<tr>
										<td>
											<table cellspacing="1" class="carttable">
												<tr>
													<td width="10%">番号</td>
													<td width="30%">商品名</td>
													<td width="10%">価格</td>
													<td width="20%">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;数量</td>
													<td width="10%">在庫</td>
													<td width="10%">小計</td>
													<td width="10%">キャンセル</td>
												</tr>
											</table>
											<!-- 循环输出商品信息 -->
											<c:set var="total" value="0" /> 
											<c:forEach items="${cart}" var="entry" varStatus="vs">
												<table width="100%" border="0" cellspacing="0">
													<tr>
														<td width="10%">${vs.count}</td>
														<td width="30%">${entry.key.name }</td>
														<td width="10%">${entry.key.price }</td>
														<td width="20%">
														    <!-- 减少商品数量 -->
															<input type="button" value='-' style="width:20px"
															       onclick="changeProductNum('${entry.value-1}','${entry.key.pnum}','${entry.key.id}')">
															 <!-- 商品数量显示 -->
															<input name="text" type="text" value="${entry.value}" style="width:40px;text-align:center" />
															<!-- 增加商品数量 -->
															<input type="button" value='+' style="width:20px"
															       onclick="changeProductNum('${entry.value+1}','${entry.key.pnum}','${entry.key.id}')">
														</td>
														<td width="10%">${entry.key.pnum}</td>
														<td width="10%">${entry.key.price*entry.value}</td>
														<td width="10%">
														    <!-- 删除商品 -->
															<a href="${pageContext.request.contextPath}/ChangeCartServlet?id=${entry.key.id}&count=0"
															style="color:#FF0000; font-weight:bold" onclick="javascript:return cart_del()">X</a>
														</td>
													</tr>
												</table>
												<c:set value="${total+entry.key.price*entry.value}" var="total" />
											</c:forEach>

											<table cellspacing="1" class="carttable">
												<tr>
													<td style="text-align:right; padding-right:40px;">
														<font style="color:#FF6600; font-weight:bold">合計：&nbsp;&nbsp;${total}円</font>
													</td>
												</tr>
											</table>
											<div style="text-align:right; margin-top:10px">
											    <!--继续购物 -->
												<a href="${pageContext.request.contextPath}/ToClientIndexServlet">
													<img src="${pageContext.request.contextPath}/resources/client/images/gwc_jx.gif" border="0" />
												</a>
												&nbsp;&nbsp;&nbsp;&nbsp;
                                                 <!--结账 -->
												<a href="${pageContext.request.contextPath}/ToPayServlet">
													<img src="${pageContext.request.contextPath}/resources/client/images/gwc_buy.gif" border="0" />
												</a>
											</div>
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
	<jsp:include page="foot.jsp" />
</body>
</html>
