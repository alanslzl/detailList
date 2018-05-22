<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="./include.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<title>清单管理</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="Charisma, a fully featured, responsive, HTML5, Bootstrap admin template.">
<meta name="author" content="Muhammad Usman">
<link rel="stylesheet" type="text/css" href="<%=path%>/page/css/htmleaf-demo.css">
<link rel="stylesheet" type="text/css" href="<%=path%>/page/css/dragslot.css">
<link rel="stylesheet" type="text/css" href="<%=path%>/page/css/style.css">
<link rel="stylesheet" type="text/css" href="<%=path%>/page/css/bootstrap-colorpicker.css">
<link rel="stylesheet" type="text/css" href="<%=path%>/page/css/bootstrap-treeview.min.css">
<script type="text/javascript" src="<%=path%>/page/js/jquery.form.js"></script>
<script type="text/javascript" src="<%=path%>/page/js/dragslot.js"></script>
<script type="text/javascript" src="<%=path%>/page/js/bootstrap-colorpicker.js"></script>
<script type="text/javascript" src="<%=path%>/page/js/bootstrap-treeview.min.js"></script>
</head>
<script type="text/javascript">
	function addTemplate(){
		$("#templateId").val("");
		$("#myModalLabel").html("新增导出模板");
		$("#templateModal").modal();
	}
	function colorRGB2Hex(color) {
	    var rgb = color.split(',');
	    var r = parseInt(rgb[0].split('(')[1]);
	    var g = parseInt(rgb[1]);
	    var b = parseInt(rgb[2].split(')')[0]);
	    var hex =  ((1 << 24) + (r << 16) + (g << 8) + b).toString(16).slice(1);
	    return hex;
	 }
	function getRGB(hex){
	    var rgb=[0,0,0];
	    if(/#(..)(..)(..)/g.test(hex)){
	        rgb=[parseInt(RegExp.$1,16),parseInt(RegExp.$2,16),parseInt(RegExp.$3,16)];
	    };
	    return "rgb("+rgb.join(",")+")";
	}
	function editTemplate(id){
		$("#myModalLabel").html("修改导出模板");
		$("#templateModal").modal();
		$.ajax({   
			type:"POST", //提交方式   
			url:"<%=path%>/template/queryById.do",//路径
			data:{
				"id":id
			},//数据，这里使用的是Json格式进行传输   
			success:function(data) {//返回数据根据结果进行相应的处理
				$("#templateId").val(data.id);
				$("#templateName").val(data.templateName);
				$("#updateTime").val(data.updateTime);
				$("#createUser").val(data.createUser);
				$("#dense").val(data.dense);
				var denseStyle = data.denseStyle;
				var denseArr = denseStyle.split("-");
				$("#denseFont").selectpicker('val',denseArr[0]);
				$('#denseSize').selectpicker('val', denseArr[1]);
				$("#denseColor").val(getRGB("#"+denseArr[2]));
				var detailTypeStyle = data.detailTypeStyle;
				var detailTypeArr = detailTypeStyle.split("-");
				$("#detailType").val(data.detailType);
				$("#detailTypeFont").selectpicker('val',detailTypeArr[0]);
				$('#detailTypeSize').selectpicker('val', detailTypeArr[1]);
				$("#detailTypeColor").val(getRGB("#"+detailTypeArr[2]));
				var mettingNameStyle = data.mettingNameStyle;
				var mettingNameArr = mettingNameStyle.split("-");
				$("#mettingName").val(data.mettingName);
				$("#mettingNameFont").selectpicker('val',mettingNameArr[0]);
				$('#mettingNameSize').selectpicker('val', mettingNameArr[1]);
				$("#mettingNameColor").val(getRGB("#"+mettingNameArr[2]));
				var companyNameStyle = data.companyStyle;
				var companyNameArr = companyNameStyle.split("-");
				$("#companyName").val(data.companyName);
				$("#companyNameFont").selectpicker('val',companyNameArr[0]);
				$('#companyNameSize').selectpicker('val', companyNameArr[1]);
				$("#companyNameColor").val(getRGB("#"+companyNameArr[2]));
				var workNameStyle = data.workNameStyle;
				var workNameArr = workNameStyle.split("-");
				$("#workNameFont").selectpicker('val',workNameArr[0]);
				$('#workNameSize').selectpicker('val', workNameArr[1]);
				$("#workNameColor").val(getRGB("#"+workNameArr[2]));
				var workContentStyle = data.workContentStyle;
				var workContentArr = workContentStyle.split("-");
				$("#workContentFont").selectpicker('val',workContentArr[0]);
				$('#workContentSize').selectpicker('val', workContentArr[1]);
				$("#workContentColor").val(getRGB("#"+workContentArr[2]));
				var workProgressStyle = data.workProgressStyle;
				var workProgressArr = workProgressStyle.split("-");
				$("#workProgressFont").selectpicker('val',workProgressArr[0]);
				$('#workProgressSize').selectpicker('val', workProgressArr[1]);
				$("#workProgressColor").val(getRGB("#"+workProgressArr[2]));
				var relationWorkStyle = data.relationWorkStyle;
				var relationWorkArr = relationWorkStyle.split("-");
				$("#relationWorkFont").selectpicker('val',relationWorkArr[0]);
				$('#relationWorkSize').selectpicker('val', relationWorkArr[1]);
				$("#relationWorkColor").val(getRGB("#"+relationWorkArr[2]));
				var nodeStyle = data.nodeStyle;
				var nodeArr = nodeStyle.split("-");
				$("#nodeFont").selectpicker('val',nodeArr[0]);
				$('#nodeSize').selectpicker('val', nodeArr[1]);
				$("#nodeColor").val(getRGB("#"+nodeArr[2]));
			}
		});
		$("#TemplateModal").modal();
	}
	function delTemplate(id){
		$.ajax({   
			type:"POST", //提交方式   
			url:"<%=path%>/template/del.do",//路径
			data:{
				"id":id
			},//数据，这里使用的是Json格式进行传输   
			success:function(data) {//返回数据根据结果进行相应的处理
				window.location.reload();
			}
		});
	}
	function mergeTemplate(){
		var templateId = $("#templateId").val();
		var url;
		if(templateId!=null && templateId!=''){
			url = "<%=path%>/template/edit.do";
		}else{
			url = "<%=path%>/template/add.do";
		}
		$.ajax({   
			type:"POST", //提交方式   
			url:url,//路径
			data:{
				"id":templateId,
				"templateName":$("#templateName").val(),
				"dense":$("#dense").val(),
				"denseStyle":$("#denseFont").val()+"-"+$("#denseSize").val()+"-"+colorRGB2Hex($("#denseColor").val()),
				"detailType":$("#detailType").val(),
				"detailTypeStyle":$("#detailTypeFont").val()+"-"+$("#detailTypeSize").val()+"-"+colorRGB2Hex($("#detailTypeColor").val()),
				"mettingName":$("#mettingName").val(),
				"mettingNameStyle":$("#mettingNameFont").val()+"-"+$("#mettingNameSize").val()+"-"+colorRGB2Hex($("#mettingNameColor").val()),
				"companyName":$("#companyName").val(),
				"companyStyle":$("#companyNameFont").val()+"-"+$("#companyNameSize").val()+"-"+colorRGB2Hex($("#companyNameColor").val()),
				"workNameStyle":$("#workNameFont").val()+"-"+$("#workNameSize").val()+"-"+colorRGB2Hex($("#workNameColor").val()),
				"workContentStyle":$("#workContentFont").val()+"-"+$("#workContentSize").val()+"-"+colorRGB2Hex($("#workContentColor").val()),
				"workProgressStyle":$("#workProgressFont").val()+"-"+$("#workProgressSize").val()+"-"+colorRGB2Hex($("#workProgressColor").val()),
				"relationWorkStyle":$("#relationWorkFont").val()+"-"+$("#relationWorkSize").val()+"-"+colorRGB2Hex($("#relationWorkColor").val()),
				"nodeStyle":$("#nodeFont").val()+"-"+$("#nodeSize").val()+"-"+colorRGB2Hex($("#nodeColor").val()),
				//"updateTime":$("#updateTime").val(),
				"createUser":$("#createUser").val()
			},//数据，这里使用的是Json格式进行传输   
			success:function(data) {//返回数据根据结果进行相应的处理
				window.location.reload();
			}
		});
	}
	$(function(){
		$("#cp1,#cp2,#cp3,#cp4,#cp5,#cp6,#cp7").colorpicker();
	});
</script>
<body>
	<div class="ch-container">
		<div style="padding-top: 10px;"></div>
		   <div class="row">
				<div class="col-md-12">
					<div class="col-md-5">
						<label class="col-md-3">模板名称</label>
						<div class="col-md-8">
							<input class="form-control" id="queryTemplateName" type="text" value="${queryTemplateName}">
						</div>
					</div>
				</div>
		   </div>
		   <div class="row">
		   		<div class="col-md12">
		   			<div class="form-group">
						<div class="col-md-11" align="right">
							<button class="btn btn-primary">查询</button>
							<button class="btn btn-primary">重置</button>
						</div>
					</div>  
		   		</div>
		   </div>
		   <div class="row">
		   		<div class="col-md-12" >
			   		<div class="col-md-6" align="left">
			   			<div class="form-group">
							<div class="col-md-6">
								<button class="btn btn-primary" onclick="addTemplate();">新增</button>
							</div>
						</div>  
			   		</div>
		   		</div>
		   </div>
		   	<div style="padding-top: 10px;"></div>
		   	<div class="row">
		   		<div id="Bar" class="col-md-12">
		   			<div class="box-content">
						<table class="table table-striped table-bordered responsive">
			                 <thead>
				                 <tr>
				                     <th>模板名称</th>
				                     <th>模板录入人</th>
				                     <th>操作</th>
				                 </tr>
			                 </thead>
			                 <tbody>
			                 	<c:forEach items="${template}" var="template">
			                 		<tr>
					                     <td class="center">${template.templateName}</td>
					                     <td class="center">${template.createUser}</td>
					                     <td class="center">
					                         <a class="btn btn-info" href="#" onclick="editTemplate('${template.id}');">
					                             <i class="glyphicon glyphicon-edit icon-white"></i>
					                             	编辑
					                         </a>
					                         <a class="btn btn-danger" href="#" onclick="delTemplate('${template.id}');">
					                             <i class="glyphicon glyphicon-trash icon-white"></i>
					                             	删除
					                         </a>
					                     </td>
					                 </tr>
			                 	</c:forEach>
			                 </tbody>
			             </table>
			             <div align="center">
							<div class="message">
		                      	  共<i class="blue">${page.total}</i>条记录，当前显示第&nbsp;<i class="blue">${page.pageNum}/${page.pages}</i>&nbsp;页
		                    </div>
		                    <div style="text-align:center;">
		                        <ul class="pagination">
		                            <c:if test="${!page.isFirstPage}">
		                                <li><a href="javascript:queryDeviceRecords(${page.firstPage});">首页</a></li>
		                                <li><a href="javascript:queryDeviceRecords(${page.prePage});">上一页</a></li>
		                            </c:if>
		                            <c:forEach items="${page.navigatepageNums}" var="navigatepageNum">
		                                <c:if test="${navigatepageNum==page.pageNum}">
		                                    <li class="active"><a href="javascript:queryAllDevices(${navigatepageNum});">${navigatepageNum}</a></li>
		                                </c:if>
		                                <c:if test="${navigatepageNum!=page.pageNum}">
		                                    <li><a href="javascript:queryDeviceRecords(${navigatepageNum});">${navigatepageNum}</a></li>
		                                </c:if>
		                            </c:forEach>
		                            <c:if test="${!page.isLastPage}">
		                                <li><a href="javascript:queryDeviceRecords(${page.nextPage});">下一页</a></li>
		                                <li><a href="javascript:queryDeviceRecords(${page.lastPage});">最后一页</a></li>
		                            </c:if>
		                        </ul>
		                    </div>
						</div>
		             </div>
				</div>
			</div>
	</div>
	<div class="modal fade" id="templateModal" tabindex="-1" role="dialog" aria-labelledby="myMettingTypeModal" aria-hidden="true">
		<div class="modal-dialog" style="width:700px;">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
						&times;
					</button>
					<h4 class="modal-title" id="myModalLabel">
					</h4>
				</div>
				<div class="modal-body">
					<div style="height:600px;overflow: auto;">
						<div class="ch-container">
							<div class="col-md-12">
								<div id="newExportDetailDiv">
										<div class="row">
											<div class="form-group">
												<div class="col-lg-12">
													<label class="col-md-3">模板名称</label>
													<div class="col-md-9">
														<input class="form-control" id="templateId" type="hidden">
														<input class="form-control" id="updateTime" type="hidden">
														<input class="form-control" id="createUser" type="hidden">
														<input class="form-control" id="templateName" type="text">
													</div>
												</div>
											</div>
											<div class="form-group">
												<div class="col-lg-12">
													<label class="col-md-3">密级</label>
													<div class="col-md-9">
														<input class="form-control" id="dense" type="text">
													</div>
													<div class="col-md-11" align="center">
														<div class="col-md-12">
															<label class="col-md-3">字体</label>
															<div class="col-md-9">
																<select class="form-control selectpicker" id="denseFont">
																	<option value="宋体">宋体</option>
																	<option value="新宋体">新宋体</option>
																	<option value="楷体">楷体</option>
																	<option value="仿宋">仿宋</option>
																	<option value="微软雅黑">微软雅黑</option>
																</select>
															</div>
														</div>
														<div class="col-md-12">
															<label class="col-md-3">字体大小</label>
															<div class="col-md-9">
																<select class="form-control selectpicker" id="denseSize">
																	<option value="16">8</option>
																	<option value="18">9</option>
																	<option value="20">10</option>
																	<option value="21">10.5</option>
																	<option value="22">11</option>
																	<option value="24">12</option>
																	<option value="28">14</option>
																	<option value="32">16</option>
																	<option value="36">18</option>
																	<option value="40">20</option>
																	<option value="44">22</option>
																	<option value="52">26</option>
																	<option value="56">28</option>
																	<option value="72">36</option>
																	<option value="96">48</option>
																	<option value="144">72</option>
																</select>
															</div>
														</div>
														<div class="col-md-12">
															<label class="col-md-3">颜色</label>
															<div class="col-md-9">
																<div id="cp1" class="input-group colorpicker-component" >
																	<input type="text" class="form-control" id="denseColor"/>
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
														<input class="form-control" id="detailType" type="text">
													</div>
													<div class="col-md-11" align="center">
														<div class="col-md-12">
															<label class="col-md-3">字体</label>
															<div class="col-md-9">
																<select class="form-control selectpicker" id="detailTypeFont">
																	<option value="宋体">宋体</option>
																	<option value="新宋体">新宋体</option>
																	<option value="楷体">楷体</option>
																	<option value="仿宋">仿宋</option>
																	<option value="微软雅黑">微软雅黑</option>
																</select>
															</div>
														</div>
														<div class="col-md-12">
															<label class="col-md-3">字体大小</label>
															<div class="col-md-9">
																<select class="form-control selectpicker" id="detailTypeSize">
																	<option value="16">8</option>
																	<option value="18">9</option>
																	<option value="20">10</option>
																	<option value="21">10.5</option>
																	<option value="22">11</option>
																	<option value="24">12</option>
																	<option value="28">14</option>
																	<option value="32">16</option>
																	<option value="36">18</option>
																	<option value="40">20</option>
																	<option value="44">22</option>
																	<option value="52">26</option>
																	<option value="56">28</option>
																	<option value="72">36</option>
																	<option value="96">48</option>
																	<option value="144">72</option>
																</select>
															</div>
														</div>
														<div class="col-md-12">
															<label class="col-md-3">颜色</label>
															<div class="col-md-9">
																<div id="cp2" class="input-group colorpicker-component" >
																	<input type="text" class="form-control" id="detailTypeColor"/>
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
														<input class="form-control" id="mettingName" type="text">
													</div>
													<div class="col-md-11" align="center">
														<div class="col-md-12">
															<label class="col-md-3">字体</label>
															<div class="col-md-9">
																<select class="form-control selectpicker" id="mettingNameFont">
																	<option value="宋体">宋体</option>
																	<option value="新宋体">新宋体</option>
																	<option value="楷体">楷体</option>
																	<option value="仿宋">仿宋</option>
																	<option value="微软雅黑">微软雅黑</option>
																</select>
															</div>
														</div>
														<div class="col-md-12">
															<label class="col-md-3">字体大小</label>
															<div class="col-md-9">
																<select class="form-control selectpicker" id="mettingNameSize">
																	<option value="16">8</option>
																	<option value="18">9</option>
																	<option value="20">10</option>
																	<option value="21">10.5</option>
																	<option value="22">11</option>
																	<option value="24">12</option>
																	<option value="28">14</option>
																	<option value="32">16</option>
																	<option value="36">18</option>
																	<option value="40">20</option>
																	<option value="44">22</option>
																	<option value="52">26</option>
																	<option value="56">28</option>
																	<option value="72">36</option>
																	<option value="96">48</option>
																	<option value="144">72</option>
																</select>
															</div>
														</div>
														<div class="col-md-12">
															<label class="col-md-3">颜色</label>
															<div class="col-md-9">
																<div id="cp3" class="input-group colorpicker-component" >
																	<input type="text" class="form-control" id="mettingNameColor"/>
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
														<input class="form-control" id="companyName" type="text">
													</div>
													<div class="col-md-11" align="center">
														<div class="col-md-12">
															<label class="col-md-3">字体</label>
															<div class="col-md-9">
																<select class="form-control selectpicker" id="companyNameFont">
																	<option value="宋体">宋体</option>
																	<option value="新宋体">新宋体</option>
																	<option value="楷体">楷体</option>
																	<option value="仿宋">仿宋</option>
																	<option value="微软雅黑">微软雅黑</option>
																</select>
															</div>
														</div>
														<div class="col-md-12">
															<label class="col-md-3">字体大小</label>
															<div class="col-md-9">
																<select class="form-control selectpicker" id="companyNameSize">
																	<option value="16">8</option>
																	<option value="18">9</option>
																	<option value="20">10</option>
																	<option value="21">10.5</option>
																	<option value="22">11</option>
																	<option value="24">12</option>
																	<option value="28">14</option>
																	<option value="32">16</option>
																	<option value="36">18</option>
																	<option value="40">20</option>
																	<option value="44">22</option>
																	<option value="52">26</option>
																	<option value="56">28</option>
																	<option value="72">36</option>
																	<option value="96">48</option>
																	<option value="144">72</option>
																</select>
															</div>
														</div>
														<div class="col-md-12">
															<label class="col-md-3">颜色</label>
															<div class="col-md-9">
																<div id="cp4" class="input-group colorpicker-component" >
																	<input type="text" class="form-control" id="companyNameColor"/>
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
																<select class="form-control selectpicker" id="workNameFont">
																	<option value="宋体">宋体</option>
																	<option value="新宋体">新宋体</option>
																	<option value="楷体">楷体</option>
																	<option value="仿宋">仿宋</option>
																	<option value="微软雅黑">微软雅黑</option>
																</select>
															</div>
														</div>
														<div class="col-md-12">
															<label class="col-md-3">字体大小</label>
															<div class="col-md-9">
																<select class="form-control selectpicker" id="workNameSize">
																	<option value="16">8</option>
																	<option value="18">9</option>
																	<option value="20">10</option>
																	<option value="21">10.5</option>
																	<option value="22">11</option>
																	<option value="24">12</option>
																	<option value="28">14</option>
																	<option value="32">16</option>
																	<option value="36">18</option>
																	<option value="40">20</option>
																	<option value="44">22</option>
																	<option value="52">26</option>
																	<option value="56">28</option>
																	<option value="72">36</option>
																	<option value="96">48</option>
																	<option value="144">72</option>
																</select>
															</div>
														</div>
														<div class="col-md-12">
															<label class="col-md-3">颜色</label>
															<div class="col-md-9">
																<div id="cp5" class="input-group colorpicker-component" >
																	<input type="text" class="form-control" id="workNameColor"/>
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
																<select class="form-control selectpicker" id="workContentFont">
																	<option value="宋体">宋体</option>
																	<option value="新宋体">新宋体</option>
																	<option value="楷体">楷体</option>
																	<option value="仿宋">仿宋</option>
																	<option value="微软雅黑">微软雅黑</option>
																</select>
															</div>
														</div>
														<div class="col-md-12">
															<label class="col-md-3">字体大小</label>
															<div class="col-md-9">
																<select class="form-control selectpicker" id="workContentSize">
																	<option value="16">8</option>
																	<option value="18">9</option>
																	<option value="20">10</option>
																	<option value="21">10.5</option>
																	<option value="22">11</option>
																	<option value="24">12</option>
																	<option value="28">14</option>
																	<option value="32">16</option>
																	<option value="36">18</option>
																	<option value="40">20</option>
																	<option value="44">22</option>
																	<option value="52">26</option>
																	<option value="56">28</option>
																	<option value="72">36</option>
																	<option value="96">48</option>
																	<option value="144">72</option>
																</select>
															</div>
														</div>
														<div class="col-md-12">
															<label class="col-md-3">颜色</label>
															<div class="col-md-9">
																<div id="cp6" class="input-group colorpicker-component" >
																	<input type="text" class="form-control" id="workContentColor"/>
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
																<select class="form-control selectpicker" id="workProgressFont">
																	<option value="宋体">宋体</option>
																	<option value="新宋体">新宋体</option>
																	<option value="楷体">楷体</option>
																	<option value="仿宋">仿宋</option>
																	<option value="微软雅黑">微软雅黑</option>
																</select>
															</div>
														</div>
														<div class="col-md-12">
															<label class="col-md-3">字体大小</label>
															<div class="col-md-9">
																<select class="form-control selectpicker" id="workProgressSize">
																	<option value="16">8</option>
																	<option value="18">9</option>
																	<option value="20">10</option>
																	<option value="21">10.5</option>
																	<option value="22">11</option>
																	<option value="24">12</option>
																	<option value="28">14</option>
																	<option value="32">16</option>
																	<option value="36">18</option>
																	<option value="40">20</option>
																	<option value="44">22</option>
																	<option value="52">26</option>
																	<option value="56">28</option>
																	<option value="72">36</option>
																	<option value="96">48</option>
																	<option value="144">72</option>
																</select>
															</div>
														</div>
														<div class="col-md-12">
															<label class="col-md-3">颜色</label>
															<div class="col-md-9">
																<div id="cp7" class="input-group colorpicker-component" >
																	<input type="text" class="form-control" id="workProgressColor"/>
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
													<label class="col-md-3">关联工作</label>
													<div class="col-md-11" align="center">
														<div class="col-md-12">
															<label class="col-md-3">字体</label>
															<div class="col-md-9">
																<select class="form-control selectpicker" id="relationWorkFont">
																	<option value="宋体">宋体</option>
																	<option value="新宋体">新宋体</option>
																	<option value="楷体">楷体</option>
																	<option value="仿宋">仿宋</option>
																	<option value="微软雅黑">微软雅黑</option>
																</select>
															</div>
														</div>
														<div class="col-md-12">
															<label class="col-md-3">字体大小</label>
															<div class="col-md-9">
																<select class="form-control selectpicker" id="relationWorkSize">
																	<option value="16">8</option>
																	<option value="18">9</option>
																	<option value="20">10</option>
																	<option value="21">10.5</option>
																	<option value="22">11</option>
																	<option value="24">12</option>
																	<option value="28">14</option>
																	<option value="32">16</option>
																	<option value="36">18</option>
																	<option value="40">20</option>
																	<option value="44">22</option>
																	<option value="52">26</option>
																	<option value="56">28</option>
																	<option value="72">36</option>
																	<option value="96">48</option>
																	<option value="144">72</option>
																</select>
															</div>
														</div>
														<div class="col-md-12">
															<label class="col-md-3">颜色</label>
															<div class="col-md-9">
																<div id="cp7" class="input-group colorpicker-component" >
																	<input type="text" class="form-control" id="relationWorkColor"/>
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
													<label class="col-md-3">节点</label>
													<div class="col-md-11" align="center">
														<div class="col-md-12">
															<label class="col-md-3">字体</label>
															<div class="col-md-9">
																<select class="form-control selectpicker" id="nodeFont">
																	<option value="宋体">宋体</option>
																	<option value="新宋体">新宋体</option>
																	<option value="楷体">楷体</option>
																	<option value="仿宋">仿宋</option>
																	<option value="微软雅黑">微软雅黑</option>
																</select>
															</div>
														</div>
														<div class="col-md-12">
															<label class="col-md-3">字体大小</label>
															<div class="col-md-9">
																<select class="form-control selectpicker" id="nodeSize">
																	<option value="16">8</option>
																	<option value="18">9</option>
																	<option value="20">10</option>
																	<option value="21">10.5</option>
																	<option value="22">11</option>
																	<option value="24">12</option>
																	<option value="28">14</option>
																	<option value="32">16</option>
																	<option value="36">18</option>
																	<option value="40">20</option>
																	<option value="44">22</option>
																	<option value="52">26</option>
																	<option value="56">28</option>
																	<option value="72">36</option>
																	<option value="96">48</option>
																	<option value="144">72</option>
																</select>
															</div>
														</div>
														<div class="col-md-12">
															<label class="col-md-3">颜色</label>
															<div class="col-md-9">
																<div id="cp7" class="input-group colorpicker-component" >
																	<input type="text" class="form-control" id="nodeColor"/>
																	<span class="input-group-addon"><i></i></span>
																</div>
															</div>
														</div>
													</div>
												</div>
											</div>
										</div>
										
									</div>
							</div>
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭
					</button>
					<button type="button" class="btn btn-primary" onclick="mergeTemplate();">
						确认
					</button>
				</div>
			</div><!-- /.modal-content -->
		</div><!-- /.modal -->
	</div>
</body>
</html>