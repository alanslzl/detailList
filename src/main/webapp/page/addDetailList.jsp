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
.modal-dialog{position:absolute;width:auto;margin:10px auto;left:0;right:0;top:42%}
@media (min-width:768px){.modal-dialog{width:600px}
</style>
<script type="text/javascript">
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
	function createWorkSlot(){
		$.ajax({   
			type:"POST", //提交方式   
			url:"<%=path%>/work/queryWork.do",//路径
			data:{
			},//数据，这里使用的是Json格式进行传输   
			success:function(data) {//返回数据根据结果进行相应的处理
				for(var i = 0 ; i < data.length; i++){
					var createLi = "<li class='slot-item'><div class='slot-handler'>"+
							"<div class='slot-handler clearfix'><div class='avator'><img src='<%=path %>/page/images/avatar5.jpg' />"+
							"</div><div class='content'><div class='item-title'><input type='hidden' value='"+data[i].id+"' />"+data[i].workName+"</div></div></div></div></li>";
					$("#work_slot_ul").append(createLi);
				}
			}
		});
	}
	function addDetailList(){
		var workTypeAndWork = [];
		var detailListName = $("#detailListName").val();
		var workTypes = $("#detail_slot").find("label");
		$(workTypes).each(function(){
			var workType = {};
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
		console.log(workTypeAndWork);
		
		var noTypeWork = [];
		var noWorkTypes = $("#detail_slot").children("ul[class='slot-list']").find("li");
		$(noWorkTypes).each(function(){
			var noTypeWorks = $(this).find("div[class='item-title']").find("input[type='hidden']");
			$(noTypeWorks).each(function(){
				var noTypeWorkId = $(this).val();
				noTypeWork.push(noTypeWorkId);
			});
		})
		console.log(noTypeWork);
		
		$.ajax({   
			type:"POST", //提交方式   
			dataType:'json',
			url:"<%=path%>/detailList/addUserDetailList.do",//路径
			data:{
				"detailListName":detailListName,
				"workTypeAndWork":JSON.stringify(workTypeAndWork),
				"noTypeWork":JSON.stringify(noTypeWork),
				"obUser":$("#obUserId").val(),
			},//数据，这里使用的是Json格式进行传输   
			success:function(data) {//返回数据根据结果进行相应的处理
				if(data.resultCode == 0){
					$("#successMsg").removeClass("hide");
					setTimeout(function(){
						window.location.href="<%=path%>/page/descDetailList.jsp";
					}, 1000);
				}
			}
		});
	}

	//创建责任人table
	function createChoicePersonTable(){
		$('#choicePersonTable').bootstrapTable('refresh', { pageNumber: 1 });
	}
	//创建工作table
	function createChoiceWorkTable(){
		$('#choiceWorkTable').bootstrapTable('refresh', { pageNumber: 1 });
	}
	function createChoicePersonGroupTable(){
		$('#choicePersonGroupTable').bootstrapTable('refresh', { pageNumber: 1 });
	}
	var personInput;
	//选择责任人人员信息窗口
	function choicePerson(obj){
		personInput = obj;
		$("#choicePersonInfo").val("");
		$("#choicePersonModal").modal().css({
			"margin-top":function(){
				if($(obj).offset().top<280){
					return +($(obj).offset().top-250)
				}else{
					return +($(obj).offset().top-440)
				}
			}
		});
		createChoicePersonTable();
		createChoicePersonGroupTable();
		createTable("choicePersonTable");
		createGroupTable("choicePersonGroupTable");
	}
	//去除数组里重复方法
	function hovercUnique(arr) {
		var result = [], hash = {};
		for (var i = 0, elem; (elem = arr[i]) != null; i++) {
			if (!hash[elem]) {
				result.push(elem);
				hash[elem] = true;
			}
		}
		return result;
	}
	//判断方法 后面的值是否在前面的数组中
	function IsInArray(arr,val){ 
		var testStr=','+arr.join(",")+","; 
		return testStr.indexOf(","+val+",")!=-1; 
	}
	Array.prototype.indexOf = function(val) {
		for (var i = 0; i < this.length; i++) {
			if (this[i] == val) 
				return i;
		}
		return -1;
	};
	Array.prototype.remove = function(val) {
		var index = this.indexOf(val);
			if (index > -1) {
			this.splice(index, 1);
		}
	};
	function createGroupTable(tableName){
		$("#"+tableName).bootstrapTable({ // 对应table标签的id
			  method: 'post',
			  contentType : "application/x-www-form-urlencoded",
		      url: "<%=path%>/userGroup/queryAll.do", // 获取表格数据的url
		      cache: true, // 设置为 false 禁用 AJAX 数据缓存， 默认为true
		      striped: true,  //表格显示条纹，默认为false
		      pagination: true, // 在表格底部显示分页组件，默认false
		      clickToSelect: true,
		      pageList: [5,10], // 设置页面可以显示的数据条数
		      height: 440,
		      pageSize: 7, // 页面数据条数
		      pageNumber: 1, // 首页页码
		      //search: true,
		      //searchAlign: "left",
		      strictSearch: true,
		      searchOnEnterKey: true,
		      sidePagination: 'client', // 设置为服务器端分页
		      queryParams: function (params) { // 请求服务器数据时发送的参数，可以在这里添加额外的查询参数，返回false则终止请求
		          return {
		              personInfo: $("#choiceGroupPersonInfo").val() // 额外添加的参数
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
		          },{
		              field: 'groupUserId', // 返回json数据中的name
		              visible:false,
		              align: 'center', // 左右居中
		              valign: 'middle' // 上下居中
		          }, {
		              field: 'groupName', // 返回json数据中的name
		              title: '工作组名', // 表格表头显示文字
		              align: 'center', // 左右居中
		              valign: 'middle' // 上下居中
		          }, {
		              field: 'groupUser',
		              title: '组员名称',
		              align: 'center',
		              valign: 'middle'
		          }, {
		              field: 'groupComment',
		              title: '说明',
		              align: 'center',
		              valign: 'middle'
		          }
		      ],
		      onClickRow:function(row, tr,flied){
					var personVal =[];
					var personNo = [];
					var pval = $(personInput).val().trim();
					var rval = $(personInput).prev().val().trim();
					if(pval!='' && rval!=''){
						personVal=personVal.concat($(personInput).val().trim().split(","));
						personNo=personNo.concat($(personInput).prev().val().trim().split(","));
					}
					personVal = personVal.concat(row.groupUser.split(","));
					personNo = personNo.concat(row.groupUserId.split(","));
					personVal = hovercUnique(personVal);
					personNo = hovercUnique(personNo);
					$(personInput).val(personVal);
					$(personInput).prev().val(personNo);
		      },
		      onLoadSuccess: function(){  //加载成功时执行
		            console.info("加载成功");
		      },
		      onLoadError: function(){  //加载失败时执行
		            console.info("加载数据失败");
		      }
		});
	}

	//创建选择人员信息表格
	function createTable(tableName){
		$("#"+tableName).bootstrapTable({ // 对应table标签的id
			  method: 'post',
			  contentType : "application/x-www-form-urlencoded",
		      url: "<%=path%>/personInfo/queryPersonInfo.do", // 获取表格数据的url
		      cache: true, // 设置为 false 禁用 AJAX 数据缓存， 默认为true
		      striped: true,  //表格显示条纹，默认为false
		      pagination: true, // 在表格底部显示分页组件，默认false
		      clickToSelect: true,
		      pageList: [5,10], // 设置页面可以显示的数据条数
		      height: 440,
		      pageSize: 7, // 页面数据条数
		      pageNumber: 1, // 首页页码
		      //search: true,
		      //searchAlign: "left",
		      strictSearch: true,
		      searchOnEnterKey: true,
		      sidePagination: 'server', // 设置为服务器端分页
		      queryParamsType:'',
		      queryParams: function (params) { // 请求服务器数据时发送的参数，可以在这里添加额外的查询参数，返回false则终止请求
		          return {
		              personInfo: $("#choicePersonInfo").val(), // 额外添加的参数
		              page: params.pageNumber
		          }
		      },
		      sortName: 'id', // 要排序的字段
		      sortOrder: 'desc', // 排序规则
		      columns: [
		          {
		        	  field:'choiceUserCheck',
		              checkbox: true, // 显示一个勾选框
		              align: 'center', // 居中显示
		              formatter:stateFormatter
		              
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
		      onClickRow:function(row, tr,flied){
				var personVal =[];
				var personNo = [];
				var pval = $(personInput).val().trim();
				var rval = $(personInput).prev().val().trim();
				var name = row.nachn+""+row.vorna;
				if(pval!='' && rval!=''){
					personVal=personVal.concat($(personInput).val().trim().split(","));
					personNo=personNo.concat($(personInput).prev().val().trim().split(","));
				}
				if(IsInArray(personVal,name)&&IsInArray(personNo,row.pernr)){
					personVal.remove(name);
					personNo.remove(row.pernr)
				}else{
					personVal = personVal.concat(name);
					personNo = personNo.concat(row.pernr);
				}
				personVal = hovercUnique(personVal);
				personNo = hovercUnique(personNo);
				$(personInput).val(personVal);
				$(personInput).prev().val(personNo);
		      },
		      onLoadSuccess: function(){  //加载成功时执行
		    	  console.info("加载数据成功");
		      },
		      onLoadError: function(){  //加载失败时执行
		            console.info("加载数据失败");
		      }
		});
	}
	function stateFormatter(value, row, index){
		var personVal =[];
		var personNo = [];
		var pval = $(personInput).val().trim();
		var rval = $(personInput).prev().val().trim();
		var name = row.nachn+""+row.vorna;
		if(pval!='' && rval!=''){
			personVal=personVal.concat($(personInput).val().trim().split(","));
			personNo=personNo.concat($(personInput).prev().val().trim().split(","));
			if(IsInArray(personVal,name)&&IsInArray(personNo,row.pernr)){
				return {
					disabled : false,//设置是否可用
		            checked : true//设置选中
				}
			}
		}
		return value;
	}
	function removeChoice(obj){
		$(obj).parent().prev().find("input").each(function(){
			$(this).val("");
		});
	}
	$(function(){
		createWorkSlot();
	});
</script>
</head>
<body>
		<div id="successMsg" class="hide alert alert-success">
			<a href="#" class="close" data-dismiss="alert">&times;</a>
			<strong>成功！</strong>录入成功！
		</div>
		<div class="row">
			<div class="col-md-12">
				<div class="col-md-11" align="center">
					<div class="form-group">
						<label class="col-md-2">清单名称</label>
						<div class="col-md-10">
							<input class="form-control" id="detailListName" type="text">
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
						<div class="col-md-10" style="padding-left: 0px;">
							<div class="col-md-10">
								<input class="form-control" id="obUserId" type="hidden">
								<input class="form-control" id="obUserName" type="text" onclick="choicePerson(this);">
							</div>
							<div class="col-md-2">
								<button class="form-control" onclick="removeChoice(this);">清除选中</button>
							</div>
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
							<ul class="slot-list">
								<li></li>
							</ul>
						</div>
						<div class="slot border-red" id="work_slot">
							<ul class="slot-list" id="work_slot_ul">
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
							<button class="btn btn-primary" onclick="addDetailList();">保存</button>
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
		<!-- /.modal -->
	<div class="modal fade" id="choicePersonModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="overflow-y:hidden;">
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
						<div style="height:600px;overflow: auto;">
							<ul class="nav nav-tabs" id="myTab">
								  <li class="active"><a href="#home" onclick="createChoicePersonTable();">人员选择</a></li>
								  <li><a href="#profile" onclick="createChoicePersonGroupTable();">工作组选择</a></li>
							</ul>
							<div class="tab-content">
							  <div class="tab-pane active" id="home">
							  		<div class="ch-container">
										<div class="row">
											<div class="form-group">
												<div class="col-lg-12">
													<label class="col-md-3">人员信息</label>
													<div class="col-md-7">
														<input class="form-control" id="choicePersonInfo" type="text" onkeyup="createChoicePersonTable();">
													</div>
												</div>
											</div>
										</div>
										<div class="row">
											<table class="table table-striped table-bordered responsive" id="choicePersonTable">
											</table>
										</div>
									</div>
							  </div>
							  <div class="tab-pane" id="profile">
							  		<div class="ch-container">
										<div class="row">
											<div class="form-group">
												<div class="col-lg-12">
													<label class="col-md-3">工作组信息</label>
													<div class="col-md-7">
														<input class="form-control" id="choicePersonGroupInfo" type="text">
													</div>
												</div>
											</div>
										</div>
										<div class="row">
											<table class="table table-striped table-bordered responsive" id="choicePersonGroupTable">
											</table>
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