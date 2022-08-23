<%@ page language="java" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<HTML>
<HEAD>
	<meta http-equiv="Content-Language" content="zh-cn">
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<LINK href="${pageContext.request.contextPath}/resources/css/Style.css" type="text/css" rel="stylesheet">
	<script language="javascript" src="${pageContext.request.contextPath}/resources/js/public.js"></script>
	<script language="javascript" src="${pageContext.request.contextPath}/resources/js/check.js"></script>
	<script type="text/javascript">
		//设置类别的默认值
		function setProductCategory(t) {
			var category = document.getElementById("category");
			var ops = category.options;
			for ( var i = 0; i < ops.length; i++) {
				if (ops[i].value == t) {
					ops[i].selected = true;
					return;
				}
			}
		};
	</script>
</HEAD>
<body onload="setProductCategory('${product.category}')">
	<form id="userAction_save_do" name="Form1"
		action="${pageContext.request.contextPath}/EditorProductServlet" method="post"
		enctype="multipart/form-data">
		<input type="hidden" name="id" value="${requestScope.product.id}" /> &nbsp;
		<table cellSpacing="1" cellPadding="5" width="100%" align="center"
			bgColor="#eeeeee" style="border: 1px solid #8ba7e3" border="0">
			<tr>
				<td class="ta_01" align="center" bgColor="#afd1f3" colSpan="4" height="26">
					<strong>商品更新</strong>
				</td>
			</tr>
			<tr>
				<td align="center" bgColor="#f5fafe" class="ta_01">商品名：</td>
				<td class="ta_01" bgColor="#ffffff">
					<input type="text" name="name" class="bg" value="${requestScope.product.name }" />
				</td>
				<td align="center" bgColor="#f5fafe" class="ta_01">商品価格：</td>
				<td class="ta_01" bgColor="#ffffff">
					<input type="text" name="price" class="bg" value="${requestScope.product.price }" />
				</td>
			</tr>
			<tr>
				<td align="center" bgColor="#f5fafe" class="ta_01">商品数量：</td>
				<td class="ta_01" bgColor="#ffffff">
					<input type="text" name="pnum" class="bg" value="${requestScope.product.pnum}" />
				</td>
				<td align="center" bgColor="#f5fafe" class="ta_01">商品種類：</td>
				<td class="ta_01" bgColor="#ffffff">
					<select name="category" id="category">
                        <option value="フード">フード</option>
                        <option value="生活">生活</option>
                        <option value="服装">服装</option>
					</select>
				</td>
			</tr>
			<tr>
				<td align="center" bgColor="#f5fafe" class="ta_01">商品イメージ：</td>
				<td class="ta_01" bgColor="#ffffff" colSpan="3">
				<input type="file" name="upload" size="30" value="" /></td>
			</tr>
			<TR>
				<TD class="ta_01" align="center" bgColor="#f5fafe">商品詳細：</TD>
				<TD class="ta_01" bgColor="#ffffff" colSpan="3">
					<textarea name="description" cols="30" rows="3" style="WIDTH: 96%">${requestScope.product.description}</textarea>
				</TD>
			</TR>
			<TR>
				<td align="center" colSpan="4" class="sep1">
					<img src="${pageContext.request.contextPath}/resources/images/shim.gif">
				</td>
			</TR>
			<tr>
				<td class="ta_01" style="WIDTH: 100%" align="center" bgColor="#f5fafe" colSpan="4">
					<input type="submit" class="button_ok" value="確定">
					<FONT face="宋体">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</FONT>
					<input type="reset" value="リセット" class="button_cancel" />
					<FONT face="宋体">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</FONT> 
					<INPUT class="button_ok" type="button" onclick="history.go(-1)" value="返回" />
					<span id="Label1"> </span>
				</td>
			</tr>
		</table>
	</form>
</body>
</HTML>