var interval;
window.onload = function() {
	interval = window.setInterval("changeSecond()", 1000);
};
function changeSecond() {
	var second = document.getElementById("second");
	var svalue = second.innerHTML;
	svalue = svalue - 1;
	if (svalue == 0) {
		window.clearInterval(interval);
		// 下列两行代码用于获取项目名
		var pathName = window.location.pathname.substring(1);   
		var webName = pathName == '' ? '' : pathName.substring(0, pathName.indexOf('/'));
		// 拼接访问路径名，例如：http://localhost:8080/shop/
		location.href = window.location.protocol + '//' + window.location.host + '/'+ webName + '/ToClientIndexServlet';
		return;
	}
	second.innerHTML = svalue;
}
