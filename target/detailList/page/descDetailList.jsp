<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="./include.jsp" %>
<html>
<head>
<meta charset="utf-8">
<title>查询清单</title>
<link rel="stylesheet" type="text/css" href="<%=path%>/page/css/htmleaf-demo.css">
<link rel="stylesheet" type="text/css" href="<%=path%>/page/css/dragslot.css">
<link rel="stylesheet" type="text/css" href="<%=path%>/page/css/style.css">
<link rel="stylesheet" type="text/css" href="<%=path%>/page/css/bootstrap-colorpicker.css">
<script type="text/javascript" src="<%=path%>/page/js/dragslot.js"></script>
<script type="text/javascript" src="<%=path%>/page/js/bootstrap-colorpicker.js"></script>
<script type="text/javascript">
	function pitchDetailList(obj){
		var lis = $(obj).parent().find("li");
		for(var i = 0 ; i < lis.length;i++){
			lis[i].style.background="#FFF";
		}
		obj.style.background="#64d6f4";
		$("#workListUl").toggle();
	}
	function descWork(){
		window.location.href="./queryWork.jsp";
	}
	function easyWork(){
		$("#addWorkModal").modal();
	}
	function addDetailList(){
		window.location.href="./addDetailList.jsp";
	}
	function exportDetailList(){
		$("#exportDetailListModal").modal();
	}
	function showNewExportDetailDiv(){
		$("#newExportDetailDiv").show();
		$("#hasExportDetailDiv").hide();
	}
	function showHasExportDetailDiv(){
		$("#hasExportDetailDiv").show();
		$("#newExportDetailDiv").hide();
	}
	$(function(){
		$("#workDetailListUl li:first").css("background","#64d6f4");
		$("#cp1,#cp2,#cp3,#cp4,#cp5,#cp6,#cp7").colorpicker();
	});
</script>
</head>
<body>
	<div class="row">
		<div class="col-md-12">
			<div class="col-md-12" align="right">
	   			<div class="form-group">
					<div class="col-md-12">
						<button class="btn btn-primary" onclick="addDetailList();">新增清单</button>
						<button class="btn btn-primary" onclick="exportDetailList();">导出清单</button>
					</div>
				</div>  
	   		</div>
		</div>
	</div>
	<div class="htmleaf-container">
		<section class="demo clearfix">
			<div id="dragslot" class="container">
				<div class="slot-title bg-red border-red">清单列表
					<div style="float: right;" align="right">
						<label style="cursor:pointer;" data-toggle="modal" data-target="#queryWorkModal">筛选</label>
					</div>
				</div>
				<div class="slot-title bg-yellow border-yellow">清单工作列表
					<div style="float: right;" align="right">
						<label style="cursor:pointer;" data-toggle="modal" data-target="#addWorkModal">新增</label>
						<label style="cursor:pointer;" data-toggle="modal" data-target="#queryWorkModal">筛选</label>
					</div>
				</div>
				<div class="slot border-red">
					<div style="width:100%;">
						<div class="slot" style="width: 100%;min-height: 150px;border: 0;">
							<ul id="workDetailListUl" class="slot-list">
								<li class="slot-item" onclick="pitchDetailList(this);">
									<div class="slot-handler">
										<div class="slot-handler clearfix">
											<div class="avator">
												<img src="images/avatar5.jpg" />
											</div>
											<div class="content">
												<div class="item-title">重机工作清单</div>
												<p>开始重机工作</p>
											</div>
										</div>
									</div>
								</li>
								<li class="slot-item" onclick="pitchDetailList(this);">
									<div class="slot-handler">
										<div class="slot-handler clearfix">
											<div class="avator">
												<img src="images/avatar5.jpg" />
											</div>
											<div class="content">
												<div class="item-title">泵送工作清单</div>
												<p>开始重机工作</p>
											</div>
										</div>
									</div>
								</li>
								<li class="slot-item" onclick="pitchDetailList(this);">
									<div class="slot-handler">
										<div class="slot-handler clearfix">
											<div class="avator">
												<img src="images/avatar5.jpg" />
											</div>
											<div class="content">
												<div class="item-title">重起工作清单</div>
												<p>开始重机工作</p>
											</div>
										</div>
									</div>
								</li>
								<li class="slot-item" onclick="pitchDetailList(this);">
									<div class="slot-handler">
										<div class="slot-handler clearfix">
											<div class="avator">
												<img src="images/avatar5.jpg" />
											</div>
											<div class="content">
												<div class="item-title">商务工作清单</div>
												<p>开始重机工作</p>
											</div>
										</div>
									</div>
								</li>
								<li class="slot-item" onclick="pitchDetailList(this);">
									<div class="slot-handler">
										<div class="slot-handler clearfix">
											<div class="avator">
												<img src="images/avatar5.jpg" />
											</div>
											<div class="content">
												<div class="item-title">信息化工作清单</div>
												<p>开始重机工作</p>
											</div>
										</div>
									</div>
								</li>
							</ul>
						</div>
					</div>
				</div>
				<div class="slot border-yellow">
					<ul class="slot-list" id="workListUl">
						<li class="slot-item" >
							<div class="slot-handler">
								<div class="slot-handler clearfix">
									<div class="avator">
										<img src="images/avatar6.jpg" />
									</div>
									<div class="content">
										<div class="item-title">商务工作</div>
										<p>2018-04-12早，商务会议</p>
										<div align="right">
											<button class="btn btn-default" onclick="easyWork();">简介</button>
											<button class="btn btn-default" onclick="descWork();">详细</button>
										</div>
									</div>
								</div>
							</div>
						</li>
						<li class="slot-item" onclick="descWork();">
							<div class="slot-handler clearfix">
								<div class="avator">
									<img src="images/avatar1.jpg" />
								</div>
								<div class="content">
									<div class="item-title">起重机工作</div>
									<p>2018-04-12起重机开始工作</p>
									<div align="right">
										<button class="btn btn-default" onclick="easyWork();">简介</button>
											<button class="btn btn-default" onclick="descWork();">详细</button>
									</div>
								</div>
							</div>
						</li>
						<li class="slot-item" onclick="descWork();"><div class="slot-handler">
								<div class="slot-handler clearfix">
									<div class="avator">
										<img src="images/avatar2.jpg" />
									</div>
									<div class="content">
										<div class="item-title">泵送工作</div>
										<p>泵送开始</p>
										<div style="float: right;" align="right">
											<button class="btn btn-default" onclick="easyWork();">简介</button>
											<button class="btn btn-default" onclick="descWork();">详细</button>
										</div>
									</div>

								</div>
							</div>
						</li>
						<li class="slot-item" onclick="descWork();">
							<div class="slot-handler">
								<div class="slot-handler clearfix">
									<div class="avator">
										<img src="images/avatar3.jpg" />
									</div>
									<div class="content">
										<div class="item-title">泵送+起重机</div>
										<p>泵送起重机测试</p>
										<div style="float: right;" align="right">
											<button class="btn btn-default" onclick="easyWork();">简介</button>
											<button class="btn btn-default" onclick="descWork();">详细</button>
										</div>
									</div>
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
		<div class="modal fade" id="addWorkModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog" style="width:800px;">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
							&times;
						</button>
						<h4 class="modal-title" id="myModalLabel">
							新增工作
						</h4>
					</div>
					<div class="modal-body">
						<div style="height:360px;overflow: auto;">
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
												<label class="col-md-3">工作要求</label>
												<div class="col-md-9">
													<textarea class="form-control" rows="5" cols="5"></textarea>
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
							提交
						</button>
					</div>
				</div><!-- /.modal-content -->
			</div><!-- /.modal -->
		</div>
		<div class="modal fade" id="exportDetailListModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog" style="width:800px;">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
							&times;
						</button>
						<h4 class="modal-title" id="myModalLabel">
							导出清单
						</h4>
					</div>
					<div class="modal-body">
						<div style="height:500px;overflow: auto;">
							<div class="container">
								<form class="form-horizontal" role="form">
									<div class="row">
										<div class="form-group">
											<div class="col-lg-12">
												<label class="col-md-4">选择导出方式</label>
												<div class="col-md-8">
													<input type="radio" name="exportRadio" checked="checked" onclick="showHasExportDetailDiv();"/>使用已有的清单导出模板
													<input type="radio" name="exportRadio" onclick="showNewExportDetailDiv();"/>新增清单导出模板
												</div>
											</div>
										</div>
									</div>
									<div id="hasExportDetailDiv">
										<div class="row">
											<div class="form-group">
												<div class="col-lg-12">
													<label class="col-md-4">导出模板</label>
													<div class="col-md-8">
														<select class="selectpicker">
															<option value="1">模板1</option>
															<option value="2">模板2</option>
															<option value="3">模板3</option>
														</select>
													</div>
												</div>
											</div>
										</div>
									</div>
									<div id="newExportDetailDiv" style="display: none;">
										<div class="row">
											<div class="form-group">
												<div class="col-lg-12">
													<label class="col-md-3">密级</label>
													<div class="col-md-9">
														<input class="form-control" id="focusedInput" type="text">
													</div>
													<div class="col-md-11" align="center">
														<div class="col-md-12">
															<label class="col-md-3">字体</label>
															<div class="col-md-9">
																<select class="form-control selectpicker">
																	<option value="1">宋体</option>
																	<option value="1">新宋体</option>
																	<option value="1">楷体</option>
																	<option value="1">仿宋</option>
																	<option value="1">微软雅黑</option>
																</select>
															</div>
														</div>
														<div class="col-md-12">
															<label class="col-md-3">字体大小</label>
															<div class="col-md-9">
																<select class="form-control selectpicker">
																	<option value="1">8</option>
																	<option value="1">9</option>
																	<option value="1">10</option>
																	<option value="1">10.5</option>
																	<option value="1">11</option>
																	<option value="1">12</option>
																	<option value="1">14</option>
																	<option value="1">16</option>
																	<option value="1">18</option>
																	<option value="1">20</option>
																	<option value="1">22</option>
																	<option value="1">26</option>
																	<option value="1">28</option>
																	<option value="1">36</option>
																	<option value="1">48</option>
																	<option value="1">72</option>
																</select>
															</div>
														</div>
														<div class="col-md-12">
															<label class="col-md-3">颜色</label>
															<div class="col-md-9">
																<div id="cp1" class="input-group colorpicker-component">
																	<input type="text" class="form-control" />
																	<span class="input-group-addon"><i></i></span>
																</div>
															</div>
														</div>
													</div>
												</div>
											</div>
										</div>
										<div class="row">
											<div class="form-group">
												<div class="col-lg-12">
													<label class="col-md-3">清单类型</label>
													<div class="col-md-9">
														<input class="form-control" id="focusedInput" type="text">
													</div>
													<div class="col-md-11" align="center">
														<div class="col-md-12">
															<label class="col-md-3">字体</label>
															<div class="col-md-9">
																<select class="form-control selectpicker">
																	<option value="1">宋体</option>
																	<option value="1">新宋体</option>
																	<option value="1">楷体</option>
																	<option value="1">仿宋</option>
																	<option value="1">微软雅黑</option>
																</select>
															</div>
														</div>
														<div class="col-md-12">
															<label class="col-md-3">字体大小</label>
															<div class="col-md-9">
																<select class="form-control selectpicker">
																	<option value="1">8</option>
																	<option value="1">9</option>
																	<option value="1">10</option>
																	<option value="1">10.5</option>
																	<option value="1">11</option>
																	<option value="1">12</option>
																	<option value="1">14</option>
																	<option value="1">16</option>
																	<option value="1">18</option>
																	<option value="1">20</option>
																	<option value="1">22</option>
																	<option value="1">26</option>
																	<option value="1">28</option>
																	<option value="1">36</option>
																	<option value="1">48</option>
																	<option value="1">72</option>
																</select>
															</div>
														</div>
														<div class="col-md-12">
															<label class="col-md-3">颜色</label>
															<div class="col-md-9">
																<div id="cp2" class="input-group colorpicker-component">
																	<input type="text" class="form-control" />
																	<span class="input-group-addon"><i></i></span>
																</div>
															</div>
														</div>
													</div>
												</div>
											</div>
										</div>
										<div class="row">
											<div class="form-group">
												<div class="col-lg-12">
													<label class="col-md-3">会议名称</label>
													<div class="col-md-9">
														<input class="form-control" id="focusedInput" type="text">
													</div>
													<div class="col-md-11" align="center">
														<div class="col-md-12">
															<label class="col-md-3">字体</label>
															<div class="col-md-9">
																<select class="form-control selectpicker">
																	<option value="1">宋体</option>
																	<option value="1">新宋体</option>
																	<option value="1">楷体</option>
																	<option value="1">仿宋</option>
																	<option value="1">微软雅黑</option>
																</select>
															</div>
														</div>
														<div class="col-md-12">
															<label class="col-md-3">字体大小</label>
															<div class="col-md-9">
																<select class="form-control selectpicker">
																	<option value="1">8</option>
																	<option value="1">9</option>
																	<option value="1">10</option>
																	<option value="1">10.5</option>
																	<option value="1">11</option>
																	<option value="1">12</option>
																	<option value="1">14</option>
																	<option value="1">16</option>
																	<option value="1">18</option>
																	<option value="1">20</option>
																	<option value="1">22</option>
																	<option value="1">26</option>
																	<option value="1">28</option>
																	<option value="1">36</option>
																	<option value="1">48</option>
																	<option value="1">72</option>
																</select>
															</div>
														</div>
														<div class="col-md-12">
															<label class="col-md-3">颜色</label>
															<div class="col-md-9">
																<div id="cp3" class="input-group colorpicker-component">
																	<input type="text" class="form-control" />
																	<span class="input-group-addon"><i></i></span>
																</div>
															</div>
														</div>
													</div>
												</div>
											</div>
										</div>
										<div class="row">
											<div class="form-group">
												<div class="col-lg-12">
													<label class="col-md-3">单位名称</label>
													<div class="col-md-9">
														<input class="form-control" id="focusedInput" type="text">
													</div>
													<div class="col-md-11" align="center">
														<div class="col-md-12">
															<label class="col-md-3">字体</label>
															<div class="col-md-9">
																<select class="form-control selectpicker">
																	<option value="1">宋体</option>
																	<option value="1">新宋体</option>
																	<option value="1">楷体</option>
																	<option value="1">仿宋</option>
																	<option value="1">微软雅黑</option>
																</select>
															</div>
														</div>
														<div class="col-md-12">
															<label class="col-md-3">字体大小</label>
															<div class="col-md-9">
																<select class="form-control selectpicker">
																	<option value="1">8</option>
																	<option value="1">9</option>
																	<option value="1">10</option>
																	<option value="1">10.5</option>
																	<option value="1">11</option>
																	<option value="1">12</option>
																	<option value="1">14</option>
																	<option value="1">16</option>
																	<option value="1">18</option>
																	<option value="1">20</option>
																	<option value="1">22</option>
																	<option value="1">26</option>
																	<option value="1">28</option>
																	<option value="1">36</option>
																	<option value="1">48</option>
																	<option value="1">72</option>
																</select>
															</div>
														</div>
														<div class="col-md-12">
															<label class="col-md-3">颜色</label>
															<div class="col-md-9">
																<div id="cp4" class="input-group colorpicker-component">
																	<input type="text" class="form-control" />
																	<span class="input-group-addon"><i></i></span>
																</div>
															</div>
														</div>
													</div>
												</div>
											</div>
										</div>
										<div class="row">
											<div class="form-group">
												<div class="col-lg-12">
													<label class="col-md-3">工作名称</label>
													<div class="col-md-11" align="center">
														<div class="col-md-12">
															<label class="col-md-3">字体</label>
															<div class="col-md-9">
																<select class="form-control selectpicker">
																	<option value="1">宋体</option>
																	<option value="1">新宋体</option>
																	<option value="1">楷体</option>
																	<option value="1">仿宋</option>
																	<option value="1">微软雅黑</option>
																</select>
															</div>
														</div>
														<div class="col-md-12">
															<label class="col-md-3">字体大小</label>
															<div class="col-md-9">
																<select class="form-control selectpicker">
																	<option value="1">8</option>
																	<option value="1">9</option>
																	<option value="1">10</option>
																	<option value="1">10.5</option>
																	<option value="1">11</option>
																	<option value="1">12</option>
																	<option value="1">14</option>
																	<option value="1">16</option>
																	<option value="1">18</option>
																	<option value="1">20</option>
																	<option value="1">22</option>
																	<option value="1">26</option>
																	<option value="1">28</option>
																	<option value="1">36</option>
																	<option value="1">48</option>
																	<option value="1">72</option>
																</select>
															</div>
														</div>
														<div class="col-md-12">
															<label class="col-md-3">颜色</label>
															<div class="col-md-9">
																<div id="cp5" class="input-group colorpicker-component">
																	<input type="text" class="form-control" />
																	<span class="input-group-addon"><i></i></span>
																</div>
															</div>
														</div>
													</div>
												</div>
											</div>
										</div>
										<div class="row">
											<div class="form-group">
												<div class="col-lg-12">
													<label class="col-md-3">工作内容</label>
													<div class="col-md-11" align="center">
														<div class="col-md-12">
															<label class="col-md-3">字体</label>
															<div class="col-md-9">
																<select class="form-control selectpicker">
																	<option value="1">宋体</option>
																	<option value="1">新宋体</option>
																	<option value="1">楷体</option>
																	<option value="1">仿宋</option>
																	<option value="1">微软雅黑</option>
																</select>
															</div>
														</div>
														<div class="col-md-12">
															<label class="col-md-3">字体大小</label>
															<div class="col-md-9">
																<select class="form-control selectpicker">
																	<option value="1">8</option>
																	<option value="1">9</option>
																	<option value="1">10</option>
																	<option value="1">10.5</option>
																	<option value="1">11</option>
																	<option value="1">12</option>
																	<option value="1">14</option>
																	<option value="1">16</option>
																	<option value="1">18</option>
																	<option value="1">20</option>
																	<option value="1">22</option>
																	<option value="1">26</option>
																	<option value="1">28</option>
																	<option value="1">36</option>
																	<option value="1">48</option>
																	<option value="1">72</option>
																</select>
															</div>
														</div>
														<div class="col-md-12">
															<label class="col-md-3">颜色</label>
															<div class="col-md-9">
																<div id="cp6" class="input-group colorpicker-component">
																	<input type="text" class="form-control" />
																	<span class="input-group-addon"><i></i></span>
																</div>
															</div>
														</div>
													</div>
												</div>
											</div>
										</div>
										<div class="row">
											<div class="form-group">
												<div class="col-lg-12">
													<label class="col-md-3">工作进展</label>
													<div class="col-md-11" align="center">
														<div class="col-md-12">
															<label class="col-md-3">字体</label>
															<div class="col-md-9">
																<select class="form-control selectpicker">
																	<option value="1">宋体</option>
																	<option value="1">新宋体</option>
																	<option value="1">楷体</option>
																	<option value="1">仿宋</option>
																	<option value="1">微软雅黑</option>
																</select>
															</div>
														</div>
														<div class="col-md-12">
															<label class="col-md-3">字体大小</label>
															<div class="col-md-9">
																<select class="form-control selectpicker">
																	<option value="1">8</option>
																	<option value="1">9</option>
																	<option value="1">10</option>
																	<option value="1">10.5</option>
																	<option value="1">11</option>
																	<option value="1">12</option>
																	<option value="1">14</option>
																	<option value="1">16</option>
																	<option value="1">18</option>
																	<option value="1">20</option>
																	<option value="1">22</option>
																	<option value="1">26</option>
																	<option value="1">28</option>
																	<option value="1">36</option>
																	<option value="1">48</option>
																	<option value="1">72</option>
																</select>
															</div>
														</div>
														<div class="col-md-12">
															<label class="col-md-3">颜色</label>
															<div class="col-md-9">
																<div id="cp7" class="input-group colorpicker-component">
																	<input type="text" class="form-control" />
																	<span class="input-group-addon"><i></i></span>
																</div>
															</div>
														</div>
													</div>
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
							导出
						</button>
					</div>
				</div><!-- /.modal-content -->
			</div><!-- /.modal -->
		</div>
	</div>
</body>
</html>