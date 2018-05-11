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
	//创建清单li
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
					if(checkDetailId!=null){
						if(checkDetailId == data[i].id){
							var createLi = "<li class='slot-item' style='background-color:#64d6f4;' onclick='pitchDetailList(this,&quot;"+data[i].id+"&quot;);'><div class='slot-handler'>"+
							"<div class='slot-handler clearfix'><div class='avator'><img src='<%=path %>/page/images/avatar5.jpg' />"+
							"</div><div class='content'><div class='item-title'>"+data[i].detailListName+"</div></div></div></div></li>";
							$("#workDetailListUl").append(createLi);
							createWorkLi(checkDetailId);
						}else{
							var createLi = "<li class='slot-item' onclick='pitchDetailList(this,&quot;"+data[i].id+"&quot;);'><div class='slot-handler'>"+
							"<div class='slot-handler clearfix'><div class='avator'><img src='<%=path %>/page/images/avatar5.jpg' />"+
							"</div><div class='content'><div class='item-title'>"+data[i].detailListName+"</div></div></div></div></li>";
							$("#workDetailListUl").append(createLi);
						}
					}else{
						var createLi = "<li class='slot-item' onclick='pitchDetailList(this,&quot;"+data[i].id+"&quot;);'><div class='slot-handler'>"+
								"<div class='slot-handler clearfix'><div class='avator'><img src='<%=path %>/page/images/avatar5.jpg' />"+
								"</div><div class='content'><div class='item-title'>"+data[i].detailListName+"</div></div></div></div></li>";
						$("#workDetailListUl").append(createLi);
					}
				}
				$("#detailListName").val("");
				$("#workSlot").html("");
				$("#workListUl").html("");
				$("#queryDetailListModal").modal("hide");
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
		this.detailListId = detailListId;
	}
	//新增清单
	function addDetailList(){
		window.location.href="<%=path%>/page/addDetailList.jsp";
	}
	//修改清单
	function editDetailList(){
		window.location.href="<%=path%>/detailList/editDetailList.do?detailListId="+detailListId;
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
					var select = $("#newWorkType");
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
							//$("#workSlot").append(createLi);
						}
						typeWorkDiv+="</ul>";
						typeWorkDiv+="</div></div>";
						select.append("<option value='"+data.typeWorkListDto[i].workTypeId+"'>"  
	                            + data.typeWorkListDto[i].workTypeName + "</option>");
					}
					$("#workSlot").append(typeWorkDiv);
					$('#newWorkType').selectpicker('refresh');
				}
				
			}
		});
	}
	//查看工作明细
	function descWork(){
		window.location.href="<%=path%>/page/queryWork.jsp";
	}
	//工作简介
	function easyWork(){
		$("#addWorkModal").modal();
	}
	//导出modal展示
	function exportDetailList(){
		//$("#exportDetailListModal").modal();
		window.location.href="<%=path%>/detailList/exportDetailList.do?detailListId="+detailListId;
	}
	//切换选择模板或创建模板
	function showNewExportDetailDiv(){
		$("#newExportDetailDiv").show();
		$("#hasExportDetailDiv").hide();
	}
	//切换选择模板或创建模板
	function showHasExportDetailDiv(){
		$("#hasExportDetailDiv").show();
		$("#newExportDetailDiv").hide();
	}
	//简单新增
	function addDetailWork(){
		$("#easyAddDetailWorkForm").resetForm();
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
	//判断方法 后面的值是否在前面的数组中
	function IsInArray(arr,val){ 
		var testStr=','+arr.join(",")+","; 
		return testStr.indexOf(","+val+",")!=-1; 
	}
	//选择工作单位
	function choiceCompany(){
		getTreeJSON();
		$("#queryWorkModal").modal("hide");
		$("#choiceCompany").modal();
	}
	function choiceCompanyInfo(){
		$("#workCompany").val(selectedNode.text);
		$("#choiceCompany").modal("hide");
		$("#queryWorkModal").modal();
	}
	//创建督办人table
	function createChoiceSupervisorTable(){
		$('#choiceSupervisorTable').bootstrapTable('refresh', { pageNumber: 1 });
	}
	//创建责任人table
	function createChoiceLiablePersonTable(){
		$('#choiceLiablePersonTable').bootstrapTable('refresh', { pageNumber: 1 });
	}
	//选择责任人人员信息窗口
	function choiceLiablePerson(){
		$("#choiceLiablePersonModal").modal();
	}
	//选择督办人人员信息窗口
	function choiceSupervisor(){
		$("#choiceSupervisorModal").modal();
	}
	//督办人人员选择方法
	function choiceSupervisorInfo(){
		var choiceInfoArr = [];
		var showNames = [];
		var userNos = [];
		$("#choiceSupervisorTable input[type='checkbox']:checked").each(function(){
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
		$("#choiceSupervisorModal").modal("hide");
		$("#newSupervisor").val(showNames);
		$("#newSupervisorId").val(userNos);
		$("#supervisor").val(showNames);
		$("#supervisorId").val(userNos);
	}
	//责任人人人员选择方法
	function choiceLiablePersonInfo(){
		var choiceInfoArr = [];
		var showNames = [];
		var userNos = [];
		$("#choiceLiablePersonTable input[type='checkbox']:checked").each(function(){
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
		$("#choiceLiablePersonModal").modal("hide");
		$("#newLiablePerson").val(showNames);
		$("#newLiablePersonId").val(userNos);
		$("#liablePerson").val(showNames);
		$("#liablePersonId").val(userNos);
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
	//提交简单新增
	function easyAddDetailWork(){
		var newWorkType = $("#newWorkType").val();
		var newWorkName = $("#newWorkName").val();
		var newLiablePerson = $("#newLiablePersonId").val();
		var newSupervisor = $("#newSupervisorId").val();
		var newSupervisorStrategy = $("#newSupervisorStrategy").val();
		$('#easyAddDetailWorkForm').on('submit', function() {
	        $(this).ajaxSubmit({
	            type: 'post', // 提交方式 get/post
	            url: '<%=path%>/work/addEasyWork.do', // 需要提交的 url
	            data: {
	            	'detailListId':detailListId,
	                'workType':newWorkType,
	                'workName':newWorkName,
	                'liablePerson':newLiablePerson,
	                'supervisor':newSupervisor,
	                'supervisorStrategy':newSupervisorStrategy
	            },
	            success: function(data) { 
	            	// data 保存提交后返回的数据，一般为 json 数据
	                // 此处可对 data 作相关处理
	                alert('提交成功！');
	                $(this).resetForm(); // 提交后重置表单
		            $("#addWorkModal").modal("hide");
		            window.location.href="<%=path%>/page/descDetailList.jsp?checkDetailId="+detailListId;
	            }
	        });
	        return false; // 阻止表单自动提交事件
	    });
	}
	 var selectedNode = {};
	function getTreeJSON(){
	     $.ajax({
	         type: "POST",
	         url: "<%=path%>/org/getSysOrganizeIdJSON.do",
	         data:null,
	         dataType: "text",
	         success: function(result){
				 $('#tree').treeview({
	                 data: eval('['+result+']'),      
	                 expand: false,
	                 highlightSelected: true,
	                 onNodeSelected: function(event, data) {
	                     selectedNode.id=data['id'];
	                     selectedNode.text=data['text'];
	                 }
	             });
	         },
	         error: function(XMLHttpRequest, textStatus, errorThrown) {
	             console.log(XMLHttpRequest.status);
	             console.log(XMLHttpRequest.readyState);
	             console.log(textStatus);
	         }
	     });
	}
	function queryDetailWork(){
		$("#queryWorkModal input").each(function(){
			$(this).val("");
		});
		$("#queryWorkModal").modal();
	}
	function queryDetailWorkBtn(){
		var work = new Object();
		work.workName=$("#workName").val();
		work.workCompany=$("#workCompany").val();
		work.liablePerson=$("#liablePersonId").val();
		work.supervisor=$("#supervisorId").val();
		work.workLevel=$("#workLevel").val();
		console.log(work);
		createWorkLi(detailListId,work);
		$("#queryWorkModal").modal("hide");
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
				$("#newWorkName").val(data.workName);
				$("#newLiablePerson").val(data.liablePerson);
				$("#newSupervisor").val(data.supervisor);
				$("#newSupervisorStrategy").val(data.supervisorStrategy);
			}
		});
		$("#easyWorkModal").modal();
	}
	$(function(){
		$("#cp1,#cp2,#cp3,#cp4,#cp5,#cp6,#cp7").colorpicker();
		createDetailListLi();
		createTable("choiceSupervisorTable");
		createTable("choiceLiablePersonTable");
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
						<label style="cursor:pointer;" data-toggle="modal" onclick="queryDetailWork();">筛选</label>
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
						<div style="height:200px;overflow: auto;">
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
						<div style="height:340px;overflow: auto;">
							<div class="container">
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
													<input class="form-control" id="workCompany" type="text" onfocus="choiceCompany();">
												</div>
											</div>
										</div>
									</div>
									<div class="row">
										<div class="form-group">
											<div class="col-lg-12">
												<label class="col-md-3">责任人</label>
												<div class="col-md-9">
													<input class="form-control" id="liablePersonId" type="hidden">
													<input class="form-control" id="liablePerson" type="text" onfocus="choiceLiablePerson();">
												</div>
											</div>
										</div>
									</div>
									<div class="row">
										<div class="form-group">
											<div class="col-lg-12">
												<label class="col-md-3">督办人</label>
												<div class="col-md-9">
													<input class="form-control" id="supervisorId" type="hidden">
													<input class="form-control" id="supervisor" type="text" onfocus="choiceSupervisor();">
												</div>
											</div>
										</div>
									</div>
									<div class="row">
										<div class="form-group">
											<div class="col-lg-12">
												<label class="col-md-3">工作等级</label>
												<div class="col-md-9">
													<select class="form-control selectpicker" id="workLevel">
														<option value="1">A</option>
													</select>
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
						<button type="button" class="btn btn-primary" onclick="queryDetailWorkBtn();">
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
					<form id="easyAddDetailWorkForm" class="form-horizontal" role="form">
					<div class="modal-body">
						<div style="height:420px;overflow: auto;">
							<div class="container">
									<div class="row">
										<div class="form-group">
											<div class="col-lg-12">
												<label class="col-md-3">工作类别</label>
												<div class="col-md-9">
													<select id="newWorkType" class="form-control selectpicker">
														<option value="notype">无类型</option>
													</select>
												</div>
											</div>
										</div>
									</div>
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
						<button type="submit" class="btn btn-primary" onclick="easyAddDetailWork();">
							提交
						</button>
					</div>
					</form>
				</div><!-- /.modal-content -->
			</div><!-- /.modal -->
		</div>
		<div class="modal fade" id="choiceLiablePersonModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
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
												<input class="form-control" id="choiceLiablePersonInfo" type="text">
											</div>
											<button type="button" class="btn btn-primary" onclick="createChoiceLiablePersonTable();">查询</button>
										</div>
									</div>
								</div>
								<div class="row">
									<table class="table table-striped table-bordered responsive" id="choiceLiablePersonTable">
									</table>
								</div>
							</div>
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">关闭
						</button>
						<button type="button" class="btn btn-primary" onclick="choiceLiablePersonInfo();">
							确认
						</button>
					</div>
				</div><!-- /.modal-content -->
			</div><!-- /.modal -->
		</div>
		<div class="modal fade" id="choiceSupervisorModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
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
												<input class="form-control" id="choiceSupervisorInfo" type="text">
											</div>
											<button type="button" class="btn btn-primary" onclick="createChoiceSupervisorTable();">查询</button>
										</div>
									</div>
								</div>
								<div class="row">
									<table class="table table-striped table-bordered responsive" id="choiceSupervisorTable">
									</table>
								</div>
							</div>
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">关闭
						</button>
						<button type="button" class="btn btn-primary" onclick="choiceSupervisorInfo();">
							确认
						</button>
					</div>
				</div><!-- /.modal-content -->
			</div><!-- /.modal -->
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
													<input class="form-control" id="newLiablePerson" type="text">
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
													<input class="form-control" id="newSupervisor" type="text">
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
		<div class="modal fade" id="choiceCompany" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog" style="width:800px;">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
							&times;
						</button>
						<h4 class="modal-title" id="myModalLabel">
							选择工作单位
						</h4>
					</div>
					<div class="modal-body">
						<div style="height:530px;overflow: auto;">
							<div class="ch-container">
								<div id="tree"></div>
							</div>
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">关闭
						</button>
						<button type="button" class="btn btn-primary" onclick="choiceCompanyInfo();">
							确认
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