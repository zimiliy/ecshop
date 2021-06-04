<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<script type="text/javascript">
/**
 * my_click和my_blur均是用于前台页面搜索框的函数
 */
//鼠标点击搜索框时执行
function my_click(obj, myid){
	//点击时，如果取得的值和搜索框默认value值相同，则将搜索框清空
	if (document.getElementById(myid).value == document.getElementById(myid).defaultValue){
	  document.getElementById(myid).value = '';
	  obj.style.color='#000';
	}
}
//鼠标不聚焦在搜索框时执行
function my_blur(obj, myid){
	//鼠标失焦时，如果搜索框没有输入值，则用搜索框的默认value值填充
	if (document.getElementById(myid).value == ''){
	 document.getElementById(myid).value = document.getElementById(myid).defaultValue;
	 obj.style.color='#999';
 }
}

/**
 * 点击搜索按钮执行的函数
 */
function search(){
	document.getElementById("searchform").submit();
}
</script>
<div id="divmenu">
		<a href="${pageContext.request.contextPath}/QueryProductByPageServlet?category=食品">食品</a>
		<a href="${pageContext.request.contextPath}/QueryProductByPageServlet?category=书籍">书籍</a>
    <a href="${pageContext.request.contextPath}/QueryProductByPageServlet?category=女装">女装</a>
    <a href="${pageContext.request.contextPath}/QueryProductByPageServlet?category=生活">生活</a>
    <a href="${pageContext.request.contextPath}/QueryProductByPageServlet?category=男装">男装</a>
    <a href="${pageContext.request.contextPath}/QueryProductByPageServlet?category=科技">科技</a>
		<a href="${pageContext.request.contextPath}/QueryProductByPageServlet" style="color:#b4d76d">全部商品目录</a>
</div>
<div id="divsearch">
<form action="${pageContext.request.contextPath }/MenuSearchServlet" id="searchform">
	<table width="100%" border="0" cellspacing="0">
		<tr style="height: 150px">
			<td style="text-align:right;padding-right:520px; font-size: 15px;padding-top: 12px">
				<input type="text" name="textfield" width="380px" style="height: 30px;" class="inputtable" id="textfield" value="请输入商品"
				onmouseover="this.focus();"
				onclick="my_click(this, 'textfield');"
				onBlur="my_blur(this, 'textfield');"/> 
				<a href="#">
					<img src="${pageContext.request.contextPath}/resources/client/images/btnSearch.jpg" border="0" style="margin-bottom:-4px" onclick="search()"/>
				</a>
			</td>
		</tr>
	</table>
</form>
</div>