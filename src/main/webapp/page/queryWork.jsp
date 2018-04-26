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

.modal.in 
.modal-dialog {
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
		$("#node2").hide();
		$("#node3").hide();
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
	function model() {
		alert(11);

	}
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
							<input class="form-control" id="focusedInput" type="text"
								value="关于***********************工作">
						</div>
					</div>
				</div>
			</div>
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
					<div class="col-lg-6">
						<label class="col-md-2">完成日期</label>
						<div class="col-md-6">
							<input type="text" class="form-control" id="finishTime"
								value="2018-01-01">
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
							<input type="text" class="form-control" id="mettingTime"
								value="2018-01-01">
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
						<label class="col-md-1">工作要求</label>
						<div class="col-md-9">
							<textarea class="form-control" rows="5" cols="5">关于*********************************</textarea>
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
			<div style="padding-top: 20px;"></div>
			<div style="width: 70%; margin-left: 5%;">
				<table class="table">
					<tbody>
						<tr align="center">
							<td>节点名称</td>
							<td>1月</td>
							<td>2月</td>
							<td>3月</td>
							<td>4月</td>
							<td>5月</td>
							<td>6月</td>
						</tr>
						<tr align="center">
							<td>节点1</td>
							<td colspan="6">
								<div class="progress">
									<div class="progress-bar progress-bar-success"
										role="progressbar" aria-valuenow="60" aria-valuemin="0"
										aria-valuemax="100" style="width: 90%;">
										<span class="sr-only">90% 完成（成功）</span>
									</div>
								</div>
							</td>
						</tr>
						<tr align="center">
							<td>节点2</td>
							<td colspan="6">
								<div class="progress">
									<div class="progress-bar progress-bar-success"
										role="progressbar" aria-valuenow="60" aria-valuemin="0"
										aria-valuemax="100" style="width: 50%;">
										<span class="sr-only">90% 完成（成功）</span>
									</div>
								</div>
							</td>
						</tr>
						<tr align="center">
							<td>节点3</td>
							<td colspan="6">
								<div class="progress">
									<div class="progress-bar progress-bar-danger"
										role="progressbar" aria-valuenow="60" aria-valuemin="0"
										aria-valuemax="100" style="width: 70%;">
										<span class="sr-only">90% 完成（成功）</span>
									</div>
								</div>
							</td>
						</tr>
					</tbody>
				</table>
			</div>
			<div style="padding-top: 30px;"></div>
			<div class="row">
				<div class="form-group">
					<div class="col-lg-12" align="center">
						<div class="col-md-2">
							<label>附件</label>
						</div>
						<div class="col-md-3">
							<input type="file">
						</div>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="form-group">
					<div class="col-lg-10" align="center">
						<div class="col-md-5" style="padding-left: 20px;">
							<button type="button" class="btn btn-default" data-toggle="modal"
								data-target="#myModal">合并工作</button>
						</div>
						<div class="col-md-3" style="padding-left: 20px;">
							<button type="button" class="btn btn-default" data-toggle="modal"
								data-target="#bgModal">变更申请</button>
						</div>
						<div class="col-md-3" style="padding-left: 20px;">
							<button type="button" class="btn btn-default" data-toggle="modal"
								data-target="#jxModal">结项申请</button>
						</div>
					</div>
				</div>
			</div>
			<div style="padding-top: 30px;"></div>
			<div class="row" style="margin-left: 10%;">
				<div class="form-group">
					<div class="col-lg-12">
						<label class="col-md-2">沟通记录</label>
					</div>
				</div>
			</div>
			<div class="row" style="width: 70%; margin-left: 10%;">
				<div class="form-group">
					<div class="col-lg-12">
						<table class="table">

							<tbody>
								<tr>
									<td align="left">张三</td>
									<td align="right">2018年2月20日 17:53</td>
								</tr>
								<tr>
									<td colspan="2">面试官面试结束后直接在该任务下回复面试结果</td>
								</tr>
								<tr>
									<td align="left">李四</td>
									<td align="right">2018年2月20日 17:53</td>
								</tr>
								<tr>
									<td colspan="2">面试官面试结束后直接在该任务下回复面试结果</td>
								</tr>
								<tr>
									<td align="left">王五</td>
									<td align="right">2018年2月20日 17:53</td>
								</tr>
								<tr>
									<td colspan="2">面试官面试结束后直接在该任务下回复面试结果</td>
								</tr>
								<tr></tr>
								<tr>
									<td colspan="2"><textarea class="form-control" rows="5"
											cols="5">关于***********</textarea></td>
								</tr>
								<tr>
									<td><input type="file"></td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-md-12" align="center">
					<div class="form-group">
						<div class="col-md-12">
							<button type="button" class="btn btn-primary">提交</button>
							<button class="btn btn-primary" onclick="history.go(-1);">返回</button>
						</div>
					</div>
				</div>
			</div>

			<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
				aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal"
								aria-hidden="true">&times;</button>
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
								</tbody>
							</table>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-default"
								data-dismiss="modal">关闭</button>
							<button type="button" class="btn btn-primary">提交更改</button>
						</div>
					</div>
				</div>
				<!-- /.modal-content -->
			</div>
			<!-- /.modal -->

			<div class="modal fade" id="bgModal" tabindex="-1" role="dialog"
				aria-labelledby="bgModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal"
								aria-hidden="true">&times;</button>
							<h4 class="modal-title" id="bgModalLabel">变更申请</h4>
						</div>
						<div class="modal-body">
							<table class="table">
								<tr>
									<td style="vertical-align: middle; text-align: center;"><label>变更理由</label></td>
								</tr>
								<tr>
									<td><textarea class="form-control" rows="5" cols="5"></textarea></td>
								</tr>
								<tr>
									<td><input type="file"></td>
								</tr>
							</table>
						</div>

						<div class="modal-footer">
							<button type="button" class="btn btn-default"
								data-dismiss="modal">关闭</button>
							<button type="button" class="btn btn-primary">提交更改</button>
						</div>
					</div>
				</div>
				<!-- /.modal-content -->
			</div>
			<!-- /.modal -->


			<div class="modal fade" id="jxModal" tabindex="-1" role="dialog"
				aria-labelledby="jxModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal"
								aria-hidden="true">&times;</button>
							<h4 class="modal-title" id="jxModalLabel">结项申请</h4>
						</div>
						<div class="modal-body">
							<table class="table">
								<tr>
									<td style="vertical-align: middle; text-align: center;"><label>结项理由</label></td>
								</tr>
								<tr>
									<td><textarea class="form-control" rows="5" cols="5"></textarea></td>
								</tr>
								<tr>
									<td><input type="file"></td>
								</tr>
							</table>
						</div>

						<div class="modal-footer">
							<button type="button" class="btn btn-default"
								data-dismiss="modal">关闭</button>
							<button type="button" class="btn btn-primary">提交更改</button>
						</div>
					</div>
				</div>
				<!-- /.modal-content -->
			</div>
			<!-- /.modal -->
		</form>
	</div>

</body>
</html>