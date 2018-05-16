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
</head>
<script type="text/javascript">
	function delUserGroup(id){
		$.ajax({   
			type:"POST", //提交方式   
			url:"<%=path%>/UserGroup/del.do",//路径
			data:{
				"id":id
			},//数据，这里使用的是Json格式进行传输   
			success:function(data) {//返回数据根据结果进行相应的处理
				window.location.reload();
			}
		});
	}
	function addUserGroup(){
		$("#UserGroupId").val("");
		$("#UserGroupName").val("");
		$("#insertUser").val("");
		$("#myModalLabel").html("新增工作组");
		$("#UserGroupModal").modal();
	}
	function editUserGroup(id){
		$("#myModalLabel").html("修改工作组");
		$.ajax({   
			type:"POST", //提交方式   
			url:"<%=path%>/UserGroup/queryById.do",//路径
			data:{
				"id":id
			},//数据，这里使用的是Json格式进行传输   
			success:function(data) {//返回数据根据结果进行相应的处理
				console.log(data);
				$("#UserGroupId").val(data.id);
				$("#UserGroupName").val(data.userGroupName);
				$("#insertUser").val(data.insertUser);
			}
		});
		$("#UserGroupModal").modal();
	}
	function delUserGroup(id){
		$.ajax({   
			type:"POST", //提交方式   
			url:"<%=path%>/UserGroup/del.do",//路径
			data:{
				"id":id
			},//数据，这里使用的是Json格式进行传输   
			success:function(data) {//返回数据根据结果进行相应的处理
				window.location.reload();
			}
		});
	}
	function mergeUserGroup(){
		var UserGroupId = $("#UserGroupId").val();
		var UserGroupName = $("#UserGroupName").val();
		var insertUser = $("#insertUser").val();
		var userId = $("#userId").val();
		var url;
		if(UserGroupId!=null && UserGroupId!=''){
			url = "<%=path%>/UserGroup/edit.do";
		}else{
			url = "<%=path%>/UserGroup/add.do";
		}
		$.ajax({   
			type:"POST", //提交方式   
			url:url,//路径
			data:{
				"id":UserGroupId,
				"userGroupName":UserGroupName,
				"insertUser":insertUser,
				"userId":userId
			},//数据，这里使用的是Json格式进行传输   
			success:function(data) {//返回数据根据结果进行相应的处理
				window.location.reload();
			}
		});
	}
	var personInput;
	//选择责任人人员信息窗口
	function choicePerson(obj){
		createTable("choicePersonTable");
		$("#UserGroupModal").modal("hide");
		$("#choicePersonInfo").val("");
		createChoicePersonTable();
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
		$("#UserGroupModal").modal();
		$(personInput).val(showNames);
		$(personInput).prev().val(userNos);
	}
	//判断方法 后面的值是否在前面的数组中
	function IsInArray(arr,val){ 
		var testStr=','+arr.join(",")+","; 
		return testStr.indexOf(","+val+",")!=-1; 
	}
	//创建责任人table
	function createChoicePersonTable(){
		$('#choicePersonTable').bootstrapTable('refresh', { pageNumber: 1 });
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
</script>
<body>
	<div class="ch-container">
		<div style="padding-top: 10px;"></div>
		   <div class="row">
				<div class="col-md-12">
					<div class="col-md-5">
						<label class="col-md-3">工作组名称</label>
						<div class="col-md-8">
							<input class="form-control" id="queryuserGroupName" type="text" value="${queryuserGroupName}">
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
								<button class="btn btn-primary" onclick="addUserGroup();">新增</button>
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
				                     <th>工作组名称</th>
				                     <th>工作组说明</th>
				                     <th>操作</th>
				                 </tr>
			                 </thead>
			                 <tbody>
			                 	<c:forEach items="${userGroup}" var="userGroup">
			                 		<tr>
					                     <td class="center">${userGroup.groupName}</td>
					                     <td class="center">${userGroup.groupComment}</td>
					                     <td class="center">
					                         <a class="btn btn-info" href="#" onclick="editUserGroup('${userGroup.id}');">
					                             <i class="glyphicon glyphicon-edit icon-white"></i>
					                             	编辑
					                         </a>
					                         <a class="btn btn-danger" href="#" onclick="delUserGroup('${userGroup.id}');">
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
	
	
	<div class="modal fade" id="UserGroupModal" tabindex="-1" role="dialog" aria-labelledby="myUserGroupModal" aria-hidden="true">
		<div class="modal-dialog" style="width:800px;">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
						&times;
					</button>
					<h4 class="modal-title" id="myModalLabel">
					</h4>
				</div>
				<div class="modal-body">
					<div style="height:320px;overflow: auto;">
						<div class="ch-container">
							<div class="row">
								<div class="col-md-12">
									<label class="col-md-2">工作组名称</label>
									<div class="col-md-8">
										<input class="form-control" id="UserGroupId" type="hidden">
										<input class="form-control" id="UserGroupName" type="text">
										<input class="form-control" id="insertUser" type="hidden">
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-md-12">
									<label class="col-md-2">工作组人员选择</label>
									<div class="col-md-8" style="padding-left: 0px;">
										<div class="col-md-8">
											<input class="form-control" id="userId" type="hidden">
											<input class="form-control" id="userName" type="text" onfocus="choicePerson(this);">
										</div>
										<div class="col-md-4">
											<button class="form-control" onclick="removeChoice(this);">清除选中</button>
										</div>
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-md-12">
									<label class="col-md-2">工作组说明</label>
									<div class="col-md-8">
											<textarea id="groupComment" class="form-control" rows="5" cols="5"></textarea>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭
					</button>
					<button type="button" class="btn btn-primary" onclick="mergeUserGroup();">
						确认
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
</body>
</html>