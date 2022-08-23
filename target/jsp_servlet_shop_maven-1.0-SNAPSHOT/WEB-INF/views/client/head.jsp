<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="pojo.User"%>
<script type="text/javascript">
//退出确认框
function confirm_logout() {   
    var msg = "ログアウトしますか？";
    if (confirm(msg)==true){   
    return true;   
    }else{   
    return false;   
    }   
} 
</script>
<div id="divhead">
	<table cellspacing="0" class="headtable">
		<tr>
			<td>
				<a href="${pageContext.request.contextPath }/index.jsp">
					<img src="${pageContext.request.contextPath}/resources/client/images/logo.png" width="200" height="60" border="0" />
				</a>
			</td>
			<td style="text-align:right">
				  <a href="${pageContext.request.contextPath}/ToCartServlet">カート</a>
				| <a href="${pageContext.request.contextPath}/ToMyAccountServlet">アカウント</a>
				<% 
				User user = (User) request.getSession().getAttribute("user");
				if(null == user){
				%>
				| <a href="${pageContext.request.contextPath}/ToRegisterServlet">登録</a>
				<% 	
				}else{
				%>
				| <a href="${pageContext.request.contextPath}/LoginOutServlet" onclick="javascript:return confirm_logout()">ログアウト</a>
				<br><br><br>ようこそ： ${user.username}様
				<% 	
				}
				%>			
			</td>		
		</tr>
	</table>
</div>