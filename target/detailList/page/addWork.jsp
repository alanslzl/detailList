<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="./include.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>工作录入</title>
<style type="text/css">
.form-control {
	width: 100%;
}

#curxNodes {
	border: 1px solid black;
}

.modal.in .modal-dialog {
	-webkit-transform: translate(0, -50%);
	-ms-transform: translate(0, -50%);
	-o-transform: translate(0, -50%);
	transform: translate(0, -50%)
}

.modal-dialog {
	position: absolute;
	width: auto;
	margin: 10px auto;
	left: 0;
	right: 0;
	top: 50%
}

@media ( min-width :768px) {
	.modal-dialog {
		width: 600px
	}
}
</style>
</head>
<script type="text/javascript">
	$(function() {
		$('#finishTime').datetimepicker({
			language : 'zh-CN',
			format : 'yyyy-mm-dd',//显示格式,
			todayHighlight : 1,//今天高亮
			minView : "month",//设置只显示到月份
			weekStart : 1,
			todayBtn : 1,
			autoclose : 1,
			todayHighlight : 1,
			startView : 2,
			minView : 2,
			forceParse : 0
		});
		$('#mettingTime').datetimepicker({
			language : 'zh-CN',
			format : 'yyyy-mm-dd',//显示格式,
			todayHighlight : 1,//今天高亮
			minView : "month",//设置只显示到月份
			weekStart : 1,
			todayBtn : 1,
			autoclose : 1,
			todayHighlight : 1,
			startView : 2,
			minView : 2,
			forceParse : 0
		});
		$(".nodeFinishTime").datetimepicker({
			language : 'zh-CN',
			format : 'yyyy-mm-dd',//显示格式,
			todayHighlight : 1,//今天高亮
			minView : "month",//设置只显示到月份
			weekStart : 1,
			todayBtn : 1,
			autoclose : 1,
			todayHighlight : 1,
			startView : 2,
			minView : 2,
			forceParse : 0
		});
		$("#node1").hide();
		$("#node2").hide();
		$("#node3").hide();
		$("#detailed").hide();
		$("#detailed2").hide();
		$("#detailed3").hide();
		$("#data1").hide();
		$("#data2").hide();
	});

	function addCruxNode() {
		var node1 = document.getElementById("node1").style.display;
		var node2 = document.getElementById("node2").style.display;
		if (node1 == "none") {
			$("#node1").show();
		}
		if (node1 == "block") {
			$("#node2").show();
		}
		if (node2 == "block") {
			$("#node3").show();
		}

	}
	
	
	
	function addData() {
	var node1 = document.getElementById("data1").style.display;
	if (node1 == "none") {
			$("#data1").show();
		}else{
			$("#data2").show();
		}
	
	}
	function addDetailed() {
	var node1 = document.getElementById("detailed").style.display;
	if (node1 == "none") {
			$("#detailed").show();
		}else{
			$("#detailed").hide();
		}
	}
	
	function addDetailed2() {
	var node1 = document.getElementById("detailed2").style.display;
	if (node1 == "none") {
			$("#detailed2").show();
		}else{
			$("#detailed2").hide();
		}
	}
	
	function addDetailed3() {
	var node1 = document.getElementById("detailed3").style.display;
	if (node1 == "none") {
			$("#detailed3").show();
		}else{
			$("#detailed3").hide();
		}
	}
	$(document).ready(function() {
		$("#show1").click(function() {
			$("#node1").hide();
		});
	})
	$(document).ready(function() {
		$("#show2").click(function() {
			$("#node2").hide();
		});
	})
	$(document).ready(function() {
		$("#show3").click(function() {
			$("#node3").hide();
		});
	})
</script>
<body>
	<div class="container">
		<div style="padding-top: 20px;"></div>
		<form class="form-horizontal" role="form">
			<div class="row">
				<div class="form-group">
					<div class="col-lg-12">
						<label class="col-md-1">工作名称</label>
						<div class="col-md-9">
							<input class="form-control" id="focusedInput" type="text">
						</div>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="form-group">
					<div class="col-lg-6">
						<label class="col-md-2">责任人</label>
						<div class="col-md-10">
							<select class="selectpicker">
								<option value="1">江董</option>
							</select>
						</div>
					</div>
					<div class="col-lg-6">
						<label class="col-md-2">督办人</label>
						<div class="col-md-10">
							<select class="selectpicker">
								<option value="1">林霖</option>
							</select>
						</div>
					</div>
				</div>
			</div>
				<div class="row">
				<div class="form-group">
					<div class="col-lg-12">
						<label class="col-md-1">工作要求</label>
						<div class="col-md-9">
							<textarea class="form-control" rows="5" cols="5"></textarea>
						</div>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="form-group">
					<div class="col-lg-12">
						<label class="col-md-1">详细信息+</label>
						<div class="col-md-5">
							<button type="button" class="btn btn-default"
								onclick="addDetailed()">详细信息</button>
						</div>
						<div class="col-md-6" style="padding-left: 20px;">
							<button  type="button" class="btn btn-default"  onclick="addData()">多条工作</button>
						</div>
					</div>	
				</div>
			</div>
			<div id="detailed">
			<div class="row">
				<div class="form-group">
					<div class="col-lg-6">
						<label class="col-md-2">会议类型</label>
						<div class="col-md-10">
							<select class="selectpicker">
								<option value="1">国际化</option>
							</select>
						</div>
					</div>
					<div class="col-lg-6">
						<label class="col-md-2">工作单位</label>
						<div class="col-md-10">
							<select class="selectpicker">
								<option value="1">国际总部</option>
							</select>
						</div>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="form-group">
					<div class="col-lg-6">
						<label class="col-md-2">完成日期</label>
						<div class="col-md-6">
							<input type="text" class="form-control" id="finishTime">
						</div>
					</div>
					<div class="col-lg-6">
						<label class="col-md-2">工作标签</label>
						<div class="col-md-10">
							<select class="selectpicker" size="50">
								<option value="1">重工</option>
							</select>
						</div>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="form-group">
					<div class="col-lg-6">
						<label class="col-md-2">会议时间</label>
						<div class="col-md-6">
							<input type="text" class="form-control" id="mettingTime">
						</div>
					</div>
					<div class="col-lg-6">
						<label class="col-md-2">工作状态</label>
						<div class="col-md-10">
							<select class="selectpicker" size="50">
								<option value="1">未完成</option>
								<option value="2">进行中</option>
								<option value="3">已完成</option>
							</select>
						</div>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="form-group">
					<div class="col-lg-6">
						<label class="col-md-2">工作等级</label>
						<div class="col-md-10">
							<select class="selectpicker" size="50">
								<option value="1">A</option>
								<option value="2">B</option>
								<option value="3">C</option>
							</select>
						</div>
					</div>
					<div class="col-lg-6">
						<label class="col-md-2">录入单位</label>
						<div class="col-md-10">
							<select class="selectpicker" size="50">
								<option value="1">人事</option>
								<option value="2">行政</option>
								<option value="3">运营</option>
							</select>
						</div>
					</div>
				</div>
			</div>
				<div class="row">
					<div class="form-group">
						<div class="col-lg-12">
							<label class="col-md-1">督办策略</label>
							<div class="col-md-9">
								<textarea class="form-control" rows="5" cols="5"></textarea>
							</div>
						</div>
					</div>
			</div>
			<div class="row">
				<div class="form-group">
					<div class="col-lg-12">
						<label class="col-md-1">关键节点+</label>
						<div class="col-md-11">
							<button type="button" class="btn btn-default"
								onclick="addCruxNode();">增加关键节点</button>
						</div>
					</div>
				</div>
			</div>
			<div style="width: 100%;" id="node1">
				<div class="row">
					<div class="form-group">
						<div class="col-lg-12">
							<label class="col-md-1">关键节点</label>
							<div class="col-md-9">
								<input class="form-control" id="focusedInput" type="text">
							</div>
							<div class="col-md-1">
								<button id="show1" type="button" class="btn btn-default">
									<span class="glyphicon glyphicon-sort-by-attributes-alt"></span>
								</button>
							</div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="form-group">
						<div class="col-lg-12">
							<label class="col-md-1">节点内容</label>
							<div class="col-md-9">
								<textarea class="form-control" rows="5" cols="5"></textarea>
							</div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="form-group">
						<div class="col-lg-6">
							<label class="col-md-2">完成日期</label>
							<div class="col-md-6">
								<input type="text" class="form-control" id="finishTime">
							</div>
						</div>
						<div class="col-lg-5">
							<label class="col-md-3">节点负责人</label>
							<div class="col-md-5">
								<select class="selectpicker">
									<option value="1">张三</option>
									<option value="2">李四</option>
									<option value="3">王五</option>
								</select>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div style="padding-top: 20px;"></div>
			<div style="width: 100%;" id="node2">
				<div class="row">
					<div class="form-group">
						<div class="col-lg-12">
							<label class="col-md-1">关键节点</label>
							<div class="col-md-9">
								<input class="form-control" id="focusedInput" type="text">
							</div>
							<div class="col-md-1">
								<button id="show1" type="button" class="btn btn-default">
									<span class="glyphicon glyphicon-sort-by-attributes-alt"></span>
								</button>
							</div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="form-group">
						<div class="col-lg-12">
							<label class="col-md-1">节点内容</label>
							<div class="col-md-9">
								<textarea class="form-control" rows="5" cols="5"></textarea>
							</div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="form-group">
						<div class="col-lg-6">
							<label class="col-md-2">完成日期</label>
							<div class="col-md-6">
								<input type="text" class="form-control" id="finishTime">
							</div>
						</div>
						<div class="col-lg-5">
							<label class="col-md-3">节点负责人</label>
							<div class="col-md-5">
								<select class="selectpicker">
									<option value="1">张三</option>
									<option value="2">李四</option>
									<option value="3">王五</option>
								</select>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div style="padding-top: 20px;"></div>
			<div style="width: 100%;" id="node3">
				<div class="row">
					<div class="form-group">
						<div class="col-lg-12">
							<label class="col-md-1">关键节点</label>
							<div class="col-md-9">
								<input class="form-control" id="focusedInput" type="text">
							</div>
							<div class="col-md-1">
								<button id="show1" type="button" class="btn btn-default">
									<span class="glyphicon glyphicon-sort-by-attributes-alt"></span>
								</button>
							</div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="form-group">
						<div class="col-lg-12">
							<label class="col-md-1">节点内容</label>
							<div class="col-md-9">
								<textarea class="form-control" rows="5" cols="5"></textarea>
							</div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="form-group">
						<div class="col-lg-6">
							<label class="col-md-2">完成日期</label>
							<div class="col-md-6">
								<input type="text" class="form-control" id="finishTime">
							</div>
						</div>
						<div class="col-lg-5">
							<label class="col-md-3">节点负责人</label>
							<div class="col-md-5">
                              <select class="selectpicker">
									<option value="1">张三</option>
									<option value="2">李四</option>
									<option value="3">王五</option>
								</select>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div style="padding-top: 30px;"></div>
			<div class="row">
				<div class="form-group">
					<div class="col-lg-12">
						<label class="col-md-1">附件</label>
						<div class="col-md-11">
							<input type="file">
						</div>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="form-group">
					<div class="col-lg-12">
						<label class="col-md-1">是否与其他工作合并</label>
						<div class="col-md-10" style="padding-left: 20px;">
							<button type="button" class="btn btn-default" data-toggle="modal"
								data-target="#myModal">合并工作</button>
						</div>
					</div>
				</div>
			</div>
			
		</div>
		<div style="padding-top: 50px;"></div>
		<div id="data1">
		<div class="row">
				<div class="form-group">
					<div class="col-lg-12">
						<label class="col-md-1">工作名称</label>
						<div class="col-md-9">
							<input class="form-control" id="focusedInput" type="text">
						</div>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="form-group">
					<div class="col-lg-6">
						<label class="col-md-2">责任人</label>
						<div class="col-md-10">
							<select class="selectpicker">
								<option value="1">江董</option>
							</select>
						</div>
					</div>
					<div class="col-lg-6">
						<label class="col-md-2">督办人</label>
						<div class="col-md-10">
							<select class="selectpicker">
								<option value="1">林霖</option>
							</select>
						</div>
					</div>
				</div>
			</div>
				<div class="row">
				<div class="form-group">
					<div class="col-lg-12">
						<label class="col-md-1">工作要求</label>
						<div class="col-md-9">
							<textarea class="form-control" rows="5" cols="5"></textarea>
						</div>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="form-group">
					<div class="col-lg-12">
						<label class="col-md-1">详细信息+</label>
						<div class="col-md-5">
							<button type="button" class="btn btn-default"
								onclick="addDetailed2()">详细信息</button>
						</div>
					</div>	
				</div>
			</div>
			<div id="detailed2">
			<div class="row">
				<div class="form-group">
					<div class="col-lg-6">
						<label class="col-md-2">会议类型</label>
						<div class="col-md-10">
							<select class="selectpicker">
								<option value="1">国际化</option>
							</select>
						</div>
					</div>
					<div class="col-lg-6">
						<label class="col-md-2">工作单位</label>
						<div class="col-md-10">
							<select class="selectpicker">
								<option value="1">国际总部</option>
							</select>
						</div>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="form-group">
					<div class="col-lg-6">
						<label class="col-md-2">完成日期</label>
						<div class="col-md-6">
							<input type="text" class="form-control" id="finishTime">
						</div>
					</div>
					<div class="col-lg-6">
						<label class="col-md-2">工作标签</label>
						<div class="col-md-10">
							<select class="selectpicker" size="50">
								<option value="1">重工</option>
							</select>
						</div>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="form-group">
					<div class="col-lg-6">
						<label class="col-md-2">会议时间</label>
						<div class="col-md-6">
							<input type="text" class="form-control" id="mettingTime">
						</div>
					</div>
					<div class="col-lg-6">
						<label class="col-md-2">工作状态</label>
						<div class="col-md-10">
							<select class="selectpicker" size="50">
								<option value="1">未完成</option>
								<option value="2">进行中</option>
								<option value="3">已完成</option>
							</select>
						</div>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="form-group">
					<div class="col-lg-6">
						<label class="col-md-2">工作等级</label>
						<div class="col-md-10">
							<select class="selectpicker" size="50">
								<option value="1">A</option>
								<option value="2">B</option>
								<option value="3">C</option>
							</select>
						</div>
					</div>
					<div class="col-lg-6">
						<label class="col-md-2">录入单位</label>
						<div class="col-md-10">
							<select class="selectpicker" size="50">
								<option value="1">人事</option>
								<option value="2">行政</option>
								<option value="3">运营</option>
							</select>
						</div>
					</div>
				</div>
			</div>
			<div class="row">
					<div class="form-group">
						<div class="col-lg-12">
							<label class="col-md-1">督办策略</label>
							<div class="col-md-9">
								<textarea class="form-control" rows="5" cols="5"></textarea>
							</div>
						</div>
					</div>
			</div>
			<div class="row">
				<div class="form-group">
					<div class="col-lg-12">
						<label class="col-md-1">关键节点+</label>
						<div class="col-md-11">
							<button type="button" class="btn btn-default"
								onclick="addCruxNode();">增加关键节点</button>
						</div>
					</div>
				</div>
			</div>
			<div style="width: 100%;" id="node1">
				<div class="row">
					<div class="form-group">
						<div class="col-lg-12">
							<label class="col-md-1">关键节点</label>
							<div class="col-md-9">
								<input class="form-control" id="focusedInput" type="text">
							</div>
							<div class="col-md-1">
								<button id="show1" type="button" class="btn btn-default">
									<span class="glyphicon glyphicon-sort-by-attributes-alt"></span>
								</button>
							</div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="form-group">
						<div class="col-lg-12">
							<label class="col-md-1">节点内容</label>
							<div class="col-md-9">
								<textarea class="form-control" rows="5" cols="5"></textarea>
							</div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="form-group">
						<div class="col-lg-6">
							<label class="col-md-2">完成日期</label>
							<div class="col-md-6">
								<input type="text" class="form-control" id="finishTime">
							</div>
						</div>
						<div class="col-lg-5">
							<label class="col-md-3">节点负责人</label>
							<div class="col-md-5">
								<select class="selectpicker">
									<option value="1">张三</option>
									<option value="2">李四</option>
									<option value="3">王五</option>
								</select>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div style="padding-top: 20px;"></div>
			<div style="width: 100%;" id="node2">
				<div class="row">
					<div class="form-group">
						<div class="col-lg-12">
							<label class="col-md-1">关键节点</label>
							<div class="col-md-9">
								<input class="form-control" id="focusedInput" type="text">
							</div>
							<div class="col-md-1">
								<button id="show1" type="button" class="btn btn-default">
									<span class="glyphicon glyphicon-sort-by-attributes-alt"></span>
								</button>
							</div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="form-group">
						<div class="col-lg-12">
							<label class="col-md-1">节点内容</label>
							<div class="col-md-9">
								<textarea class="form-control" rows="5" cols="5"></textarea>
							</div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="form-group">
						<div class="col-lg-6">
							<label class="col-md-2">完成日期</label>
							<div class="col-md-6">
								<input type="text" class="form-control" id="finishTime">
							</div>
						</div>
						<div class="col-lg-5">
							<label class="col-md-3">节点负责人</label>
							<div class="col-md-5">
								<select class="selectpicker">
									<option value="1">张三</option>
									<option value="2">李四</option>
									<option value="3">王五</option>
								</select>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div style="padding-top: 20px;"></div>
			<div style="width: 100%;" id="node3">
				<div class="row">
					<div class="form-group">
						<div class="col-lg-12">
							<label class="col-md-1">关键节点</label>
							<div class="col-md-9">
								<input class="form-control" id="focusedInput" type="text">
							</div>
							<div class="col-md-1">
								<button id="show1" type="button" class="btn btn-default">
									<span class="glyphicon glyphicon-sort-by-attributes-alt"></span>
								</button>
							</div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="form-group">
						<div class="col-lg-12">
							<label class="col-md-1">节点内容</label>
							<div class="col-md-9">
								<textarea class="form-control" rows="5" cols="5"></textarea>
							</div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="form-group">
						<div class="col-lg-6">
							<label class="col-md-2">完成日期</label>
							<div class="col-md-6">
								<input type="text" class="form-control" id="finishTime">
							</div>
						</div>
						<div class="col-lg-5">
							<label class="col-md-3">节点负责人</label>
							<div class="col-md-5">
                              <select class="selectpicker">
									<option value="1">张三</option>
									<option value="2">李四</option>
									<option value="3">王五</option>
								</select>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div style="padding-top: 30px;"></div>
			<div class="row">
				<div class="form-group">
					<div class="col-lg-12">
						<label class="col-md-1">附件</label>
						<div class="col-md-11">
							<input type="file">
						</div>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="form-group">
					<div class="col-lg-12">
						<label class="col-md-1">是否与其他工作合并</label>
						<div class="col-md-10" style="padding-left: 20px;">
							<button type="button" class="btn btn-default" data-toggle="modal"
								data-target="#myModal">合并工作</button>
						</div>
					</div>
				</div>
			</div>
		</div>
		</div>
		<div style="padding-top: 50px;"></div>
		<div id="data2">
		<div class="row">
				<div class="form-group">
					<div class="col-lg-12">
						<label class="col-md-1">工作名称</label>
						<div class="col-md-9">
							<input class="form-control" id="focusedInput" type="text">
						</div>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="form-group">
					<div class="col-lg-6">
						<label class="col-md-2">责任人</label>
						<div class="col-md-10">
							<select class="selectpicker">
								<option value="1">江董</option>
							</select>
						</div>
					</div>
					<div class="col-lg-6">
						<label class="col-md-2">督办人</label>
						<div class="col-md-10">
							<select class="selectpicker">
								<option value="1">林霖</option>
							</select>
						</div>
					</div>
				</div>
			</div>
				<div class="row">
				<div class="form-group">
					<div class="col-lg-12">
						<label class="col-md-1">工作要求</label>
						<div class="col-md-9">
							<textarea class="form-control" rows="5" cols="5"></textarea>
						</div>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="form-group">
					<div class="col-lg-12">
						<label class="col-md-1">详细信息+</label>
						<div class="col-md-11">
							<button type="button" class="btn btn-default"
								onclick="addDetailed3()">详细信息</button>
						</div>
					</div>	
				</div>
			</div>
			<div id="detailed3">
			<div class="row">
				<div class="form-group">
					<div class="col-lg-6">
						<label class="col-md-2">会议类型</label>
						<div class="col-md-10">
							<select class="selectpicker">
								<option value="1">国际化</option>
							</select>
						</div>
					</div>
					<div class="col-lg-6">
						<label class="col-md-2">工作单位</label>
						<div class="col-md-10">
							<select class="selectpicker">
								<option value="1">国际总部</option>
							</select>
						</div>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="form-group">
					<div class="col-lg-6">
						<label class="col-md-2">完成日期</label>
						<div class="col-md-6">
							<input type="text" class="form-control" id="finishTime">
						</div>
					</div>
					<div class="col-lg-6">
						<label class="col-md-2">工作标签</label>
						<div class="col-md-10">
							<select class="selectpicker" size="50">
								<option value="1">重工</option>
							</select>
						</div>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="form-group">
					<div class="col-lg-6">
						<label class="col-md-2">会议时间</label>
						<div class="col-md-6">
							<input type="text" class="form-control" id="mettingTime">
						</div>
					</div>
					<div class="col-lg-6">
						<label class="col-md-2">工作状态</label>
						<div class="col-md-10">
							<select class="selectpicker" size="50">
								<option value="1">未完成</option>
								<option value="2">进行中</option>
								<option value="3">已完成</option>
							</select>
						</div>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="form-group">
					<div class="col-lg-6">
						<label class="col-md-2">工作等级</label>
						<div class="col-md-10">
							<select class="selectpicker" size="50">
								<option value="1">A</option>
								<option value="2">B</option>
								<option value="3">C</option>
							</select>
						</div>
					</div>
					<div class="col-lg-6">
						<label class="col-md-2">录入单位</label>
						<div class="col-md-10">
							<select class="selectpicker" size="50">
								<option value="1">人事</option>
								<option value="2">行政</option>
								<option value="3">运营</option>
							</select>
						</div>
					</div>
				</div>
			</div>
				<div class="row">
					<div class="form-group">
						<div class="col-lg-12">
							<label class="col-md-1">督办策略</label>
							<div class="col-md-9">
								<textarea class="form-control" rows="5" cols="5"></textarea>
							</div>
						</div>
					</div>
			</div>
			<div class="row">
				<div class="form-group">
					<div class="col-lg-12">
						<label class="col-md-1">关键节点+</label>
						<div class="col-md-11">
							<button type="button" class="btn btn-default"
								onclick="addCruxNode();">增加关键节点</button>
						</div>
					</div>
				</div>
			</div>
			<div style="width: 100%;" id="node1">
				<div class="row">
					<div class="form-group">
						<div class="col-lg-12">
							<label class="col-md-1">关键节点</label>
							<div class="col-md-9">
								<input class="form-control" id="focusedInput" type="text">
							</div>
							<div class="col-md-1">
								<button id="show1" type="button" class="btn btn-default">
									<span class="glyphicon glyphicon-sort-by-attributes-alt"></span>
								</button>
							</div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="form-group">
						<div class="col-lg-12">
							<label class="col-md-1">节点内容</label>
							<div class="col-md-9">
								<textarea class="form-control" rows="5" cols="5"></textarea>
							</div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="form-group">
						<div class="col-lg-6">
							<label class="col-md-2">完成日期</label>
							<div class="col-md-6">
								<input type="text" class="form-control" id="finishTime">
							</div>
						</div>
						<div class="col-lg-5">
							<label class="col-md-3">节点负责人</label>
							<div class="col-md-5">
								<select class="selectpicker">
									<option value="1">张三</option>
									<option value="2">李四</option>
									<option value="3">王五</option>
								</select>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div style="padding-top: 20px;"></div>
			<div style="width: 100%;" id="node2">
				<div class="row">
					<div class="form-group">
						<div class="col-lg-12">
							<label class="col-md-1">关键节点</label>
							<div class="col-md-9">
								<input class="form-control" id="focusedInput" type="text">
							</div>
							<div class="col-md-1">
								<button id="show1" type="button" class="btn btn-default">
									<span class="glyphicon glyphicon-sort-by-attributes-alt"></span>
								</button>
							</div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="form-group">
						<div class="col-lg-12">
							<label class="col-md-1">节点内容</label>
							<div class="col-md-9">
								<textarea class="form-control" rows="5" cols="5"></textarea>
							</div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="form-group">
						<div class="col-lg-6">
							<label class="col-md-2">完成日期</label>
							<div class="col-md-6">
								<input type="text" class="form-control" id="finishTime">
							</div>
						</div>
						<div class="col-lg-5">
							<label class="col-md-3">节点负责人</label>
							<div class="col-md-5">
								<select class="selectpicker">
									<option value="1">张三</option>
									<option value="2">李四</option>
									<option value="3">王五</option>
								</select>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div style="padding-top: 20px;"></div>
			<div style="width: 100%;" id="node3">
				<div class="row">
					<div class="form-group">
						<div class="col-lg-12">
							<label class="col-md-1">关键节点</label>
							<div class="col-md-9">
								<input class="form-control" id="focusedInput" type="text">
							</div>
							<div class="col-md-1">
								<button id="show1" type="button" class="btn btn-default">
									<span class="glyphicon glyphicon-sort-by-attributes-alt"></span>
								</button>
							</div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="form-group">
						<div class="col-lg-12">
							<label class="col-md-1">节点内容</label>
							<div class="col-md-9">
								<textarea class="form-control" rows="5" cols="5"></textarea>
							</div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="form-group">
						<div class="col-lg-6">
							<label class="col-md-2">完成日期</label>
							<div class="col-md-6">
								<input type="text" class="form-control" id="finishTime">
							</div>
						</div>
						<div class="col-lg-5">
							<label class="col-md-3">节点负责人</label>
							<div class="col-md-5">
                              <select class="selectpicker">
									<option value="1">张三</option>
									<option value="2">李四</option>
									<option value="3">王五</option>
								</select>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div style="padding-top: 30px;"></div>
			<div class="row">
				<div class="form-group">
					<div class="col-lg-12">
						<label class="col-md-1">附件</label>
						<div class="col-md-11">
							<input type="file">
						</div>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="form-group">
					<div class="col-lg-12">
						<label class="col-md-1">是否与其他工作合并</label>
						<div class="col-md-10" style="padding-left: 20px;">
							<button type="button" class="btn btn-default" data-toggle="modal"
								data-target="#myModal">合并工作</button>
						</div>
					</div>
				</div>
			</div>
		</div>
		</div>
		<div style="padding-top: 30px;"></div>
			<div class="row">
				<div class="form-group">
					<div class="col-lg-12">
						<div class="col-md-12" align="center">
							<button class="btn btn-primary">发布</button>
							<button class="btn btn-primary">取消</button>
						</div>
					</div>
				</div>
			</div>
			<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
							<h4 class="modal-title" id="myModalLabel">工作列表</h4>
						</div>
						<div class="modal-body">
							<table class="table">
								<tbody>
									<tr>
										<td rowspan="3"
											style="vertical-align: middle; text-align: center;"><input
											type="radio" name="merge"></td>
										<td>工作名称:关于***********工作</td>
									</tr>
									<tr>
										<td>工作单位:起重机事业部</td>
									</tr>
									<tr>
										<td>责任人:张三</td>
									</tr>

									<tr>
										<td rowspan="3"
											style="vertical-align: middle; text-align: center;"><input
											type="radio" name="merge"></td>
										<td>工作名称:关于***********工作</td>
									</tr>
									<tr>
									<td>工作单位:起重机事业部</td>
									</tr>
									<tr>
										<td>责任人:张三</td>
									</tr>
									<tr>
										<td rowspan="3"
											style="vertical-align: middle; text-align: center;"><input
											type="radio" name="merge"></td>
										<td>工作名称:关于***********工作</td>
									</tr>
									<tr>
										<td>工作单位:起重机事业部</td>
									</tr>
									<tr>
										<td>责任人:张三</td>
									</tr>
									<tr>
										<td rowspan="3" style="vertical-align: middle; text-align: center;"><input type="radio" name="merge"></td>
										<td>工作名称:关于***********工作</td>
									</tr>
									<tr>
										<td>工作单位:起重机事业部</td>
									</tr>
									<tr>
										<td>责任人:张三</td>
									</tr>
								</tbody>
							</table>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-default"
								data-dismiss="modal">关闭</button>
							<button type="button" class="btn btn-primary">提交更改</button>
						</div>
					</div>
					<!-- /.modal-content -->
				</div>
			</div><!-- /.modal -->
		</form>
	</div>

</body>
</html>