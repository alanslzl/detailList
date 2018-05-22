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
		var colors = [];
		var lis = $("#workDetailListUl").find("li");
		for(var i = 0 ; i < lis.length ; i++){
			colors.push(lis[i].style.backgroundColor);
		}
		if(IsInArray(colors,"rgb(100, 214, 244)")){
			window.location.href="<%=path%>/detailList/editDetailList.do?detailListId="+detailListId;
		}else{
			alert("请选择清单!");
		}
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
						noTypeWorkDiv+= "<li class='slot-item'><div class='slot-handler'><div class='slot-handler clearfix'><div class='avator'><img src='<%=path%>/page/images/avatar6.jpg' />"+
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
							typeWorkDiv+= "<li class='slot-item'><div class='slot-handler'><div class='slot-handler clearfix'><div class='avator'><img src='<%=path%>/page/images/avatar6.jpg' />"+
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
	//导出modal展示
	function exportDetailList(){
		var colors = [];
		var lis = $("#workDetailListUl").find("li");
		for(var i = 0 ; i < lis.length ; i++){
			colors.push(lis[i].style.backgroundColor);
		}
		if(IsInArray(colors,"rgb(100, 214, 244)")){
			$("#exportDetailListModal").modal();
		}else{
			alert("请选择清单!");
		}
		
	}
	//切换选择模板或创建模板
	function showNewExportDetailDiv(){
		window.location.href="<%=path%>/template/query.do";
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
	//创建责任人table
	function createChoicePersonTable(){
		$('#choicePersonTable').bootstrapTable('refresh', { pageNumber: 1 });
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
	//选择工作单位
	function choiceCompany(){
		getTreeJSON();
		$("#queryWorkModal").modal("hide");
		$("#choiceCompany").modal();
	}
	function choiceCompanyInfo(){
		$("#workCompany").val(selectedNode.id);
		$("#workCompanyName").val(selectedNode.text);
		$("#choiceCompany").modal("hide");
		$("#queryWorkModal").modal();
	}

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
	                     selectedNode.id=data['nid'];
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
		work.liablePersonId=$("#liablePersonId").val();
		work.supervisorId=$("#supervisorId").val();
		work.workLevel=$("#workLevel").val();
		work.mettingTypeId=$("#mettingType").val();
		work.workLabelId=$("#workLabel").val();
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
				$("#easyWorkName").val(data.workName);
				$("#easyLiablePerson").val(data.liablePerson);
				$("#easySupervisor").val(data.supervisor);
				$("#easySupervisorStrategy").val(data.supervisorStrategy);
			}
		});
		$("#easyWorkModal").modal();
	}
	function removeChoice(obj){
		$(obj).parent().prev().find("input").each(function(){
			$(this).val("");
		});
	}
	
	function initMettingType(workdiv){
		$.ajax({   
			type:"POST", //提交方式   
			url:"<%=path%>/mettingType/queryAll.do",//路径
			async:false,
			success:function(data) {//返回数据根据结果进行相应的处理
				var select = $(workdiv).find("#mettingType");
				select.html("");
				select.append("<option value='' >请选择</option>")
				for(var i = 0 ; i < data.length;i++){
					select.append("<option value='"+data[i].id+"'>" + data[i].mettingName + "</option>");
				}
				$(select).selectpicker("refresh");
			}
		});
	}
	function initWorkLabel(workdiv){
		$.ajax({   
			type:"POST", //提交方式   
			url:"<%=path%>/workLabel/queryAll.do",//路径
			async:false,
			success:function(data) {//返回数据根据结果进行相应的处理
				var select = $(workdiv).find("#workLabel");
				select.html("");
				select.append("<option value='' >请选择</option>")
				for(var i = 0 ; i < data.length;i++){
					select.append("<option value='"+data[i].id+"'>" + data[i].labelName + "</option>");
				}
				$(select).selectpicker("refresh");
			}
		});
	}
	function initExportTemplate(){
		$.ajax({   
			type:"POST", //提交方式   
			url:"<%=path%>/template/queryAll.do",//路径
			async:false,
			success:function(data) {//返回数据根据结果进行相应的处理
				var select = $("#exportTemplate");
				select.html("");
				select.append("<option value='' >请选择</option>")
				for(var i = 0 ; i < data.length;i++){
					select.append("<option value='"+data[i].id+"'>" + data[i].templateName + "</option>");
				}
				$(select).selectpicker("refresh");
			}
		});
	}
	function exportDetailListDu(){
		var templateId = $("#exportTemplate").val();
		window.location.href="<%=path%>/detailList/exportDetailList.do?detailListId="+detailListId+"&templateId="+templateId;
	}
	$(function(){
		initExportTemplate();
		initMettingType($("#queryWorkModal"));
		initWorkLabel($("#queryWorkModal"));
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
						<label style="cursor:pointer;" onclick="addDetailList();">新增</label>
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
													<input class="form-control" id="workCompany" type="hidden">
													<input class="form-control" id="workCompanyName" type="text" onfocus="choiceCompany();">
												</div>
											</div>
										</div>
									</div>
									<div class="row">
										<div class="form-group">
											<div class="col-lg-12">
												<label class="col-md-3">责任人</label>
												<div class="col-md-9" style="padding-left: 0px;">
													<div class="col-md-7">
														<input class="form-control" id="liablePersonId" type="hidden">
														<input class="form-control" id="liablePerson" type="text" onfocus="choicePerson(this);">
													</div>
													<div class="col-md-5">
														<button class="form-control" onclick="removeChoice(this);">清除选中</button>
													</div>
												</div>
											</div>
										</div>
									</div>
									<div class="row">
										<div class="form-group">
											<div class="col-lg-12">
												<label class="col-md-3">督办人</label>
												<div class="col-md-9" style="padding-left: 0px;">
													<div class="col-md-7">
														<input class="form-control" id="supervisorId" type="hidden">
														<input class="form-control" id="supervisor" type="text" onfocus="choicePerson(this);">
													</div>
													<div class="col-md-5">
														<button class="form-control" onclick="removeChoice(this);">清除选中</button>
													</div>
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
														<option value="">请选择</option>
														<option value="A">A</option>
														<option value="B">B</option>
														<option value="C">C</option>
														<option value="L">L</option>
													</select>
												</div>
											</div>
										</div>
									</div>
									<div class="row">
										<div class="form-group">
											<div class="col-lg-12">
												<label class="col-md-3">工作标签</label>
												<div class="col-md-9">
													<select class="form-control selectpicker" id="workLabel">
													</select>
												</div>
											</div>
										</div>
									</div>
									<div class="row">
										<div class="form-group">
											<div class="col-lg-12">
												<label class="col-md-3">会议类型</label>
												<div class="col-md-9">
													<select class="form-control selectpicker" id="mettingType">
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
												<div class="col-md-6">
													<input class="form-control" id="newLiablePersonId" type="hidden">
													<input class="form-control" id="newLiablePerson" type="text" onfocus="choicePerson(this);">
												</div>
												<div class="col-md-3">
													<button class="form-control" onclick="removeChoice(this);return false;">清除选中</button>
												</div>
											</div>
										</div>
									</div>
									<div class="row">
										<div class="form-group">
											<div class="col-lg-12">
												<label class="col-md-3">督办人</label>
												<div class="col-md-6">
													<input class="form-control" id="newSupervisorId" type="hidden">
													<input class="form-control" id="newSupervisor" type="text" onfocus="choicePerson(this);">
												</div>
												<div class="col-md-3">
													<button class="form-control" onclick="removeChoice(this);return false;">清除选中</button>
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
													<input class="form-control" id="easyWorkName" type="text">
												</div>
											</div>
										</div>
									</div>
									<div class="row">
										<div class="form-group">
											<div class="col-lg-12">
												<label class="col-md-3">责任人</label>
												<div class="col-md-9">
													<input class="form-control" id="easyLiablePersonId" type="hidden">
													<input class="form-control" id="easyLiablePerson" type="text">
												</div>
											</div>
										</div>
									</div>
									<div class="row">
										<div class="form-group">
											<div class="col-lg-12">
												<label class="col-md-3">督办人</label>
												<div class="col-md-9">
													<input class="form-control" id="easySupervisorId" type="hidden">
													<input class="form-control" id="easySupervisor" type="text">
												</div>
											</div>
										</div>
									</div>
									<div class="row">
										<div class="form-group">
											<div class="col-lg-12">
												<label class="col-md-3">工作要求</label>
												<div class="col-md-9">
													<textarea class="form-control" rows="5" cols="5" id="easySupervisorStrategy"></textarea>
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
			<div class="modal-dialog" style="width:630px;">
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
						<div style="height:180px;">
							<div class="container">
								<div class="row">
									<div class="form-group">
										<div class="col-lg-12">
											<label class="col-md-3">选择导出模板</label>
											<div class="col-md-5">
												<select class="selectpicker" id="exportTemplate">
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
						<button type="button" class="btn btn-primary" onclick="exportDetailListDu();">
							导出
						</button>
					</div>
				</div><!-- /.modal-content -->
			</div><!-- /.modal -->
		</div>
	</div>
</body>
</html>