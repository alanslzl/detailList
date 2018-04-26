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
<script type="text/javascript">
	var detailListId = "${detailListId}";
	function addWorkType(){
		var workTypeDiv = "";
		workTypeDiv+="<div style='width:100%;'>";
		workTypeDiv+="<div><label>"+$("#workTypeName").val()+"</label></div>";
		workTypeDiv+="<div class='slot' style='width: 100%;min-height: 150px;border: 0;'>"
		workTypeDiv+="<ul class='slot-list'><li></li></ul></div></div>";
		$("#detail_slot").append(workTypeDiv);
		$("#workTypeName").val("");
		$("#addWorkTypeModal").modal("hide");
	}
	function createWorkSlot(detailListId){
		$.ajax({   
			type:"POST", //提交方式   
			url:"<%=path%>/work/queryWork.do",//路径
			//数据，这里使用的是Json格式进行传输   
			success:function(data) {
				createFwork(detailListId,data);
			}
		});
	}
	function createFwork(detailListId,work){
		$.ajax({   
			type:"POST", //提交方式   
			url:"<%=path%>/work/queryDetailListWork.do",//路径
			data:{
				"id":detailListId
			},//数据，这里使用的是Json格式进行传输   
			success:function(data) {//返回数据根据结果进行相应的处理
				var detailWorks = [];
				var typeWork = data.typeWorkListDto;
				for(var i = 0 ; i < typeWork.length;i++){
					for(var j = 0 ; j < typeWork[i].list.length;j++){
						detailWorks.push(typeWork[i].list[j].id)
					}
				}
				var noTypeWork = data.noTypeWorkList;
				for(var i = 0 ; i<noTypeWork.length;i++){
					detailWorks.push(noTypeWork[i].id);
				}
				//返回数据根据结果进行相应的处理
				for(var i = 0 ; i < work.length; i++){
					if(!IsInArray(detailWorks,work[i].id)){
						var createLi = "<li class='slot-item'><div class='slot-handler'>"+
						"<div class='slot-handler clearfix'><div class='avator'><img src='<%=path %>/page/images/avatar5.jpg' />"+
						"</div><div class='content'><div class='item-title'><input type='hidden' value='"+work[i].id+"' />"+work[i].workName+"</div></div></div></div></li>";
						$("#work_slot_ul").append(createLi);
					}
				}
			}
		});
	}
	function IsInArray(arr,val){ 
		var testStr=','+arr.join(",")+","; 
		return testStr.indexOf(","+val+",")!=-1; 
	} 
	function editDetailList(){
		var workTypeAndWork = [];
		var detailListName = $("#detailListName").val();
		var workTypes = $("#detail_slot").find("label");
		$(workTypes).each(function(){
			var workType = {};
			workType.workTypeId=$(this)[0].id;
			workType.workTypeName = $(this).text();
			workType.workIds=[];
			var lis = $(this).parent().parent().find("div[class='slot']").find("ul[class='slot-list']").find("li");
			$(lis).each(function(){
				var work = $(this).find("div[class='item-title']").find("input[type='hidden']");
				$(work).each(function(){
					var workId = $(this).val();
					workType.workIds.push(workId);
				});
			})
			workTypeAndWork.push(workType);
		});
		var noTypeWork = [];
		var noWorkTypes = $("#detail_slot").find("div[name='noTypeWork']").find("ul[class='slot-list']").find("li");
		$(noWorkTypes).each(function(){
			var noTypeWorks = $(this).find("div[class='item-title']").find("input[type='hidden']");
			$(noTypeWorks).each(function(){
				var noTypeWorkId = $(this).val();
				noTypeWork.push(noTypeWorkId);
			});
		});
		$.ajax({   
			type:"POST", //提交方式   
			dataType:'json',
			url:"<%=path%>/detailList/editUserDetailList.do",//路径
			data:{
				"detailListId":detailListId,
				"detailListName":detailListName,
				"workTypeAndWork":JSON.stringify(workTypeAndWork),
				"noTypeWork":JSON.stringify(noTypeWork)
			},//数据，这里使用的是Json格式进行传输   
			success:function(data) {//返回数据根据结果进行相应的处理
				if(data.resultCode == 0){
					$("#successMsg").removeClass("hide");
					setTimeout(function(){
						window.location.href="<%=path%>/page/descDetailList.jsp";
					}, 3000);
				}
			}
		});
	}
	function createWorkLi(detailListId){
		$.ajax({   
			type:"POST", //提交方式   
			url:"<%=path%>/work/queryDetailListWork.do",//路径
			data:{
				"id":detailListId
			},//数据，这里使用的是Json格式进行传输   
			success:function(data) {//返回数据根据结果进行相应的处理
				$("#detail_slot").html("");
				var noTypeWorkDiv = "";
				noTypeWorkDiv+="<div name='noTypeWork' style='width:100%;'>";
				noTypeWorkDiv+="<div class='slot' style='width: 100%;min-height: 10px;border: 0;'><ul class='slot-list'><li></li>";
				if(data.noTypeWorkList.length>0){
					for(var i = 0 ; i < data.noTypeWorkList.length;i++){
						noTypeWorkDiv+= "<li class='slot-item'><div class='slot-handler'><div class='slot-handler clearfix'><div class='avator'><img src='<%=path %>/page/images/avatar5.jpg' />"+
						"</div><div class='content'><div class='item-title'><input type='hidden' value='"+data.noTypeWorkList[i].id+"' />"+data.noTypeWorkList[i].workName+"</div>"+
						"</div></div></div></li>";
					}
				}
				noTypeWorkDiv+="</ul>";
				noTypeWorkDiv+="</div></div>";
				$("#detail_slot").append(noTypeWorkDiv);
				if(data.typeWorkListDto.length>0){
					var typeWorkDiv = "";
					for(var i = 0 ; i < data.typeWorkListDto.length; i++){
						typeWorkDiv+="<div style='width:100%;'><div>";
						typeWorkDiv+= "<label id='"+data.typeWorkListDto[i].workTypeId+"'>"+data.typeWorkListDto[i].workTypeName+"</label>";
						typeWorkDiv+="</div><div class='slot' style='width: 100%;min-height: 110px;border: 0;'><ul class='slot-list'>";
						for(var j = 0 ; j < data.typeWorkListDto[i].list.length;j++){
							typeWorkDiv+= "<li class='slot-item'><div class='slot-handler'><div class='slot-handler clearfix'><div class='avator'><img src='<%=path %>/page/images/avatar5.jpg' />"+
							"</div><div class='content'><div class='item-title'><input type='hidden' value='"+data.typeWorkListDto[i].list[j].id+"' />"+data.typeWorkListDto[i].list[j].workName+"</div>"+
							"</div></div></div></li>";
							//$("#workSlot").append(createLi);
						}
						typeWorkDiv+="</ul>";
						typeWorkDiv+="</div></div>";
					}
					$("#detail_slot").append(typeWorkDiv);
				}
			}
		});
	}
	$(function(){
		createWorkLi("${detailListId}");
		createWorkSlot("${detailListId}");
	});
</script>
</head>
<body>
		<div id="successMsg" class="hide alert alert-success">
			<a href="#" class="close" data-dismiss="alert">&times;</a>
			<strong>成功！</strong>修改成功！
		</div>
		<div class="row">
			<div class="col-md-12">
				<div class="col-md-11" align="center">
					<div class="form-group">
						<label class="col-md-2">清单名称</label>
						<div class="col-md-10">
							<input class="form-control" id="detailListName" value="${detailListName}" type="text">
						</div>
					</div>
				</div>
			</div>
		</div>
		<div style="padding-top: 12px;"></div>
		<div class="row">
			<div class="htmleaf-container">
				<section class="demo clearfix">
					<div id="dragslot" class="container">
						<div class="slot-title bg-red border-red">工作清单
							<div style="float: right;"  align="right">
								<label style="cursor:pointer;" data-toggle="modal" data-target="#addWorkTypeModal">增加工作类别</label>
							</div>
						</div>
						<div class="slot-title bg-red border-red">
							工作列表
							<div style="float: right;" align="right">
								<label style="cursor:pointer;" data-toggle="modal" data-target="#queryWorkModal">筛选</label>
							</div>
						</div>
						<div class="slot border-red" id="detail_slot">
						</div>
						<div class="slot border-red" id="work_slot">
							<ul class="slot-list" id="work_slot_ul">
								<li></li>
							</ul>
						</div>
					</div>
				</section>
			</div>
		</div>
		<div class="row">
			<div class="col-md-12">
				<div class="form-group">
					<div class="col-lg-12">
						<div class="col-md-12" align="center">
							<button class="btn btn-primary" onclick="editDetailList();">保存</button>
							<button class="btn btn-primary">取消</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	<!-- 模态框（Modal） -->
		<div class="modal fade" id="addWorkTypeModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
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
									<input class="form-control" id="workTypeName" type="text">
								</div>
							</div>
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">关闭
						</button>
						<button type="button" class="btn btn-primary" onclick="addWorkType();">
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