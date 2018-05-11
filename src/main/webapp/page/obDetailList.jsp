<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="./include.jsp" %>
<%String checkDetailId = request.getParameter("checkDetailId"); %>
<html>
<head>
<meta charset="utf-8">
<title>查询清单</title>
<link rel="stylesheet" type="text/css" href="<%=path%>/page/css/htmleaf-demo.css">
<link rel="stylesheet" type="text/css" href="<%=path%>/page/css/dragslot.css">
<link rel="stylesheet" type="text/css" href="<%=path%>/page/css/style.css">
<link rel="stylesheet" type="text/css" href="<%=path%>/page/css/bootstrap-colorpicker.css">
<link rel="stylesheet" type="text/css" href="<%=path%>/page/css/bootstrap-treeview.min.css">
<script type="text/javascript" src="<%=path%>/page/js/jquery.form.js"></script>
<script type="text/javascript" src="<%=path%>/page/js/dragslot.js"></script>
<script type="text/javascript" src="<%=path%>/page/js/bootstrap-colorpicker.js"></script>
<script type="text/javascript" src="<%=path%>/page/js/bootstrap-treeview.min.js"></script>
<script type="text/javascript">
	var checkDetailId = '<%=checkDetailId%>';
	var detailListId;
	//创建用户
	function createObUser(){
		$.ajax({   
			type:"POST", //提交方式   
			url:"<%=path%>/obDetailList/queryObUser.do",//路径
			success:function(data) {//返回数据根据结果进行相应的处理
				for(var i = 0; i < data.length;i++){
					var createLi = "<li class='slot-item' onclick='pitchUser(this,&quot;"+data[i].userId+"&quot;);'><div class='slot-handler'>"+
					"<div class='slot-handler clearfix'><div class='avator'><img src='<%=path %>/page/images/avatar5.jpg' />"+
					"</div><div class='content'><div class='item-title'>"+data[i].userName+"</div></div></div></div></li>";
					$("#obUserListUl").append(createLi);
				}
			}
		});
	}
	//选择借阅人
	function pitchUser(obj,userId){
		$("#workSlot").html("");
		$("#workDetailListUl").html("");
		if(obj.style.backgroundColor=='rgb(100, 214, 244)'){
			obj.style.background="#FFF";
			$("#workSlot").html("");
			return;
		}
		var lis = $(obj).parent().find("li");
		for(var i = 0 ; i < lis.length;i++){
			lis[i].style.background="#FFF";
		}
		obj.style.background="#64d6f4";
		createDetailList(userId);
	}
	
	function createDetailList(userId){
		$.ajax({   
			type:"POST", //提交方式   
			url:"<%=path%>/obDetailList/queryUserObDetailList.do",//路径
			data:{'userId':userId},
			success:function(data) {//返回数据根据结果进行相应的处理
				for(var i = 0; i < data.length;i++){
					var createLi = "<li class='slot-item' onclick='pitchDetailList(this,&quot;"+data[i].id+"&quot;);'><div class='slot-handler'>"+
					"<div class='slot-handler clearfix'><div class='avator'><img src='<%=path %>/page/images/avatar5.jpg' />"+
					"</div><div class='content'><div class='item-title'>"+data[i].detailListName+"</div></div></div></div></li>";
					$("#workDetailListUl").append(createLi);
				}
			}
		});
	}
	//选择清单
	function pitchDetailList(obj,detailListId){
		if(obj.style.backgroundColor=='rgb(100, 214, 244)'){
			obj.style.background="#FFF";
			$("#workSlot").html("");
			return;
		}
		var lis = $(obj).parent().find("li");
		for(var i = 0 ; i < lis.length;i++){
			lis[i].style.background="#FFF";
		}
		obj.style.background="#64d6f4";
		createWorkLi(detailListId);
	}
	//创建工作li
	function createWorkLi(detailListId,work){
		$.ajax({   
			type:"POST", //提交方式   
			url:"<%=path%>/work/queryDetailListWork.do",//路径
			data:{
				"id":detailListId,
				'queryWork':JSON.stringify(work)
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
						"<div align='right'><button class='btn btn-default' onclick='easyWork(&quot;"+data.noTypeWorkList[i].id+"&quot;);'>简介</button>"+
						"<button class='btn btn-default' onclick='descWork(&quot;"+data.noTypeWorkList[i].id+"&quot;);'>详细</button></div></div></div></div></li>";
					}
					noTypeWorkDiv+="</ul>";
					noTypeWorkDiv+="</div></div>";
					$("#workSlot").append(noTypeWorkDiv);
				}
				if(data.typeWorkListDto.length>0){
					var typeWorkDiv = "";
			        $('#newWorkType option').not(":first").remove(); 
					for(var i = 0 ; i < data.typeWorkListDto.length; i++){
						typeWorkDiv+="<div style='width:100%;'><div>";
						if(data.typeWorkListDto[i].list.length>0){
							typeWorkDiv+= "<label>"+data.typeWorkListDto[i].workTypeName+"</label>";
						}
						typeWorkDiv+="</div><div class='slot' style='width: 100%;min-height: 110px;border: 0;'><ul class='slot-list'>";
						for(var j = 0 ; j < data.typeWorkListDto[i].list.length;j++){
							typeWorkDiv+= "<li class='slot-item'><div class='slot-handler'><div class='slot-handler clearfix'><div class='avator'><img src='images/avatar6.jpg' />"+
							"</div><div class='content'><div class='item-title'>"+data.typeWorkListDto[i].list[j].workName+"</div>"+
							"<div align='right'><button class='btn btn-default' onclick='easyWork(&quot;"+data.typeWorkListDto[i].list[j].id+"&quot;);'>简介</button>"+
							"<button class='btn btn-default' onclick='descWork(&quot;"+data.typeWorkListDto[i].list[j].id+"&quot;);'>详细</button></div></div></div></div></li>";
						}
						typeWorkDiv+="</ul>";
						typeWorkDiv+="</div></div>";
					}
					$("#workSlot").append(typeWorkDiv);
				}
			}
		});
	}
	//工作简介
	function easyWork(workId){
		$.ajax({   
			type:"POST", //提交方式   
			url:"<%=path%>/work/queryEasyWork.do",//路径
			data:{
				"workId":workId,
			},//数据，这里使用的是Json格式进行传输   
			success:function(data) {//返回数据根据结果进行相应的处理
				$("#easyWorkModal input").each(function(){
					$(this).val("");
				});
				$("#newWorkName").val(data.workName);
				$("#newLiablePerson").val(data.liablePerson);
				$("#newSupervisor").val(data.supervisor);
				$("#newSupervisorStrategy").val(data.supervisorStrategy);
			}
		});
		$("#easyWorkModal").modal();
	}
	//查看工作明细
	function descWork(){
		window.location.href="<%=path%>/page/queryWork.jsp";
	}
	$(function(){
		createObUser();
	});
</script>
<style type="text/css">
	.slot-title{
		width: 30%;
	}
	.slot{
		width: 30%;
	}
</style>
</head>
<body>
	<div class="row">
		<div class="col-md-12">
			<div class="col-md-12" align="right">
	   			<div class="form-group">
					<div class="col-md-12">
						<button class="btn btn-primary" onclick="exportDetailList();">导出清单</button>
					</div>
				</div>  
	   		</div>
		</div>
	</div>
	<div class="htmleaf-container">
		<section class="demo clearfix">
			<div id="dragslot" class="container">
				<div class="slot-title bg-red border-red">借阅用户列表
					
				</div>
				<div class="slot-title bg-red border-red">清单列表
				
				</div>
				<div class="slot-title bg-red border-red">清单工作列表
				
				</div>
				<div class="slot border-red" id="userSlot">
					<ul id="obUserListUl" class="slot-list">
					</ul>
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
	</div>
	<div class="modal fade" id="easyWorkModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog" style="width:800px;">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
							&times;
						</button>
						<h4 class="modal-title" id="myModalLabel">
							查看工作
						</h4>
					</div>
					<form id="easyAddDetailWorkForm" class="form-horizontal" role="form">
					<div class="modal-body">
						<div style="height:420px;overflow: auto;">
							<div class="container">
									<div class="row">
										<div class="form-group">
											<div class="col-lg-12">
												<label class="col-md-3">工作名称</label>
												<div class="col-md-9">
													<input class="form-control" id="newWorkName" type="text">
												</div>
											</div>
										</div>
									</div>
									<div class="row">
										<div class="form-group">
											<div class="col-lg-12">
												<label class="col-md-3">责任人</label>
												<div class="col-md-9">
													<input class="form-control" id="newLiablePersonId" type="hidden">
													<input class="form-control" id="newLiablePerson" type="text" onfocus="choiceLiablePerson();">
												</div>
											</div>
										</div>
									</div>
									<div class="row">
										<div class="form-group">
											<div class="col-lg-12">
												<label class="col-md-3">督办人</label>
												<div class="col-md-9">
													<input class="form-control" id="newSupervisorId" type="hidden">
													<input class="form-control" id="newSupervisor" type="text" onfocus="choiceSupervisor();">
												</div>
											</div>
										</div>
									</div>
									<div class="row">
										<div class="form-group">
											<div class="col-lg-12">
												<label class="col-md-3">工作要求</label>
												<div class="col-md-9">
													<textarea class="form-control" rows="5" cols="5" id="newSupervisorStrategy"></textarea>
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
					</div>
					</form>
				</div><!-- /.modal-content -->
			</div><!-- /.modal -->
		</div>
</body>
</html>