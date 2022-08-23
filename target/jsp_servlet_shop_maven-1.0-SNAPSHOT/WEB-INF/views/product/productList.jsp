<%@ page language="java" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<HTML>
<HEAD>
	<meta http-equiv="Content-Language" content="zh-cn">
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="icon" type="image/x-icon" href="${pageContext.request.contextPath}/resources/images/favicon.ico"/>
	<link href="${pageContext.request.contextPath}/resources/css/Style.css" rel="stylesheet" type="text/css" />
	<script language="javascript" src="${pageContext.request.contextPath}/resources/js/public.js"></script>
	<script type="text/javascript">
	    //添加商品
		function addProduct() {
			window.location.href = "${pageContext.request.contextPath}/ToAddProductServlet";
		}
		//删除商品
		function p_del() {   
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
	<form id="Form1" name="Form1"
		action="${pageContext.request.contextPath}/FindProductServlet"
		method="post">
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
								<td height="22" align="center" bgColor="#f5fafe" class="ta_01">商品番号</td>
								<td class="ta_01" bgColor="#ffffff">
									<input type="text" name="id" size="15" value="" id="Form1_userName" class="bg" />
								</td>
								<td height="22" align="center" bgColor="#f5fafe" class="ta_01">種類：</td>
								<td class="ta_01" bgColor="#ffffff">
								<select name="category" id="category">
										<option value="" selected="selected">--商品種類を選択してください--</option>
										<option value="フード">フード</option>
										<option value="生活">生活</option>
										<option value="服装">服装</option>
								</select>
								</td>
							</tr>
							<tr>
								<td height="22" align="center" bgColor="#f5fafe" class="ta_01">商品名：</td>
								<td class="ta_01" bgColor="#ffffff">
									<input type="text" name="name" size="15" value="" id="Form1_userName" class="bg" />
								</td>
								<td height="22" align="center" bgColor="#f5fafe" class="ta_01">価格区間：</td>
								<td class="ta_01" bgColor="#ffffff">
									<input type="text" name="minPrice" size="10" value="" />
									- 
									<input type="text" name="maxPrice" size="10" value="" />
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
									</button> 
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
									<input type="reset" name="reset" value="リセット;" class="button_view" />
								</td>
							</tr>
						</table>
					</td>
				</tr>
				<tr>
					<td class="ta_01" align="center" bgColor="#afd1f3"><strong>商 品 リスト</strong>
					</TD>
				</tr>
				<tr>
					<td class="ta_01" align="right">
						<button type="button" id="add" name="add" value="追加" class="button_add" onclick="addProduct()">
							追加
						</button>
					</td>
				</tr>
				<tr>
					<td class="ta_01" align="center" bgColor="#f5fafe">
						<table cellspacing="0" cellpadding="1" rules="all"
							bordercolor="gray" border="1" id="DataGrid1"
							style="BORDER-RIGHT: gray 1px solid; BORDER-TOP: gray 1px solid; BORDER-LEFT: gray 1px solid; WIDTH: 100%; WORD-BREAK: break-all; BORDER-BOTTOM: gray 1px solid; BORDER-COLLAPSE: collapse; BACKGROUND-COLOR: #f5fafe; WORD-WRAP: break-word">
							<tr style="FONT-WEIGHT: bold; FONT-SIZE: 12pt; HEIGHT: 25px; BACKGROUND-COLOR: #afd1f3">
								<td align="center" width="10%">商品番号</td>
								<td align="center" width="18%">商品名</td>
								<td align="center" width="9%">商品価格</td>
								<td align="center" width="9%">商品数量</td>
								<td width="8%" align="center">商品種類</td>
                                <td width="8%" align="center">イメージ</td>
								<td width="8%" align="center">更新</td>
								<td width="8%" align="center">削除</td>
							</tr>
                            <!--  循环输出所有商品 -->
							<c:forEach items="${requestScope.allProduct}" var="product">
								<tr onmouseover="this.style.backgroundColor = 'white'"
									onmouseout="this.style.backgroundColor = '#F5FAFE';">
									<td style="CURSOR: hand; HEIGHT: 22px" align="center" width="200">${product.id }</td>
									<td style="CURSOR: hand; HEIGHT: 22px" align="center" width="18%">${product.name }</td>
									<td style="CURSOR: hand; HEIGHT: 22px" align="center" width="8%">${product.price }</td>
									<td style="CURSOR: hand; HEIGHT: 22px" align="center" width="8%">${product.pnum }</td>
									<td style="CURSOR: hand; HEIGHT: 22px" align="center">${product.category}</td>
                                   < <td align="center" style="HEIGHT: 22px" width="7%">
                                        <img src="upload/${product.imgurl}" border="0" style="CURSOR: hand" height="50px" width="50px">
                                    </td>
									<td align="center" style="HEIGHT: 22px" width="7%">
									    <a href="${pageContext.request.contextPath}/ToEditorProductServlet?id=${product.id}&type=admin">
											<img src="${pageContext.request.contextPath}/resources/images/i_edit.gif" border="0" style="CURSOR: hand">
										</a>
									</td>
									<td align="center" style="HEIGHT: 22px" width="7%">
										<a href="${pageContext.request.contextPath}/DeleteProductServlet?id=${product.id}" onclick="javascript:return p_del()">
												<img src="${pageContext.request.contextPath}/resources/images/i_del.gif"
												width="16" height="16" border="0" style="CURSOR: hand">
										</a>
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