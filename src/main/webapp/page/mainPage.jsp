<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="./include.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>首页</title>
<style type="text/css">
#backgroundDiv ul {
	font-size: 18px;
	font-weight: bold;
}

#backgroundDiv ul li {
	text-decoration: none; /*去掉前面的圆点*/
	list-style: none;
	float: left;
	margin-left: 10px;
}

#backgroundDiv li a {
	color: white;
}

#systemName {
	float: left;
}

#userInfo {
	float: right;
}

#clear {
	clear: both;
}

#welcomeLogin {
	padding-top: 45px;
}
.navbar-default .navbar-brand{
	color: #fbfbfb;
}
.title{
	padding-bottom: 5px;
}
</style>

<script type="text/javascript">
	function loadPage(path) {
		document.getElementById("external-frame").src = path;
	}
	function reinitIframe() {
		var iframe = document.getElementById("external-frame");
		try {
			var bHeight = iframe.contentWindow.document.body.scrollHeight;
			var dHeight = iframe.contentWindow.document.documentElement.scrollHeight;
			var height = Math.max(bHeight, dHeight);
			iframe.height = height;
		} catch (ex) {
		}
	}
	$(function() {
		window.setInterval("reinitIframe()", 200);
	});
</script>
</head>
<body style="overflow-x: hidden">
	<div style="padding-top: 10px;"></div>
	<div id="title">
		<div class="row">
			<div id="companyInfo" class="col-md-9">
				<div class="col-md-3">
					<img src="<%=path%>/page/images/logo.jpg" alt="" width="230px" height="65px"/>
				</div>
				<div class="col-md-9" style="margin-top: 25px;">
					<h4>三一集团清单管理系统</h4>
				</div>
			</div>
			<div id="userInfo" class="col-md-3">
				<div id="welcomeLogin"></div>
				欢迎您,颜峰 <a href="#"> <i class="glyphicon glyphicon-user">个人中心</i></a>
				<a data-toggle="tooltip" title="6个工作事项" class="top-block" href="#" onclick="loadPage('<%=path%>/page/work.jsp');">
		            <i class="glyphicon glyphicon-exclamation-sign">工作事项</i>
		            <span class="notification">(6)</span>
		        </a>
			</div>
		</div>
	</div>
	<nav class="navbar navbar-default" role="navigation">
		<div class="container-fluid" style="background-color: #bd0625e6;"> 
		    <div class="navbar-header">
		        <a class="navbar-brand" href="#" onclick="loadPage('<%=path%>/page/descDetailList.jsp');">首页</a>
		        <a class="navbar-brand" href="#" onclick="loadPage('<%=path%>/page/addWork.jsp');">工作录入</a>
		        <a class="navbar-brand" href="#" onclick="loadPage('<%=path%>/detailList/queryDetailListManager.do');">清单管理</a>
		        <a class="navbar-brand" href="#" onclick="loadPage('<%=path%>/work/queryWorkManager.do');">工作管理</a>
		        <a class="navbar-brand" href="#" onclick="loadPage('<%=path%>/page/templateManager.jsp');">模板管理</a>
		        <a class="navbar-brand" href="#" onclick="loadPage('<%=path%>/page/opDetailList.jsp');">查看他人清单</a>
		        <a class="navbar-brand" href="#" onclick="loadPage('<%=path%>/workLabel/query.do');">工作标签管理</a>
		        <a class="navbar-brand" href="#" onclick="loadPage('<%=path%>/mettingType/query.do');">会议类型管理</a>
		    </div>
		</div>
	</nav>
	<div id="main" class="content">
		<iframe id="external-frame" src="<%=path%>/page/descDetailList.jsp" width="100%" frameborder="0" scrolling="no"></iframe>
	</div>
	<div id="footer"></div>
</body>
</html>


