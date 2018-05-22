<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="./include.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css"
	href="<%=path%>/page/css/bootstrap-treeview.min.css">
<script type="text/javascript"
	src="<%=path%>/page/js/bootstrap-treeview.min.js"></script>
<title>工作录入</title>
<style type="text/css">
.form-control {
	width: 100%;
}

#curxNodes {
	border: 1px solid black;
}

.
.file-drop-zone {
	height: 120px;
}
</style>
<script type="text/javascript">
function init(){
	$("#mettingType ").prop("disabled", true)
	$("#workLabel ").prop("disabled", true)
	$("#delLiablePerson").hide();	
	$("#delSupervisor").hide();
}

function initMettingType(workdiv){
	$.ajax({   
		type:"POST", //提交方式   
		url:"<%=path%>/mettingType/queryAll.do",//路径
		async:false,
		success:function(data) {//返回数据根据结果进行相应的处理
			var select = $(workdiv).find("#mettingType");
			select.html("");
			var mettingTypeId=$("#mettingTypeId").val();
			for(var i = 0 ; i < data.length;i++){
				if(data[i].id==mettingTypeId){
					select.append("<option  selected ='selected'  value='"+data[i].id+"'>" + data[i].mettingName + "</option>");
				}else{
				select.append("<option value='"+data[i].id+"'>" + data[i].mettingName + "</option>");
				}
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
			var workLabelId=$("#workLabelId").val();
			for(var i = 0 ; i < data.length;i++){
				if(data[i].id==workLabelId){
					select.append("<option  selected ='selected'  value='"+data[i].id+"'>" + data[i].labelName + "</option>");
				}else{
				select.append("<option value='"+data[i].id+"'>" + data[i].labelName + "</option>");
				}
			}
			$(select).selectpicker("refresh");
		}
	});
}
function initTimePicker(){
	$(".form_date").each(function(){
		$(this).datetimepicker({
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
	});
}

function bgSub(){
	
	var bgContent =$("#bgContent").val();
	if(bgContent!=null){
	var workId=$("#workId").val();
	$.ajax({   
		type:"POST", //提交方式   
		url:"<%=path%>/work/addWorkMsg.do",//路径
		data:{
			"bgContent":bgContent,
			"workId":workId
		},//数据，这里使用的是Json格式进行传输   
		success:function(data) {//返回数据根据结果进行相应的处理
			alert(data);
			window.location.href="<%=path%>/work/queryWorkById.do?workId="+workId;
		}
	});
	}else{
		alert("请输入要发表的内容!");
	}
}

function jxSub(){
	
	var jxContent =$("#jxContent").val();
	if(jxContent!=null){
	$.ajax({   
		type:"POST", //提交方式   
		url:"<%=path%>/work/addWorkMsg.do",//路径
		data:{
			"jxContent":jxContent,
			"workId":workId
		},//数据，这里使用的是Json格式进行传输   
		success:function(data) {//返回数据根据结果进行相应的处理
			alert(data);
			window.location.href="<%=path%>/work/queryWorkById.do?workId="+workId;
		}
	});
	}
}

function wcSub(){
	var wcContent =$("#wcContent").val();
	if(wcContent!=null){
	$.ajax({   
		type:"POST", //提交方式   
		url:"<%=path%>/work/addWorkMsg.do",//路径
		data:{
			"wcContent":wcContent,
			"workId":workId
		},//数据，这里使用的是Json格式进行传输   
		success:function(data) {//返回数据根据结果进行相应的处理
			alert(data);
			window.location.href="<%=path%>/work/queryWorkById.do?workId="+workId;
		}
	});
	}
}

function addWorkMsg(){
	var msgContent =$("#msgContent").val();
	if(msgContent!=null){
	var workId=$("#workId").val();
	$.ajax({   
		type:"POST", //提交方式   
		url:"<%=path%>/work/addWorkMsg.do",//路径
		data:{
			"msgContent":msgContent,
			"workId":workId
		},//数据，这里使用的是Json格式进行传输   
		success:function(data) {//返回数据根据结果进行相应的处理
			alert(data);
			window.location.href="<%=path%>/work/queryWorkById.do?workId="+workId;
		}
	});
	}else{
		alert("请输入要发表的内容!");
	}
}

function addNode(obj) {
	var node = $("#nodeMol").clone();
	$(obj).parents(".addNodeInfo").next("#nodeDiv").append(node);
	node.attr('id','node');
	node.show();
	initTimePicker();
}
function addManyWork() {
	var workdiv = $('#cpworkDiv').clone().attr("id","workDiv");
	workdiv.toggle();
	$("#manyDiv").append(workdiv);
	$(workdiv).find("#closeDivGly").show();
    createFileInput($(workdiv).find("#enclosure"));
	initTimePicker();
	initWorkLabel($(workdiv));
	initMettingType($(workdiv));
	$(workdiv).find("#workLevel").selectpicker("refresh");
	$(workdiv).find("#workStatus").selectpicker("refresh");
	$(workdiv).find(".selectpicker").each(function(){
		$(this).selectpicker('refresh');
		$(this).selectpicker('render');
		$(this).parent().parent().find(":first").remove();
	});
}
function descInfo(obj) {
	$(obj).parents(".addInfo").next(".detail").toggle();
}
function subManyWork(){
	fileInputs();
	setTimeout(function(){
		subFunction();
	}, 2000);
}
function subFunction(){
	var work = {};
	$("#manyDiv").find(".workclz").each(function(){
		work.id=$(this).find("#workId").val();
		work.workName = $(this).find("#workName").val();
		work.liablePerson = $(this).find("#liablePersonId").val();
		work.supervisor = $(this).find("#supervisorId").val();
		work.jobRequire = $(this).find("#jobRequire").val();
		work.mettingTypeId = $(this).find("#mettingType").val();
		work.workCompany = $(this).find("#workCompanyId").val();
		work.finishTime= $(this).find("#finishTime").val();
		work.workLabelId= $(this).find("#workLabelId").val();
		work.mettingTime= $(this).find("#mettingTime").val();
		work.workStatus= $(this).find("#workStatus").val();
		work.workLevel= $(this).find("#workLevel").val();
		work.inputCompany= $(this).find("#inputCompanyId").val();
		work.supervisorStrategy= $(this).find("#supervisorStrategy").val();
		work.mergeId = $(this).find("#mergeIds").val();
		work.enclosure=$(this).find("#enclosureId").val();
		work.nodeList = [];
		$(this).find("#nodediv").find(".nodeclz").each(function(){
			var node = {};
			node.id=$(this).find("#nodeId").val();
			node.nodeName = $(this).find("#nodeName").val();
			node.nodeContent = $(this).find("#nodeContent").val();
			node.finishTime = $(this).find("#nodeFinishTime").val();
			node.nodeLiable = $(this).find("#nodeLiableId").val();
			work.nodeList.push(node);
		});
	});
	$.ajax({   
		type:"POST", //提交方式   
		url:"<%=path%>/work/updateWork.do",//路径
		data:{
			"workListStr":JSON.stringify(work)
		},//数据，这里使用的是Json格式进行传输   
		success:function(data) {//返回数据根据结果进行相应的处理
			alert(data);
		}
	});
}
function fileInputs(){
	if($("#manyDiv").find(".workclz").find("#enclosure")[0].files.length>0){
		$("#manyDiv").find(".workclz").each(function(){
			$(this).find('#enclosure').fileinput('upload');
		});
	}
	return true;
}
function closeWorkDiv(obj){
	if($(obj).parents("#manyDiv").find(".workclz").length>1){
		$(obj).parents("#workDiv").remove();
	}
}
function closeNodeDiv(obj){
	$(obj).parents("#node").remove();
}
//创建责任人table
function createChoicePersonTable(){
	$('#choicePersonTable').bootstrapTable('refresh', { pageNumber: 1 });
}
//创建工作table
function createChoiceWorkTable(){
	$('#choiceWorkTable').bootstrapTable('refresh', { pageNumber: 1 });
}
var personInput;
//选择责任人人员信息窗口
function choicePerson(obj){
	personInput = obj;
	$("#choicePersonInfo").val("");
	$("#choicePersonModal").modal().css({
		"margin-top":function(){
			if($(obj).offset().top<280){
				return +($(obj).offset().top-120)
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
var workInput;
//选择工作信息窗口
function choiceWork(obj){
	createWorkTable("choiceWorkTable");
	$("#choiceWorkModal").modal();
	workInput = obj;
}
//工作选择方法
function choiceWorkInfo(){
	var mergeWorkIds = [];
	var rows = $('#choiceWorkTable').bootstrapTable('getSelections');
	for(var i = 0 ; i < rows.length;i++){
		var workId = rows[i].id;
		var workName = rows[i].workName;
		$(workInput).parent().parent().parent().find("#mergeWorkDiv").append("<div class='col-md-3'><div class='alert alert-success'><strong>"+workName+"</strong></div></div>");
		mergeWorkIds.push(workId);
	}
	$(workInput).prev().val(mergeWorkIds);
	$("#choiceWorkModal").modal("hide");
}

var choiceCompanyInput;
//选择工作单位
function choiceCompany(obj){
	var personType=$("#personType").val();
	if(personType==1){
	getTreeJSON();
	$("#choiceCompany").modal();
	choiceCompanyInput=obj;
	}
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
                	 console.log(data);
                     selectedNode.id=data['nodeId'];
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
function choiceCompanyInfo(){
	$(choiceCompanyInput).prev().val(selectedNode.id);
	alert(selectedNode.id);
	$(choiceCompanyInput).val(selectedNode.text);
	alert(selectedNode.text);
	$("#choiceCompany").modal("hide");
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
			console.log(personVal+""+personNo);
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
function createChoicePersonGroupTable(){
	$('#choicePersonGroupTable').bootstrapTable('refresh', { pageNumber: 1 });
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
function createWorkTable(tableName){
	$("#"+tableName).bootstrapTable({ // 对应table标签的id
		  method: 'post',
		  contentType : "application/x-www-form-urlencoded",
	      url: "<%=path%>/work/queryWork.do", // 获取表格数据的url
	      cache: false, // 设置为 false 禁用 AJAX 数据缓存， 默认为true
	      striped: true,  //表格显示条纹，默认为false
	      pagination: true, // 在表格底部显示分页组件，默认false
	      clickToSelect: true,
	      pageList: [5,10], // 设置页面可以显示的数据条数
	      height: 440,
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
	      columns: [
	          {
	        	  field:'choiceWorkCheck',
	        	  radio: true, // 显示一个勾选框
	              align: 'center' // 居中显示
	              
	          }, {
	              field: 'id', // 返回json数据中的name
	              align: 'center', // 左右居中
	              valign: 'middle', // 上下居中
	              visible:false
	          }, {
	              field: 'workName', // 返回json数据中的name
	              title: '工作名称', // 表格表头显示文字
	              align: 'center', // 左右居中
	              valign: 'middle' // 上下居中
	          }, {
	              field: 'workCompany', // 返回json数据中的name
	              title: '工作单位', // 表格表头显示文字
	              align: 'center', // 左右居中
	              valign: 'middle' // 上下居中
	          }, {
	              field: 'workStatus', // 返回json数据中的name
	              title: '工作状态', // 表格表头显示文字
	              align: 'center', // 左右居中
	              valign: 'middle' // 上下居中
	          }, {
	              field: 'workLevel', // 返回json数据中的name
	              title: '工作等级', // 表格表头显示文字
	              align: 'center', // 左右居中
	              valign: 'middle' // 上下居中
	          }, {
	              field: 'workLabelId', // 返回json数据中的name
	              title: '工作标签', // 表格表头显示文字
	              align: 'center', // 左右居中
	              valign: 'middle' // 上下居中
	          }, {
	              field: 'mettingTypeId', // 返回json数据中的name
	              title: '会议类型', // 表格表头显示文字
	              align: 'center', // 左右居中
	              valign: 'middle' // 上下居中
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
//初始化fileinput
function createFileInput(obj){
	$(obj).fileinput({
        language: 'zh', //设置语言
        uploadUrl: '<%=path%>/work/uploadEnclosure.do', //上传的地址
							allowedFileExtensions : [ 'jpg', 'gif', 'png',
									'doc', 'docx', 'pdf', 'ppt', 'pptx', 'txt',
									'xls', 'xlsx' ],//接收的文件后缀  
							showCaption : false,//是否显示标题
							browseClass : "btn btn-primary", //按钮样式     
							dropZoneEnabled : false,//是否显示拖拽区域
							//minImageWidth: 50, //图片的最小宽度
							//minImageHeight: 50,//图片的最小高度
							//maxImageWidth: 1000,//图片的最大宽度
							//maxImageHeight: 1000,//图片的最大高度
							maxFileSize : 0,//单位为kb，如果为0表示不限制文件大小
							//minFileCount: 0,
							maxFileCount : 10, //表示允许同时上传的最大文件个数
							enctype : 'multipart/form-data',
							validateInitialCount : true,
							previewFileIcon : "<i class='glyphicon glyphicon-king'></i>",
							msgFilesTooMany : "选择上传的文件数量({n}) 超过允许的最大数值{m}！",
						}).on('filepreupload',
						function(event, data, previewId, index) { //上传中
							console.log('文件正在上传');
						}).on(
						"fileuploaded",
						function(event, data, previewId, index) { //一个文件上传成功
							console.log('文件上传成功！' + data);
							var response = data.response;
							var enclosureId = $(this).parents(".file-input")
									.parent().find("#enclosureId").val();
							if (enclosureId != '') {
								enclosureId = enclosureId + "," + response;
							} else {
								enclosureId = response;
							}
							$(this).parents(".file-input").parent().find(
									"#enclosureId").val(enclosureId);
						}).on('fileerror', function(event, data, msg) { //一个文件上传失败
					console.log('文件上传失败！');
				});
	}
	function removeChoice(obj) {
		$(obj).parent().prev().find("input").each(function() {
			$(this).val("");
		});
	}
</script>
</head>
<body>
	<div id="manyDiv"></div>
	<div style="padding-top: 30px;"></div>
	<div class="row" id="subWorkDiv">
		<div class="form-group">
			<div class="col-lg-12">
				<c:if test="${personType =='1'}">
					<div class="col-md-12" align="center">
						<button class="btn btn-primary" onclick="subManyWork();">发布</button>
						<c:if test="${personType =='结项申请中'}">
						<button class="btn btn-primary" data-toggle="modal"
									data-target="#jxModal">结项</button>
						</c:if>
						</div>
				</c:if>
				<c:if test="${personType =='0'}">
					<div class="col-md-12" align="center">
				<c:if test="${work =='未完成'}">
						<button class="btn btn-primary" data-toggle="modal"
									data-target="#bgModal"">变更申请</button>
				</c:if>
				<c:if test="${work =='进行中'}">
				<button class="btn btn-primary" data-toggle="modal"
								data-target="#jxModal">结项申请</button>
								
					</c:if>
						</div>
				</c:if>
			</div>
		</div>
	</div>
	
	<div style="padding-top: 30px;"></div>
			<div class="row" style="margin-left: 20%;">
				<div class="form-group">
					<div class="col-lg-12">
						<label class="col-md-2">沟通记录</label>
					</div>
				</div>
			</div>
			<div class="row" style="width: 64%; margin-left: 18%;">
				<div class="form-group">
					<div class="col-lg-12">
						<table class="table">

								<tbody>
								<c:forEach items="${listWorkMsg}" var="msg">
								<tr>
									<td style="text-align: left;">${msg.msgName}</td>
									<td style="text-align: right; word-break:break-all;">
									<fmt:formatDate pattern='yyyy年MM月dd日 hh:mm' value='${msg.msgTime}'></fmt:formatDate>
									</td>
								</tr>
								<tr>
									<td colspan="2">${msg.msgContent}</td>
								</tr>
								</c:forEach>
								<tr>
									<td colspan="2"><textarea class="form-control" rows="5"
											cols="5" id="msgContent">关于***********</textarea></td>
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
							<button type="button" class="btn btn-primary" onclick="addWorkMsg()">提交</button>
						</div>
					</div>
				</div>
			</div>
	<div class="container workclz" id="cpworkDiv"
		style="border: 1px solid red; margin-top: 10px; display: none;">
		<div style="padding-top: 20px;"></div>
		<div class="row">
			<div class="form-group">
				<div class="col-lg-12">
					<label class="col-md-1">工作名称</label>
					<div class="col-md-10">
					<input class="form-control" id="workId" type="hidden"
							value="${work.id}">
						<input class="form-control" id="personType" type="hidden"
							value="${personType}"> <input class="form-control"
							id="workName" type="text" value="${work.workName}">
					</div>
					<a id="closeDivGly" href="#" style="display: none;"
						class="btn btn-round btn-default" onclick="closeWorkDiv(this);"><i
						class="glyphicon glyphicon-remove"></i></a>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="form-group" id="choiceG">
				<div class="col-lg-6">
					<label class="col-md-2">责任人</label>
					<div class="col-md-9" style="padding-left: 0px;">
						<div class="col-md-8">
							<input class="form-control" id="liablePersonId" type="hidden"
								value="${work.liablePersonUserId}"> <input
								class="form-control" id="liablePerson" type="text"
								onfocus="choicePerson(this);" value="${work.liablePerson}">
						</div>
						<div class="col-md-4" id="delLiablePerson">
							<button class="form-control" onclick="removeChoice(this);">清除选中</button>
						</div>
					</div>
				</div>
				<div class="col-lg-6">
					<label class="col-md-2">督办人</label>
					<div class="col-md-9" style="padding-right: 44px;">
						<div class="col-md-8">
							<input class="form-control" id="supervisorId" type="hidden"
								value="${work.supervisorUserId}"> <input
								class="form-control" id="supervisor" type="text"
								onfocus="choicePerson(this);" value="${work.supervisor}">
						</div>
						<div class="col-md-4" id="delSupervisor">
							<button class="form-control" onclick="removeChoice(this);">清除选中</button>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="form-group">
				<div class="col-lg-12">
					<label class="col-md-1">工作要求</label>
					<div class="col-md-9">
						<textarea class="form-control" id="jobRequire" rows="5" cols="5">${work.jobRequire}</textarea>
					</div>
				</div>
			</div>
		</div>
		<div class="addInfo row">
			<div class="form-group">
				<div class="col-lg-12">
					<label class="col-md-1">详细信息+</label>
					<div class="col-md-5">
						<button type="button" class="btn btn-default"
							onclick="descInfo(this)">详细信息</button>
					</div>
				</div>
			</div>
		</div>
		<div class="detail" style="display: none;">
			<div class="row">
				<div class="form-group">
					<div class="col-lg-6">
						<label class="col-md-2">会议类型</label>
						<div class="col-md-10">
							<input class="form-control" id="mettingTypeId" type="hidden"
								value="${work.mettingTypeId}"> <select id="mettingType">
							</select>
						</div>
					</div>
					<div class="col-lg-6">
						<label class="col-md-2">工作单位</label>
						<div class="col-md-5">
							<input class="form-control" id="workCompanyId" type="hidden"
								value="${work.workCompany}"> <input class="form-control"
								id="workCompany" type="text" onfocus="choiceCompany(this);"
								value="${work.workCompanyName}">
						</div>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="form-group">
					<div class="col-lg-6">
						<label class="col-md-2">完成日期</label>
						<div class="col-md-6">
							<div class="input-group date form_date col-md-12" data-date=""
								data-date-format="dd MM yyyy" data-link-format="yyyy-mm-dd">
								<input id="finishTime" class="form-control" type="text" readonly
									value="<fmt:formatDate pattern='yyyy-MM-dd' value='${work.finishTime}'></fmt:formatDate>"> <span
									class="input-group-addon"><span
									class="glyphicon glyphicon-calendar"></span></span>
							</div>
						</div>
					</div>
					<div class="col-lg-6">
						<label class="col-md-2">工作标签</label>
						<div class="col-md-10">
							<input class="form-control" id="workCompanyId" type="hidden"
								value="${work.workLabelId}"> <select size="50"
								id="workLabel">
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
							<div class="input-group date form_date col-md-12" data-date=""
								data-date-format="dd MM yyyy" data-link-format="yyyy-mm-dd">
								<input id="mettingTime" class="form-control" type="text" 
									readonly value="<fmt:formatDate pattern='yyyy-MM-dd' value='${work.mettingTime}'></fmt:formatDate>"/> 
									
									
									<span
									class="input-group-addon"><span
									class="glyphicon glyphicon-calendar"></span></span>
							</div>
						</div>
					</div>
					<div class="col-lg-6">
						<label class="col-md-2">工作状态</label>
						<div class="col-md-10">
							<select size="50" id="workStatus">
								<option value="${work.workStatus}">${work.workStatus}</option>
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

							<select size="50" id="workLevel" value="${work.workLevel}">
								<option value="A">A</option>
								<option value="B">B</option>
								<option value="C">C</option>
								<option value="L">L</option>
							</select>
						</div>
					</div>
					<div class="col-lg-6">
						<label class="col-md-2">录入单位</label>
						<div class="col-md-5">
							<input class="form-control" id="inputCompanyId" type="hidden"
								value="${work.inputCompany}" /> <input class="form-control"
								id="inputCompany" type="text" onfocus="choiceCompany(this);"
								value="${work.inputCompanyName}" />
						</div>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="form-group">
					<div class="col-lg-12">
						<label class="col-md-1">督办策略</label>
						<div class="col-md-9">
							<textarea id="supervisorStrategy" class="form-control" rows="5"
								cols="5">${work.supervisorStrategy}</textarea>
						</div>
					</div>
				</div>
			</div>
			<div class="addNodeInfo row">
					<div class="form-group">
						<div class="col-lg-12">
							<label class="col-md-1">关键节点+</label>
							<div class="col-md-11">
								<button type="button" class="btn btn-default" onclick="addNode(this);">增加关键节点</button>
							</div>
						</div>
					</div>
				</div>
			<div id="nodeDiv">
				<c:forEach items="${listNode}" var="node">

					<div style="width: 100%; margin-top: 10px;" id="node"
						class="nodeclz">
						<div class="row">
							<div class="form-group">
								<div class="col-lg-12">
									<label class="col-md-1">关键节点</label>
									<div class="col-md-9">
										<input class="form-control" id="nodeId" type="hidden"
											value="${node.id}" >
									</div>
									<div class="col-md-9">
										<input class="form-control" id="nodeName" type="text"
											value="${node.nodeName}">
									</div>
									<div class="col-md-1">
										<a href="#" class="btn btn-round btn-default"
											onclick="closeNodeDiv(this)"><i
											class="glyphicon glyphicon-remove"></i></a>
									</div>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="form-group">
								<div class="col-lg-12">
									<label class="col-md-1">节点内容</label>
									<div class="col-md-9">
										<textarea id="nodeContent" class="form-control" rows="5"
											cols="5">${node.nodeContent}</textarea>
									</div>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="form-group">
								<div class="col-lg-6">
									<label class="col-md-2">完成日期</label>
									<div class="col-md-6">
										<div class="input-group date form_date col-md-12" data-date=""
											data-date-format="dd MM yyyy" data-link-format="yyyy-mm-dd">
											<input id="nodeFinishTime" class="form-control" type="text"
												readonly value="<fmt:formatDate pattern='yyyy-MM-dd' value='${node.finishTime}'></fmt:formatDate>"> <span
												class="input-group-addon"><span
												class="glyphicon glyphicon-calendar"></span></span>
										</div>
									</div>
								</div>
								<div class="col-lg-5">
									<label class="col-md-3">节点负责人</label>
									<div class="col-md-5">
										<input class="form-control" id="nodeLiableId" type="hidden"
											readonly value="${node.nodeLiable}"> <input
											class="form-control" id="nodeLiable" type="text"
											onfocus="choicePerson(this);" value="${node.nodeLiableName}">
									</div>
								</div>
							</div>
						</div>
					</div>

				</c:forEach>
			</div>
			<div style="padding-top: 30px;"></div>
			<div class="row">
				<div class="form-group">
					<div id="mergeWorkDiv" class="col-lg-12">
						<c:forEach items="${listMergeWork}" var="merge">
							<div class='col-md-3'>
								<div class='alert alert-success'>
									<strong>${merge.mergeWorkName}</strong>
								</div>
							</div>
						</c:forEach>
					</div>
					<div class="col-lg-12">
						<label class="col-md-1">工作合并</label>
						<div class="col-md-11">
							<input class="form-control" id="mergeIds" type="hidden" >
							<button type="button" class="btn btn-default" data-toggle="modal"
								onclick="choiceWork(this);">合并工作</button>
						</div>
					</div>
				</div>
				<div style="padding-top: 30px;"></div>
				<div class="row">
					<div class="form-group">
						<div id="mergeWorkDiv" class="col-lg-12">
						</div>
						<div class="col-lg-12">
							<label class="col-md-1">关联工作</label>
							<div class="col-md-11">
								<input class="form-control" id="relationIds" type="hidden">
								<button type="button" class="btn btn-default" data-toggle="modal" onclick="choiceWork(this);">工作关联</button>
							</div>
						</div>
					</div>
				</div>
				
				
			</div>
			<div class="row">
				<div class="form-group">
				<div id="enclosureDiv" class="col-lg-12">
						<label class="col-md-1"></label>
						<c:forEach items="${listEnclosuerWork}" var="enc">
							<div class='col-md-3'>
								<div class='alert alert-success'>
									<a>${enc.enclosure}</a>
								</div>
							</div>
						</c:forEach>
					</div>
					<div class="col-lg-12">
						<label class="col-md-1">附件</label>
						<div class="col-md-11">
							<input class="form-control" id="enclosureId" type="hidden">
							<input id="enclosure" name="enclosure" type="file" multiple
								class="file-loading" data-show-upload="false"
								data-show-caption="true">
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="modal fade" id="choiceWorkModal" tabindex="-1"
		role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title" id="myModalLabel">工作列表</h4>
				</div>
				<div class="modal-body">
					<div style="height: 530px; overflow: auto;">
						<div class="ch-container">
							<div class="row">
								<div class="form-group">
									<div class="col-lg-12">
										<label class="col-md-3">工作信息</label>
										<div class="col-md-7">
											<input class="form-control" id="queryWorkInfo" type="text">
										</div>
										<button type="button" class="btn btn-primary"
											onclick="createChoiceWorkTable();">查询</button>
									</div>
								</div>
							</div>
							<div class="row">
								<table class="table table-striped table-bordered responsive"
									id="choiceWorkTable">
								</table>
							</div>
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button type="button" class="btn btn-primary"
						onclick="choiceWorkInfo();">提交更改</button>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
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
	<div class="modal fade" id="choiceCompany" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog" style="width: 800px;">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title" id="myModalLabel">选择工作单位</h4>
				</div>
				<div class="modal-body">
					<div style="height: 530px; overflow: auto;">
						<div class="ch-container">
							<div id="tree"></div>
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭
					</button>
					<button type="button" class="btn btn-primary"
						onclick="choiceCompanyInfo();">确认</button>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal -->
	</div>
	
	
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
									<td><textarea class="form-control" rows="5" cols="5" id="jxContent"></textarea></td>
								</tr>
							</table>
						</div>

						<div class="modal-footer">
							<button type="button" class="btn btn-default"
								data-dismiss="modal">关闭</button>
							<button type="button" class="btn btn-primary" onclick="jxSub()">提交更改</button>
						</div>
					</div>
				</div>
				<!-- /.modal-content -->
			</div>
			
			<div class="modal fade" id="wcModal" tabindex="-1" role="dialog"
				aria-labelledby="wcModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal"
								aria-hidden="true">&times;</button>
							<h4 class="modal-title" id="wcModalLabel">同意结项</h4>
						</div>
						<div class="modal-body">
							<table class="table">
								<tr>
									<td style="vertical-align: middle; text-align: center;"><label>结项总结</label></td>
								</tr>
								<tr>
									<td><textarea class="form-control" rows="5" cols="5" id="wcContent"></textarea></td>
								</tr>
							</table>
						</div>

						<div class="modal-footer">
							<button type="button" class="btn btn-default"
								data-dismiss="modal">关闭</button>
							<button type="button" class="btn btn-primary" onclick="wcSub()">提交更改</button>
						</div>
					</div>
				</div>
				<!-- /.modal-content -->
			</div>
			
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
									<td><textarea class="form-control" rows="5" cols="5" id="bgContent"></textarea></td>
								</tr>
							</table>
						</div>

						<div class="modal-footer">
							<button type="button" class="btn btn-default"
								data-dismiss="modal">关闭</button>
							<button type="button" class="btn btn-primary" onclick="bgSub()">提交更改</button>
						</div>
					</div>
				</div>
				<!-- /.modal-content -->
			</div>
			<!-- /.modal -->
			
			<div style="width: 100%;display: none;margin-top: 10px;" id="nodeMol" class="nodeclz">
		<div class="row">
			<div class="form-group">
				<div class="col-lg-12">
					<label class="col-md-1">关键节点</label>
					<div class="col-md-9">
					<input class="form-control" id="nodeId" type="hidden">
						<input class="form-control" id="nodeName" type="text">
					</div>
					<div class="col-md-1">
						<a href="#" class="btn btn-round btn-default" onclick="closeNodeDiv(this)"><i class="glyphicon glyphicon-remove"></i></a>
					</div>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="form-group">
				<div class="col-lg-12">
					<label class="col-md-1">节点内容</label>
					<div class="col-md-9">
						<textarea id="nodeContent" class="form-control" rows="5"
							cols="5"></textarea>
					</div>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="form-group">
				<div class="col-lg-6">
					<label class="col-md-2">完成日期</label>
					<div class="col-md-6">
						<div class="input-group date form_date col-md-12" data-date="" data-date-format="dd MM yyyy" data-link-format="yyyy-mm-dd">
		                    <input id="nodeFinishTime" class="form-control" type="text" readonly>
		                    <span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
		                </div>
					</div>
				</div>
				<div class="col-lg-5">
					<label class="col-md-3">节点负责人</label>
					<div class="col-md-5">
						<input class="form-control" id="nodeLiableId" type="hidden">
						<input class="form-control" id="nodeLiable" type="text" onfocus="choicePerson(this);">
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript">
	$(function() {
		//initMettingType();
		//initWorkLabel();
		//$("#cpworkDiv").find("#workLevel").selectpicker("refresh");
		//$("#cpworkDiv").find("#workStatus").selectpicker("refresh");

		$("#addManyWork").hide();
		var personType = $("#personType").val();
		if (personType == 0) {
			init();
		}
		addManyWork();
	});
</script>
</html>