<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="./include.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<title>工作管理</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="Charisma, a fully featured, responsive, HTML5, Bootstrap admin template.">
<meta name="author" content="Muhammad Usman">
<script type="text/javascript" src="<%=path%>/page/js/bootstrap-treeview.min.js"></script>
</head>
<script type="text/javascript">
	$(function(){ 
		$("#Bar").hide();
	});
	function queryWork(workId){
		window.location.href="<%=path%>/work/queryWorkById.do?workId="+workId;
	}
	function editWork(workId){
		window.location.href="<%=path%>/work/queryWorkById.do?workId="+workId;
	}
	function descWork(workId){
		window.location.href="<%=path%>/work/queryWorkById.do?workId="+workId;
	}
	function delWork(workId){
		
	}
	function queryLabelPage(page){
		$("#page").val(page);
		$("#queryForm").submit();
	}
	function queryDeviceRecords(page){
		$("#page").val(page);
		$("#queryForm").submit();
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
					return +($(obj).offset().top-50)
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
		$("#choiceCompany").modal();
	}
	function choiceCompanyInfo(){
		$("#workCompany").val(selectedNode.id);
		$("#workCompanyName").val(selectedNode.text);
		$("#choiceCompany").modal("hide");
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
	function initMettingType(workdiv){
		$.ajax({   
			type:"POST", //提交方式   
			url:"<%=path%>/mettingType/queryAll.do",//路径
			async:false,
			success:function(data) {//返回数据根据结果进行相应的处理
				var mettingTypeId = "${queryWork.mettingTypeId}";
				var select = $(workdiv).find("#mettingType");
				select.html("");
				select.append("<option value='' >请选择</option>")
				for(var i = 0 ; i < data.length;i++){
					if(data[i].id == mettingTypeId){
						select.append("<option selected='selected' value='"+data[i].id+"'>" + data[i].mettingName + "</option>");
					}else{
						select.append("<option value='"+data[i].id+"'>" + data[i].mettingName + "</option>");
					}
				}
				$(select).selectpicker("refresh");
			}
		});
	}
	function initWorkLevel(){
		$("#workLevel").val("${queryWork.workLevel}");
	}
	function initWorkLabel(workdiv){
		$.ajax({   
			type:"POST", //提交方式   
			url:"<%=path%>/workLabel/queryAll.do",//路径
			async:false,
			success:function(data) {//返回数据根据结果进行相应的处理
				var workLabelId = "${queryWork.workLabelId}";
				var select = $(workdiv).find("#workLabel");
				select.html("");
				select.append("<option value='' >请选择</option>")
				for(var i = 0 ; i < data.length;i++){
					if(data[i].id == workLabelId){
						select.append("<option selected='selected' value='"+data[i].id+"'>" + data[i].labelName + "</option>");
					}else{
						select.append("<option value='"+data[i].id+"'>" + data[i].labelName + "</option>");
					}
				}
				$(select).selectpicker("refresh");
			}
		});
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
	function initType(){
		var type = "${type}";
		$("#type").val(type);
		if(type=='label'){
			$("#Graphical").show();
			$("#Bar").hide();
		}else{
			$("#Graphical").hide();
			$("#Bar").show();
		}
	}
	$(document).ready(function(){
		initMettingType($("#queryWorkDiv"));
		initWorkLabel($("#queryWorkDiv"));
		initWorkLevel();
		initType();
		$("#hide").click(function(){
			var type = $("#type").val();
			if(type=='label'){
				type="table";
			}else{
				type="label";
			}
			$("#type").val(type);
			$("#Graphical").toggle();
			$("#Bar").toggle();
		});
	});
</script>
<body>
	<div class="ch-container">
		<div style="padding-top:10px;"></div>
		<form id="queryForm" action="<%=path%>/work/queryWorkManager.do" method="post">
			<div id="queryWorkDiv">
				<div class="row">
					<div class="col-md-12">
						<div class="col-md-4">
							<label class="col-md-3">工作名称</label>
							<div class="col-md-8">
								<input class="form-control" id="workName" name="workName" type="text" value="${queryWork.workName}">
							</div>
						</div>
						<div class="col-md-4">
							<label class="col-md-3">责任人</label>
							<div class="col-md-9" style="padding-left: 0px;">
								<input class="form-control" id="liablePersonId" name="liablePersonId" type="hidden" value="${queryWork.liablePersonId}">
								<input class="form-control" id="liablePerson" name="liablePerson" type="text" onfocus="choicePerson(this);" value="${queryWork.liablePerson}">
							</div>
						</div>
						<div class="col-md-4">
							<label class="col-md-3">督办人</label>
							<div class="col-md-9" style="padding-left: 0px;">
								<input class="form-control" id="supervisorId" name="supervisorId" type="hidden" value="${queryWork.supervisorId}">
								<input class="form-control" id="supervisor" name="supervisor" type="text" onfocus="choicePerson(this);" value="${queryWork.supervisor}">
							</div>
						</div>
					</div>
			   </div>
			   <div class="row">
					<div class="col-md-12">
						<div class="col-md-4">
							<label class="col-md-3">会议类型</label>
							<div class="col-md-8">
								<select class="form-control selectpicker" id="mettingType" name="mettingTypeId">
								</select>
							</div>
						</div>
						<div class="col-md-4">
							<label class="col-md-3">工作标签</label>
							<div class="col-md-9">
								<select class="form-control selectpicker" id="workLabel" name="workLabelId">
								</select>
							</div>
						</div>
						<div class="col-md-4">
							<label class="col-md-3">工作等级</label>
							<div class="col-md-9">
								<select class="form-control selectpicker" id="workLevel" name="workLevel">
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
					<div class="col-md-12">
						<div class="col-md-4">
							<label class="col-md-3">工作单位</label>
							<div class="col-md-8">
								<input class="form-control" id="workCompany" name="workCompany" type="hidden">
								<input class="form-control" id="workCompanyName" type="text" onfocus="choiceCompany();">
							</div>
						</div>
					</div>
			   </div>
			   <div class="row">
			   		<div class="col-md12">
			   			<div class="form-group">
							<div class="col-md-11" align="right">
								<input id="type" name="type" type="hidden"/>
								<input id="page" name="page" type="hidden"/>
								<button class="btn btn-primary">查询</button>
								<button class="btn btn-primary">重置</button>
							</div>
						</div>  
			   		</div>
			   </div>
		   </div>
	   </form>
	   <div style="padding-top: 10px;"></div>
	   <div class="row">
	   		<div class="col-md-12" >
		   		<div class="col-md-6" align="left">
		   			<div class="form-group">
						<div class="col-md-6">
							<button class="btn btn-primary" onclick="window.location.href='addWork.jsp'">新增</button>
						</div>
					</div>  
		   		</div>
		   		<div class="col-md-6" align="right">
		   			<button id="hide" type="button" class="btn btn-default">
						<span class="glyphicon glyphicon-sort-by-attributes"></span>
					</button>
				</div>
	   		</div>
	   </div>
		<div style="padding-top:10px;"></div>	
		<div id="Graphical" class="ch-container" >
			<div class=" row">
				<c:forEach items="${labelList}" var="label">
					<div class="box col-md-4">
						<div class="box-inner">
				            <div class="box-header well">
				                <h2><i class="glyphicon glyphicon-user"></i>${fn:substring(label.workName,0,12)}...</h2>
				                <div class="box-icon">
				                	<a href="#" class="btn btn-setting btn-round btn-default" title="编辑工作"><i
				                            class="glyphicon glyphicon-cog" onclick="editWork('${label.id}');"></i></a>
				                	<a href="#" class="btn btn-setting btn-round btn-default" title="查看详细"><i
				                            class="glyphicon glyphicon-th-list" onclick="descWork('${label.id}');"></i></a>
				                    <a href="#" class="btn btn-close btn-round btn-default"><i
				                            class="glyphicon glyphicon-remove"></i></a>
				                </div>
				            </div>
				            <div id="myTabContent" class="tab-content">
			                    <div class="tab-pane active" id="info">
			                        <h5>工作名称:
			                            <a href="#" onclick="descWork('${label.id}');">${fn:substring(label.workName,0,25)}...</a>
			                        </h5>
									<p>责任人:${label.liablePerson}</p>
			                        <p>督办人:${label.supervisor}</p>
			                        <p>工作要求:<small>${fn:substring(label.jobRequire,0,25)}...</small></p>
			                    </div>
			                </div>
			        	</div>
					</div>
				</c:forEach>
			</div>
			<div align="center">
				<div class="message">
                     	  共<i class="blue">${labelPage.total}</i>条记录，当前显示第&nbsp;<i class="blue">${labelPage.pageNum}/${labelPage.pages}</i>&nbsp;页
                   </div>
                   <div style="text-align:center;">
                       <ul class="pagination">
                           <c:if test="${!labelPage.isFirstPage}">
                               <li><a href="javascript:queryLabelPage(${labelPage.firstPage});">首页</a></li>
                               <li><a href="javascript:queryLabelPage(${labelPage.prePage});">上一页</a></li>
                           </c:if>
                           <c:forEach items="${labelPage.navigatepageNums}" var="navigatepageNum">
                               <c:if test="${navigatepageNum==labelPage.pageNum}">
                                   <li class="active"><a href="javascript:queryLabelPage(${navigatepageNum});">${navigatepageNum}</a></li>
                               </c:if>
                               <c:if test="${navigatepageNum!=labelPage.pageNum}">
                                   <li><a href="javascript:queryLabelPage(${navigatepageNum});">${navigatepageNum}</a></li>
                               </c:if>
                           </c:forEach>
                           <c:if test="${!labelPage.isLastPage}">
                               <li><a href="javascript:queryLabelPage(${labelPage.nextPage});">下一页</a></li>
                               <li><a href="javascript:queryLabelPage(${labelPage.lastPage});">最后一页</a></li>
                           </c:if>
                       </ul>
                   </div>
			</div>
		</div>
		
		<div class="row">
	  		<div id="Bar" class="col-md-12" style="display: none;">
	  			<div class="box-content">
					<table class="table table-striped table-bordered responsive">
		                 <thead>
		                 <tr>
		                     <th>工作名称</th>
		                     <th>会议类型</th>
		                     <th>工作单位</th>
		                     <th>责任人</th>
		                     <th>督办人</th>
		                     <th>工作内容</th>
		                     <th>操作</th>
		                 </tr>
		                 </thead>
		                 <tbody>
		                 	<c:forEach items="${tableList}" var="table">
									<tr>
				                     <td>${fn:substring(table.workName,0,17)}...</td>
				                     <td class="center">${table.mettingTypeId}</td>
				                     <td class="center">${table.workCompany}</td>
				                     <td class="center">${table.liablePerson}</td>
				                     <td class="center">${table.supervisor}</td>
				                     <td class="center">${fn:substring(table.jobRequire,0,20)}...</td>
				                     <td class="center">
				                         <a class="btn btn-success" href="#" onclick="descWork('${table.id}');">
				                             <i class="glyphicon glyphicon-zoom-in icon-white"></i>
				                           	 	查看
				                         </a>
				                         <a class="btn btn-info" href="#" onclick="editWork('${table.id}');">
				                             <i class="glyphicon glyphicon-edit icon-white"></i>
				                             	编辑
				                         </a>
				                         <a class="btn btn-danger" href="#" onclick="delWork('${table.id}');">
				                             <i class="glyphicon glyphicon-trash icon-white"></i>
				                            	 删除
				                         </a>
				                     </td>
				                 </tr>
		                 	</c:forEach>
		                 </tbody>
		             </table>
	            </div>
	            <div align="center">
					<div class="message">
                      	  共<i class="blue">${tablePage.total}</i>条记录，当前显示第&nbsp;<i class="blue">${tablePage.pageNum}/${tablePage.pages}</i>&nbsp;页
                    </div>
                    <div style="text-align:center;">
                        <ul class="pagination">
                            <c:if test="${!tablePage.isFirstPage}">
                                <li><a href="javascript:queryDeviceRecords(${tablePage.firstPage});">首页</a></li>
                                <li><a href="javascript:queryDeviceRecords(${tablePage.prePage});">上一页</a></li>
                            </c:if>
                            <c:forEach items="${tablePage.navigatepageNums}" var="navigatepageNum">
                                <c:if test="${navigatepageNum==tablePage.pageNum}">
                                    <li class="active"><a href="javascript:queryAllDevices(${navigatepageNum});">${navigatepageNum}</a></li>
                                </c:if>
                                <c:if test="${navigatepageNum!=tablePage.pageNum}">
                                    <li><a href="javascript:queryDeviceRecords(${navigatepageNum});">${navigatepageNum}</a></li>
                                </c:if>
                            </c:forEach>
                            <c:if test="${!tablePage.isLastPage}">
                                <li><a href="javascript:queryDeviceRecords(${tablePage.nextPage});">下一页</a></li>
                                <li><a href="javascript:queryDeviceRecords(${tablePage.lastPage});">最后一页</a></li>
                            </c:if>
                        </ul>
                    </div>
				</div>
			</div>
		</div>
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
</body>
</html>