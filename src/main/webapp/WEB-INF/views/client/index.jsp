<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
	<title>商城</title>
	<%-- 导入css --%>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/client/css/main.css" type="text/css" />
	<!-- 导入首页轮播图css和js脚本 -->
	<link type="text/css" href="${pageContext.request.contextPath }/resources/client/css/autoplay.css" rel="stylesheet" />
    <link rel="icon" type="image/x-icon" href="${pageContext.request.contextPath}/resources/images/favicon.ico"/>
    <script type="text/javascript" src="${pageContext.request.contextPath }/resources/client/js/autoplay.js"></script>
</head>

<body class="main">
	<%@include file="head.jsp"%>
	<%@include file="menu_search.jsp" %>
	<!-- 商场首页轮播图  start -->
	<div id="box_autoplay">
    	<div class="list">
        	<ul>
            	<li><img src="${pageContext.request.contextPath }/resources/client/ad/bg.jpg" width="900" height="335" /></li>
            	<li><img src="${pageContext.request.contextPath }/resources/client/ad/bg.jpg" width="900" height="335" /></li>
            	<li><img src="${pageContext.request.contextPath }/resources/client/ad/bg.jpg" width="900" height="335" /></li>
            	<li><img src="${pageContext.request.contextPath }/resources/client/ad/bg.jpg" width="900" height="335" /></li>
            	<li><img src="${pageContext.request.contextPath }/resources/client/ad/bg.jpg" width="900" height="335" /></li>
        	</ul>
    	</div>
	</div>
	<!-- 商场首页轮播图  end -->
	<div id="divcontent" style="height: 300px">

        <div class="title" style="height: 30px; margin-top: -5px">
            <h4 style="float: left;">热门商品</h4>
        </div>
        <table cellspacing="0" class="indexList">
            <tr>
                <c:forEach items="${products}" var="p" varStatus="vs">
                    <td>
                        <div class="product">
                            <p>
                                <a href="${pageContext.request.contextPath}/QueryProductByIdServlet?id=${p.id}">
                                    <img src="${p.imgurl}" width="115" height="129" border="0" />
                                </a>
                            </p>
                        </div>
                        <div class="remark">
                            <a href="${pageContext.request.contextPath}/QueryProductByIdServlet?id=${p.id}">商品名： ${p.name}<br />售价：￥${p.price} </a>
                        </div>
                    </td>
                </c:forEach>
            </tr>
        </table>

<%--        <c:forEach items="${products}" var="product">--%>
<%--            <a href="${pageContext.request.contextPath}/QueryProductByIdServlet?id=${product.id}">--%>
<%--                <div class="content" style="margin-top:15px;height: 150px;width: 120px; float: left;margin-left: 20px">--%>
<%--                    <div class="item">--%>
<%--                        <img src="${product.imgurl}" alt="">--%>
<%--                        <p>${product.name}</p>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--            </a>--%>
<%--        </c:forEach>--%>
	</div>
	<%@ include file="foot.jsp" %>
</body>
</html>
