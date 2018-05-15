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
				"noTypeWork":JSON.stringify(noTypeWork),
				"obUser":$("#obUserId").val()
			},//数据，这里使用的是Json格式进行传输   
			success:function(data) {//返回数据根据结果进行相应的处理
				if(data.resultCode == 0){
					$("#successMsg").removeClass("hide");
					setTimeout(function(){
						window.location.href="<%=path%>/page/descDetailList.jsp?checkDetailId="+detailListId;
					}, 1000);
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
	var personInput;
	//选择责任人人员信息窗口
	function choicePerson(obj){
		createChoicePersonTable();
		$("#choicePersonModal").modal();
		personInput = obj;
	}
	//创建责任人table
	function createChoicePersonTable(){
		$('#choicePersonTable').bootstrapTable('refresh', { pageNumber: 1 });
	}
	//责任人人人员选择方法
	function choicePersonInfo(){
		var choiceInfoArr = [];
		var showNames = [];
		var userNos = [];
		$("#choicePersonTable input[type='checkbox']:checked").each(function(){
			var userNo = $(this).parent().parent().children("td").eq(1).text();
			var surnName = $(this).parent().parent().children("td").eq(2).text();
			var name = $(this).parent().parent().children("td").eq(3).text();
			var info = {
				'userNo':userNo,	
				'names':surnName + "" +name
			}
			showNames.push(surnName + "" +name);
			choiceInfoArr.push(info);
			userNos.push(userNo);
		});
		$("#choicePersonModal").modal("hide");
		$(personInput).val(showNames);
		$(personInput).prev().val(userNos);
	}
	//创建选择人员信息表格
	function createTable(tableName){
		$("#"+tableName).bootstrapTable({ // 对应table标签的id
			  method: 'post',
			  contentType : "application/x-www-form-urlencoded",
		      url: "<%=path%>/personInfo/queryPersonInfo.do", // 获取表格数据的url
		      cache: false, // 设置为 false 禁用 AJAX 数据缓存， 默认为true
		      striped: true,  //表格显示条纹，默认为false
		      pagination: true, // 在表格底部显示分页组件，默认false
		      clickToSelect: true,
		      pageList: [5,10], // 设置页面可以显示的数据条数
		      height: 340,
		      pageSize: 7, // 页面数据条数
		      pageNumber: 1, // 首页页码
		      search: true,
		      searchAlign: "left",
		      searchOnEnterKey: true,
		      sidePagination: 'client', // 设置为服务器端分页
		      queryParams: function (params) { // 请求服务器数据时发送的参数，可以在这里添加额外的查询参数，返回false则终止请求
		          return {
		              personInfo: $("#personInfo").val() // 额外添加的参数
		          }
		      },
		      sortName: 'id', // 要排序的字段
		      sortOrder: 'desc', // 排序规则
		      columns: [
		          {
		        	  field:'choiceUserCheck',
		              checkbox: true, // 显示一个勾选框
		              align: 'center' // 居中显示
		              
		          }, {
		              field: 'id', // 返回json数据中的name
		              visible:false,
		              align: 'center', // 左右居中
		              valign: 'middle' // 上下居中
		          }, {
		              field: 'pernr', // 返回json数据中的name
		              title: '人员编号', // 表格表头显示文字
		              align: 'center', // 左右居中
		              valign: 'middle' // 上下居中
		          }, {
		              field: 'nachn',
		              title: '姓',
		              align: 'center',
		              valign: 'middle'
		          }, {
		              field: 'vorna',
		              title: '名',
		              align: 'center',
		              valign: 'middle'
		          }, {
		              field: 'plans',
		              title: '职位',
		              align: 'center',
		              valign: 'middle'
		          },{
		              field: 'orgeh',
		              title: '组织机构',
		              align: 'center',
		              valign: 'middle'
		          }, {
		              field: 'zsxzy',
		              title: '所学专业',
		              align: 'center',
		              valign: 'middle'
		          }
		      ],
		      onLoadSuccess: function(){  //加载成功时执行
		            console.info("加载成功");
		      },
		      onLoadError: function(){  //加载失败时执行
		            console.info("加载数据失败");
		      }
		});
	}
	function createObUsers(data){
		data = JSON.parse(data);
		var userIds=[];
		var userNames=[];
		for(var i = 0 ; i < data.length;i++){
			userIds.push(data[i].userId);
			userNames.push(data[i].userName);
		}
		$("#obUserId").val(userIds);
		$("#obUserName").val(userNames);
	}
	$(function(){
		createObUsers('${obUsers}');
		createWorkLi("${detailListId}");
		createWorkSlot("${detailListId}");
		createTable("choicePersonTable");
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
		<div class="row">
			<div class="col-md-12">
				<div class="col-md-11" align="center">
					<div class="form-group">
						<label class="col-md-2">共享给他人</label>
						<div class="col-md-10">
							<input class="form-control" id="obUserId" type="hidden">
							<input class="form-control" id="obUserName" type="text" onclick="choicePerson(this);">
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
		<div class="modal fade" id="choicePersonModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog" style="width:800px;">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
							&times;
						</button>
						<h4 class="modal-title" id="myModalLabel">
							选择人员信息
						</h4>
					</div>
					<div class="modal-body">
						<div style="height:530px;overflow: auto;">
							<div class="ch-container">
								<div class="row">
									<div class="form-group">
										<div class="col-lg-12">
											<label class="col-md-3">人员信息</label>
											<div class="col-md-7">
												<input class="form-control" id="choicePersonInfo" type="text">
											</div>
											<button type="button" class="btn btn-primary" onclick="createChoicePersonTable();">查询</button>
										</div>
									</div>
								</div>
								<div class="row">
									<table class="table table-striped table-bordered responsive" id="choicePersonTable">
									</table>
								</div>
							</div>
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">关闭
						</button>
						<button type="button" class="btn btn-primary" onclick="choicePersonInfo();">
							确认
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