<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="./include.jsp" %>
<html>
<head>
<meta charset="utf-8">
<title>新增清单</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="Charisma, a fully featured, responsive, HTML5, Bootstrap admin template.">
<meta name="author" content="Muhammad Usman">
<link rel="stylesheet" type="text/css" href="<%=path%>/page/css/normalize.css" />
<link rel="stylesheet" type="text/css" href="<%=path%>/page/css/htmleaf-demo.css">
<link rel="stylesheet" type="text/css" href="<%=path%>/page/css/dragslot.css">
<link rel="stylesheet" type="text/css" href="<%=path%>/page/css/style.css">
<script type="text/javascript" src="<%=path%>/page/js/dragslot.js"></script>
<style type="text/css">
.modal.in 
.modal-dialog{-webkit-transform:translate(0,-50%);-ms-transform:translate(0,-50%);-o-transform:translate(0,-50%);transform:translate(0,-50%)}
.modal-dialog{position:absolute;width:auto;margin:10px auto;left:0;right:0;top:33%}
@media (min-width:768px){.modal-dialog{width:600px}
</style>
</head>
<body>
	<div class="row">
		<form class="form-horizontal" role="form">
			<div class="col-md-12">
				<div class="col-md-11" align="center">
					<div class="form-group">
						<label class="col-md-2">清单名称</label>
						<div class="col-md-10">
							<input class="form-control" id="focusedInput" type="text">
						</div>
					</div>
				</div>
			</div>
		</form>
	</div>
	<div class="htmleaf-container">
		<section class="demo clearfix">
			<div id="dragslot" class="container">
				<div class="slot-title bg-red border-red">工作清单</div>
				<div class="slot-title bg-yellow border-yellow">
					工作列表
					<div style="float: right;" align="right">
						<label style="cursor:pointer;" data-toggle="modal" data-target="#queryWorkModal">筛选</label>
					</div>
				</div>
				<div class="slot border-red">
					<div style="width:100%;" align="right">
						<label style="cursor:pointer;" data-toggle="modal" data-target="#myModal">增加工作类别</label>
					</div>
					<div style="width:100%;">
						<div>
							<label>营销</label>
						</div>
						<div class="slot" style="width: 100%;min-height: 150px;border: 0;">
							<ul class="slot-list">
								<li></li>
							</ul>
						</div>
					</div>
					<div style="width:100%;">
						<div>
							<label>财务</label>
						</div>
						<div class="slot" style="width: 100%;min-height: 150px;border: 0;">
							<ul class="slot-list">
								<li></li>
							</ul>
						</div>
					</div>
				</div>
				<div class="slot border-yellow">
					<ul class="slot-list">
						<li class="slot-item">
							<div class="slot-handler">
								<div class="slot-handler clearfix">
									<div class="content">
										<div class="item-title">重机工作</div>
										<p>开始重机工作</p>
									</div>
								</div>
							</div>
						</li>
						<li class="slot-item">
							<div class="slot-handler">
								<div class="slot-handler clearfix">
									<div class="avator">
										<img src="images/avatar6.jpg" />
									</div>
									<div class="content">
										<div class="item-title">商务工作</div>

										<p>2018-04-12早，商务会议</p>
									</div>

								</div>
							</div>
						</li>
						<li class="slot-item" id="a">
							<div class="slot-handler clearfix">
								<div class="avator">
									<img src="images/avatar1.jpg" />
								</div>
								<div class="content">
									<div class="item-title">起重机工作</div>

									<p>2018-04-12起重机开始工作</p>
								</div>
							</div>
						</li>
						<li class="slot-item"><div class="slot-handler">
								<div class="slot-handler clearfix">
									<div class="avator">
										<img src="images/avatar2.jpg" />
									</div>
									<div class="content">
										<div class="item-title">泵送工作</div>

										<p>泵送开始</p>
									</div>

								</div>
							</div>
						</li>
						<li class="slot-item"><div class="slot-handler">
								<div class="slot-handler clearfix">
									<div class="avator">
										<img src="images/avatar3.jpg" />
									</div>
									<div class="content">
										<div class="item-title">泵送+起重机</div>

										<p>泵送起重机测试</p>
									</div>
								</div>
						</li>
					</ul>
				</div>
			</div>
		</section>
		<!-- 模态框（Modal） -->
		<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
							&times;
						</button>
						<h4 class="modal-title" id="myModalLabel">
							新增工作类别
						</h4>
					</div>
					<div class="modal-body">
						<div class="row">
							<div class="form-group">
								<label class="col-md-3">类别名称:</label>
								<div class="col-md-9">
									<input class="form-control" id="focusedInput" type="text">
								</div>
							</div>
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">关闭
						</button>
						<button type="button" class="btn btn-primary">
							提交
						</button>
					</div>
				</div><!-- /.modal-content -->
			</div><!-- /.modal -->
		</div>
		<!-- 模态框（Modal） -->
		<div class="modal fade" id="queryWorkModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
							&times;
						</button>
						<h4 class="modal-title" id="myModalLabel">
							工作搜索条件
						</h4>
					</div>
					<div class="modal-body">
						<div style="height:300px;overflow: auto;">
							<div class="container">
								<form class="form-horizontal" role="form">
									<div class="row">
										<div class="form-group">
											<div class="col-lg-12">
												<label class="col-md-3">工作名称</label>
												<div class="col-md-9">
													<input class="form-control" id="focusedInput" type="text">
												</div>
											</div>
										</div>
									</div>
									<div class="row">
										<div class="form-group">
											<div class="col-lg-12">
												<label class="col-md-3">工作单位</label>
												<div class="col-md-9">
													<select class="form-control selectpicker">
														<option value="1">国际总部</option>
													</select>
												</div>
											</div>
										</div>
									</div>
									<div class="row">
										<div class="form-group">
											<div class="col-lg-12">
												<label class="col-md-3">责任人</label>
												<div class="col-md-9">
													<select class="form-control selectpicker">
														<option value="1">江董</option>
													</select>
												</div>
											</div>
										</div>
									</div>
									<div class="row">
										<div class="form-group">
											<div class="col-lg-12">
												<label class="col-md-3">督办人</label>
												<div class="col-md-9">
													<select class="form-control selectpicker">
														<option value="1">林霖</option>
													</select>
												</div>
											</div>
										</div>
									</div>
									<div class="row">
										<div class="form-group">
											<div class="col-lg-12">
												<label class="col-md-3">工作等级</label>
												<div class="col-md-9">
													<select class="form-control selectpicker">
														<option value="1">A</option>
													</select>
												</div>
											</div>
										</div>
									</div>
								</form>
							</div>
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">关闭
						</button>
						<button type="button" class="btn btn-primary">
							查询
						</button>
					</div>
				</div><!-- /.modal-content -->
			</div><!-- /.modal -->
		</div>
	</div>
	<div class="row">
		<div class="col-md-12">
			<div class="form-group">
				<div class="col-lg-12">
					<div class="col-md-12" align="center">
						<button class="btn btn-primary">保存</button>
						<button class="btn btn-primary">取消</button>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script>
		jQuery(function($) {
			$('#dragslot').dragslot({
				dropCallback : function(el) {
					//	alert(el);
				}
			});
		});
	</script>
</body>
</html>