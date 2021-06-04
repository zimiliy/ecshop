<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
	<title>商品列表</title>
    <link rel="icon" type="image/x-icon" href="${pageContext.request.contextPath}/resources/images/favicon.ico"/>
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
						<a href="${pageContext.request.contextPath }/ToClientIndexServlet">首页</a>
						&nbsp;&nbsp;&nbsp;&nbsp;&gt;&nbsp;&nbsp;&nbsp;&nbsp;
						${pageProduct.category}
						&nbsp;&nbsp;&nbsp;&nbsp;&gt;&nbsp;&nbsp;&nbsp;&nbsp;
						商品列表
					</div>
					<table cellspacing="0" class="listcontent">
						<tr>
							<td>
								<h1>商品目录</h1>
								<hr />
								<h1>${pageProduct.category}</h1>&nbsp;&nbsp;&nbsp;&nbsp;共${pageProduct.totalCount}种商品
								<hr />
								<div style="margin-top:20px; margin-bottom:5px">
									<p style="width:100%;height: 30px; text-align: center;font-size: 15px">
                                        商品信息
                                    </p>
								</div>

								<table cellspacing="0" class="productList">
									<tr>
										<c:forEach items="${pageProduct.list}" var="p" varStatus="vs">
											<td>
												<div class="divproductpic">
													<p>
														<a href="${pageContext.request.contextPath}/QueryProductByIdServlet?id=${p.id}">
															<img src="${p.imgurl}" width="115" height="129" border="0" />
														</a>
													</p>
												</div>
												<div class="divlisttitle">
													<a href="${pageContext.request.contextPath}/QueryProductByIdServlet?id=${p.id}">商品名： ${p.name}<br />售价：￥${p.price} </a>
												</div>
											</td>
										</c:forEach>
									</tr>
								</table>
								<div class="pagination">
									<ul>
										<c:if test="${pageProduct.currentPage!=1}">
											<li class="disablepage_p">
												<a class="disablepage_a" href="${pageContext.request.contextPath}/showProductByPage?currentPage=${pageProduct.currentPage-1}&category=${pageProduct.category}"></a>
											</li>
										</c:if>
										<c:if test="${pageProduct.currentPage==1}">
											<li class="disablepage_p2"></li>
										</c:if>
										<c:forEach begin="1" end="${pageProduct.totalPage}" var="pageNum">
											<c:if test="${pageNum==pageProduct.currentPage}">
												<li class="currentpage">${pageNum }</li>
											</c:if>
											<c:if test="${pageNum!=pageProduct.currentPage}">
												<li><a href="${pageContext.request.contextPath}/showProductByPage?currentPage=${pageNum}&category=${pageProduct.category}">${pageNum}</a>
												</li>
											</c:if>
										</c:forEach>

										<c:if test="${pageProduct.currentPage==pageProduct.totalPage||pageProduct.totalPage==0}">
											<li class="disablepage_n2"></li>
										</c:if>
										<c:if test="${pageProduct.currentPage!=pageProduct.totalPage&&pageProduct.totalPage!=0}">
											<li class="disablepage_n">
												<a class="disablepage_a" href="${pageContext.request.contextPath}/showProductByPage?currentPage=${pageProduct.currentPage+1}&category=${pageProduct.category}"></a>
											</li>
										</c:if>
									</ul>
								</div>
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
