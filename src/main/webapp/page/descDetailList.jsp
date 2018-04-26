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
	var detailListId;
	function createDetailListLi(){
		$.ajax({   
			type:"POST", //提交方式   
			url:"<%=path%>/detailList/queryUserDetailList.do",//路径
			data:{
				"detailListName":$("#detailListName").val()
			},//数据，这里使用的是Json格式进行传输   
			success:function(data) {//返回数据根据结果进行相应的处理
				$("#workDetailListUl").html("");
				for(var i = 0 ; i < data.length; i++){
					var createLi = "<li class='slot-item' onclick='pitchDetailList(this,&quot;"+data[i].id+"&quot;);'><div class='slot-handler'>"+
							"<div class='slot-handler clearfix'><div class='avator'><img src='<%=path %>/page/images/avatar5.jpg' />"+
							"</div><div class='content'><div class='item-title'>"+data[i].detailListName+"</div></div></div></div></li>";
					$("#workDetailListUl").append(createLi);
				}
				$("#detailListName").val("");
				$("#workSlot").html("");
				$("#workListUl").html("");
				$("#queryDetailListModal").modal("hide");
			}
		});
	}
	function pitchDetailList(obj,detailListId){
		var lis = $(obj).parent().find("li");
		for(var i = 0 ; i < lis.length;i++){
			lis[i].style.background="#FFF";
		}
		obj.style.background="#64d6f4";
		createWorkLi(detailListId);
		this.detailListId = detailListId;
	}
	function editDetailList(){
		window.location.href="<%=path%>/detailList/editDetailList.do?detailListId="+detailListId;
	}
	function createWorkLi(detailListId){
		$.ajax({   
			type:"POST", //提交方式   
			url:"<%=path%>/work/queryDetailListWork.do",//路径
			data:{
				"id":detailListId
			},//数据，这里使用的是Json格式进行传输   
			success:function(data) {//返回数据根据结果进行相应的处理
				$("#workSlot").html("");
				if(data.noTypeWorkList.length>0){
					var noTypeWorkDiv = "";
					noTypeWorkDiv+="<div style='width:100%;'>";
					noTypeWorkDiv+="<div class='slot' style='width: 100%;min-height: 100px;border: 0;'><ul class='slot-list'>";
					for(var i = 0 ; i < data.noTypeWorkList.length;i++){
						noTypeWorkDiv+= "<li class='slot-item'><div class='slot-handler'><div class='slot-handler clearfix'><div class='avator'><img src='images/avatar6.jpg' />"+
						"</div><div class='content'><div class='item-title'>"+data.noTypeWorkList[i].workName+"</div>"+
						"<div align='right'><button class='btn btn-default' onclick='easyWork();'>简介</button>"+
						"<button class='btn btn-default' onclick='descWork();'>详细</button></div></div></div></div></li>";
					}
					noTypeWorkDiv+="</ul>";
					noTypeWorkDiv+="</div></div>";
					$("#workSlot").append(noTypeWorkDiv);
				}
				if(data.typeWorkListDto.length>0){
					var typeWorkDiv = "";
					for(var i = 0 ; i < data.typeWorkListDto.length; i++){
						typeWorkDiv+="<div style='width:100%;'><div>";
						typeWorkDiv+= "<label>"+data.typeWorkListDto[i].workTypeName+"</label>";
						typeWorkDiv+="</div><div class='slot' style='width: 100%;min-height: 110px;border: 0;'><ul class='slot-list'>";
						for(var j = 0 ; j < data.typeWorkListDto[i].list.length;j++){
							typeWorkDiv+= "<li class='slot-item'><div class='slot-handler'><div class='slot-handler clearfix'><div class='avator'><img src='images/avatar6.jpg' />"+
							"</div><div class='content'><div class='item-title'>"+data.typeWorkListDto[i].list[j].workName+"</div>"+
							"<div align='right'><button class='btn btn-default' onclick='easyWork();'>简介</button>"+
							"<button class='btn btn-default' onclick='descWork();'>详细</button></div></div></div></div></li>";
							//$("#workSlot").append(createLi);
						}
						typeWorkDiv+="</ul>";
						typeWorkDiv+="</div></div>";
					}
					$("#workSlot").append(typeWorkDiv);
				}
				
			}
		});
	}
	function descWork(){
		window.location.href="<%=path%>/page/queryWork.jsp";
	}
	function easyWork(){
		$("#addWorkModal").modal();
	}
	function addDetailList(){
		window.location.href="<%=path%>/page/addDetailList.jsp";
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
	function addDetailWork(){
		var colors = [];
		var lis = $("#workDetailListUl").find("li");
		for(var i = 0 ; i < lis.length ; i++){
			colors.push(lis[i].style.backgroundColor);
		}
		if(IsInArray(colors,"rgb(100, 214, 244)")){
			$("#addWorkModal").modal();
		}else{
			alert("请选择需要增加工作的清单!");
		}
	}
	function IsInArray(arr,val){ 
		var testStr=','+arr.join(",")+","; 
		return testStr.indexOf(","+val+",")!=-1; 
	}
	$(function(){
		$("#cp1,#cp2,#cp3,#cp4,#cp5,#cp6,#cp7").colorpicker();
		createDetailListLi();
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
						<label style="cursor:pointer;" onclick="editDetailList();">编辑</label>
						<label style="cursor:pointer;" data-toggle="modal" data-target="#queryDetailListModal">筛选</label>
					</div>
				</div>
				<div class="slot-title bg-red border-red">清单工作列表
					<div style="float: right;" align="right">
						<label style="cursor:pointer;" data-toggle="modal" onclick="addDetailWork();">新增</label>
						<label style="cursor:pointer;" data-toggle="modal" data-target="#queryWorkModal">筛选</label>
					</div>
				</div>
				<div class="slot border-red">
					<div style="width:100%;">
						<div class="slot" style="width: 100%;min-height: 150px;border: 0;">
							<ul id="workDetailListUl" class="slot-list">
							</ul>
						</div>
					</div>
				</div>
				<div class="slot border-red" id="workSlot">
				</div>
			</div>
		</section>
		<!-- 清单搜索modal -->
		<div class="modal fade" id="queryDetailListModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
							&times;
						</button>
						<h4 class="modal-title" id="myModalLabel">
							清单搜索条件
						</h4>
					</div>
					<div class="modal-body">
						<div>
							<div class="container">
								<form class="form-horizontal" role="form">
									<div class="row">
										<div class="form-group">
											<div class="col-lg-12">
												<label class="col-md-3">清单名称</label>
												<div class="col-md-9">
													<input class="form-control" id="detailListName" type="text">
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
						<button type="button" class="btn btn-primary" onclick="createDetailListLi();">
							查询
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
												<label class="col-md-3">工作类别</label>
												<div class="col-md-9">
													<input class="form-control" id="workName" type="text">
												</div>
											</div>
										</div>
									</div>
									<div class="row">
										<div class="form-group">
											<div class="col-lg-12">
												<label class="col-md-3">工作名称</label>
												<div class="col-md-9">
													<input class="form-control" id="workName" type="text">
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