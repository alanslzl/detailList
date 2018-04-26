<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="./include.jsp"%>
<html>
<head>
<meta charset="utf-8">
<title>三一集团清单管理系统</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description"
	content="Charisma, a fully featured, responsive, HTML5, Bootstrap admin template.">
<meta name="author" content="Muhammad Usman">
<link rel="shortcut icon" href="img/favicon.ico">
</head>
<body>
	<div class="ch-container">
		<div class="row">
			<div class="row">
				<div class="col-md-12 center login-header">
					<h2>三一集团清单管理系统</h2>
				</div>
				<!--/span-->
			</div>
			<!--/row-->
			<div class="row">
				<div class="well col-md-5 center login-box">
					<div class="alert alert- info">请输入您的用户名和密码.</div>
					<form class="form-horizontal" action="<%=basePath%>/login.do"
						method="post">
						<fieldset>
							<div class="input-group input-group-lg">
								<span class="input-group-addon"><i
									class="glyphicon glyphicon-user red"></i></span> <input name="account"
									type="text" class="form-control" placeholder="用户名">
							</div>
							<div class="clearfix"></div>
							<br>
							<div class="input-group input-group-lg">
								<span class="input-group-addon"><i
									class="glyphicon glyphicon-lock red"></i></span> <input
									name="password" type="password" class="form-control"
									placeholder="密码">
							</div>
							<div class="clearfix"></div>
							<div class="input-prepend">
								<label class="remember" for="remember"><input
									type="checkbox" id="remember">记住密码</label>
							</div>
							<div class="clearfix"></div>
							<p class="center col-md-5">
								<button type="submit" class="btn btn-primary">登录</button>
							</p>
						</fieldset>
					</form>
				</div>
				<!--/span-->
			</div>
			<!--/row-->
		</div>
		<!--/fluid-row-->
	</div>
	<!--/.fluid-container-->
	<!-- external javascript -->
</body>
</html>
