<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="./include.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="<%=path%>/page/css/bootstrap-treeview.min.css">
<script type="text/javascript" src="<%=path%>/page/js/bootstrap-treeview.min.js"></script>
<title>工作录入</title>
<style type="text/css">
.form-control {
	width: 100%;
}

#curxNodes {
	border: 1px solid black;
}

.modal.in .modal-dialog {
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
..file-drop-zone{
	height:120px;
}
@media ( min-width :768px) {
	.modal-dialog {
		width: 600px
	}
}
</style>
<script type="text/javascript">
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
function addNode(obj) {
	var node = $("#node").clone();
	$(obj).parents(".addNodeInfo").next("#nodeDiv").append(node);
	node.show();
	initTimePicker();
}
function subManyWork(){
	fileInputs();
	setTimeout(function(){
		subFunction();
	}, 2000);
}
function subFunction(){
	var manyWork = [];
	$("#manyDiv").find(".workclz").each(function(){
		var work = {};
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
			node.nodeName = $(this).find("#nodeName").val();
			node.nodeContent = $(this).find("#nodeContent").val();
			node.nodeFinishTime = $(this).find("#nodeFinishTime").val();
			node.nodeLiable = $(this).find("#nodeLiableId").val();
			work.nodeList.push(node);
		});
		manyWork.push(work);
	});
	$.ajax({   
		type:"POST", //提交方式   
		url:"<%=path%>/work/addWork.do",//路径
		data:{
			"workListStr":JSON.stringify(manyWork)
		},//数据，这里使用的是Json格式进行传输   
		success:function(data) {//返回数据根据结果进行相应的处理
			alert(data);
		}
	});
}
function fileInputs(){
	$("#manyDiv").find(".workclz").each(function(){
		$(this).find('#enclosure').fileinput('upload');
	});
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
	//createChoicePersonTable();
	createTable("choicePersonTable");
	$("#choicePersonModal").modal();
	personInput = obj;
}
//责任人人人员选择方法
function choicePersonInfo(){
	var choiceInfoArr = [];
	var showNames = [];
	var userNos = [];
	var personVal = $(personInput).val();
	var personNo = $(personInput).prev().val();
	if(personVal!=''){
		showNames.push(personVal);
		userNos.push(personNo);
	}
	var rows = $('#choicePersonTable').bootstrapTable('getSelections');
	for(var i = 0 ; i < rows.length;i++){
		var userNo = rows[i].pernr;
		var surnName = rows[i].nachn;
		var name = rows[i].vorna;
		var info = {
			'userNo':userNo,	
			'names':surnName + "" +name
		}
		if(!IsInArray(userNos,userNo)){
			showNames.push(surnName + "" +name);
			choiceInfoArr.push(info);
			userNos.push(userNo);
		}
	}
	$("#choicePersonModal").modal("hide");
	$(personInput).val(showNames)
	$(personInput).prev().val(userNos)
}
//判断方法 后面的值是否在前面的数组中
function IsInArray(arr,val){ 
	var testStr=','+arr.join(",")+","; 
	return testStr.indexOf(","+val+",")!=-1; 
}
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
	$(workInput).parent().parent().parent().find("#mergeWorkDiv").html("<div class='col-md-1'></div>");
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
	getTreeJSON();
	$("#choiceCompany").modal();
	choiceCompanyInput=obj;
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
	$(choiceCompanyInput).val(selectedNode.text);
	$("#choiceCompany").modal("hide");
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
	      //search: true,
	      //searchAlign: "left",
	      strictSearch: true,
	      searchOnEnterKey: true,
	      sidePagination: 'client', // 设置为服务器端分页
	      queryParams: function (params) { // 请求服务器数据时发送的参数，可以在这里添加额外的查询参数，返回false则终止请求
	          return {
	              personInfo: $("#choicePersonInfo").val() // 额外添加的参数
	          }
	      },
	      sortName: 'id', // 要排序的字段
	      sortOrder: 'desc', // 排序规则
	      columns: [
	          {
	        	  field:'choiceUserCheck',
	              radio: true, // 显示一个勾选框
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
        allowedFileExtensions: ['jpg', 'gif', 'png','doc','docx','pdf','ppt','pptx','txt','xls','xlsx'],//接收的文件后缀  
        showCaption: false,//是否显示标题
        browseClass: "btn btn-primary", //按钮样式     
        dropZoneEnabled: false,//是否显示拖拽区域
        //minImageWidth: 50, //图片的最小宽度
        //minImageHeight: 50,//图片的最小高度
        //maxImageWidth: 1000,//图片的最大宽度
        //maxImageHeight: 1000,//图片的最大高度
        maxFileSize: 0,//单位为kb，如果为0表示不限制文件大小
        //minFileCount: 0,
        maxFileCount: 10, //表示允许同时上传的最大文件个数
        enctype: 'multipart/form-data',
        validateInitialCount:true,
        previewFileIcon: "<i class='glyphicon glyphicon-king'></i>",
        msgFilesTooMany: "选择上传的文件数量({n}) 超过允许的最大数值{m}！",
    }).on('filepreupload', function(event, data, previewId, index) {     //上传中
        console.log('文件正在上传');
    }).on("fileuploaded", function (event, data, previewId, index) {    //一个文件上传成功
        console.log('文件上传成功！'+data);
        var response = data.response;
        var enclosureId = $(this).parents(".file-input").parent().find("#enclosureId").val();
        if(enclosureId!=''){
        	 enclosureId = enclosureId+","+response;
        }else{
        	enclosureId=response;
        }
        $(this).parents(".file-input").parent().find("#enclosureId").val(enclosureId);
    }).on('fileerror', function(event, data, msg) {  //一个文件上传失败
        console.log('文件上传失败！');
    });
}
</script>
</head>
<body>
	<div id="manyDiv">
		<div class="row">
			<div class="col-md-12">
				<div class="col-md-12" align="right">
		   			<div class="form-group">
						<div class="col-md-12">
							<button class="btn btn-primary" id="addManyWork" onclick="addManyWork();">多条工作</button>
						</div>
					</div>  
		   		</div>
			</div>
		</div>
		
	</div>
	<div style="padding-top: 30px;"></div>
	<div class="row">
		<div class="form-group">
			<div class="col-lg-12">
				<div class="col-md-12" align="center">
					<button class="btn btn-primary" onclick="subManyWork();">发布</button>
					<button class="btn btn-primary">取消</button>
				</div>
			</div>
		</div>
	</div>
	<div class="container workclz" id="cpworkDiv" style="border: 1px solid red;margin-top: 10px;display: none;" >
			<div style="padding-top: 20px;"></div>
			<div class="row">
				<div class="form-group">
					<div class="col-lg-12">
						<label class="col-md-1">工作名称</label>
						<div class="col-md-10">
							<input class="form-control" id="workName" type="text">
						</div>
						<a id="closeDivGly" href="#" style="display: none;" class="btn btn-round btn-default" onclick="closeWorkDiv(this);"><i class="glyphicon glyphicon-remove"></i></a>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="form-group">
					<div class="col-lg-6">
						<label class="col-md-2">责任人</label>
						<div class="col-md-6">
							<input class="form-control" id="liablePersonId" type="hidden">
							<input class="form-control" id="liablePerson" type="text" onfocus="choicePerson(this);">
						</div>
					</div>
					<div class="col-lg-6">
						<label class="col-md-2">督办人</label>
						<div class="col-md-6">
							<input class="form-control" id="supervisorId" type="hidden">
							<input class="form-control" id="supervisor" type="text" onfocus="choicePerson(this);">
						</div>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="form-group">
					<div class="col-lg-12">
						<label class="col-md-1">工作要求</label>
						<div class="col-md-9">
							<textarea class="form-control" id="jobRequire" rows="5"
								cols="5"></textarea>
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
								<select id="mettingType">
								</select>
							</div>
						</div>
						<div class="col-lg-6">
							<label class="col-md-2">工作单位</label>
							<div class="col-md-5">
								<input class="form-control" id="workCompanyId" type="hidden">
								<input class="form-control" id="workCompany" type="text" onfocus="choiceCompany(this);">
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
				                    <input id="finishTime" class="form-control" type="text" readonly>
				                    <span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
				                </div>
							</div>
						</div>
						<div class="col-lg-6">
							<label class="col-md-2">工作标签</label>
							<div class="col-md-10">
								<select size="50" id="workLabel">
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
								<div class="input-group date form_date col-md-12" data-date="" data-date-format="dd MM yyyy" data-link-format="yyyy-mm-dd">
				                    <input id="mettingTime" class="form-control" type="text" readonly>
				                    <span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
				                </div>
							</div>
						</div>
						<div class="col-lg-6">
							<label class="col-md-2">工作状态</label>
							<div class="col-md-10">
								<select size="50" id="workStatus">
									<option value="未开始">未开始</option>
									<option value="进行中">进行中</option>
									<option value="已完成">已完成</option>
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
								<select size="50" id="workLevel">
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
								<input class="form-control" id="inputCompanyId" type="hidden"/>
								<input class="form-control" id="inputCompany" type="text" onfocus="choiceCompany(this);"/>
							</div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="form-group">
						<div class="col-lg-12">
							<label class="col-md-1">督办策略</label>
							<div class="col-md-9">
								<textarea id="supervisorStrategy" class="form-control" rows="5" cols="5"></textarea>
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
				</div>
			</div>
			<div style="padding-top: 30px;"></div>
			<div class="row">
				<div class="form-group">
					<div id="mergeWorkDiv" class="col-lg-12">
					</div>
					<div class="col-lg-12">
						<label class="col-md-1">工作合并</label>
						<div class="col-md-11">
							<input class="form-control" id="mergeIds" type="hidden">
							<button type="button" class="btn btn-default" data-toggle="modal" onclick="choiceWork(this);">合并工作</button>
						</div>
					</div>
					
				</div>
			</div>
			<div class="row">
				<div class="form-group">
					<div class="col-lg-12">
						<label class="col-md-1">附件</label>
						<div class="col-md-11">
							<input class="form-control" id="enclosureId" type="hidden">
							<input id="enclosure" name="enclosure" type="file" multiple  class="file-loading"  data-show-upload="false" data-show-caption="true">
						</div>
					</div>
				</div>
			</div>
		</div>
	<div style="width: 100%;display: none;margin-top: 10px;" id="node" class="nodeclz">
		<div class="row">
			<div class="form-group">
				<div class="col-lg-12">
					<label class="col-md-1">关键节点</label>
					<div class="col-md-9">
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
	<div class="modal fade" id="choiceWorkModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title" id="myModalLabel">工作列表</h4>
				</div>
				<div class="modal-body">
					<div style="height:530px;overflow: auto;">
							<div class="ch-container">
								<div class="row">
									<div class="form-group">
										<div class="col-lg-12">
											<label class="col-md-3">工作信息</label>
											<div class="col-md-7">
												<input class="form-control" id="queryWorkInfo" type="text">
											</div>
											<button type="button" class="btn btn-primary" onclick="createChoiceWorkTable();">查询</button>
										</div>
									</div>
								</div>
								<div class="row">
									<table class="table table-striped table-bordered responsive" id="choiceWorkTable">
									</table>
								</div>
							</div>
						</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button type="button" class="btn btn-primary" onclick="choiceWorkInfo();">提交更改</button>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
	</div>
	<!-- /.modal -->
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
							<ul class="nav nav-tabs" id="myTab">
								  <li class="active"><a href="#home">人员选择</a></li>
								  <li><a href="#profile">工作组选择</a></li>
							</ul>
							<div class="tab-content">
							  <div class="tab-pane active" id="home">
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
							  <div class="tab-pane" id="profile">
							  		<div class="ch-container">
										<div class="row">
											<div class="form-group">
												<div class="col-lg-12">
													<label class="col-md-3">工作组信息</label>
													<div class="col-md-7">
														<input class="form-control" id="choicePersonGroupInfo" type="text">
													</div>
													<button type="button" class="btn btn-primary" onclick="createChoicePersonGroupTable();">查询</button>
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
						<button type="button" class="btn btn-primary" onclick="choicePersonInfo();">
							确认
						</button>
					</div>
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
</body>
<script type="text/javascript">
	$(function(){
		//initMettingType();
		//initWorkLabel();
		//$("#cpworkDiv").find("#workLevel").selectpicker("refresh");
		//$("#cpworkDiv").find("#workStatus").selectpicker("refresh");
		addManyWork();
	});
</script>
</html>