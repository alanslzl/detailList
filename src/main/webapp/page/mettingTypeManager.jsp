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
	function addMettingType(){
		$("#mettingModal").modal();
	}
	function editMettingType(id){
		$("#mettingModal").modal();
	}
	function delDetailList(id){
		$.ajax({   
			type:"POST", //提交方式   
			url:"<%=path%>/MettingType/del.do",//路径
			data:{
				"id":id
			},//数据，这里使用的是Json格式进行传输   
			success:function(data) {//返回数据根据结果进行相应的处理
				window.location.reload();
			}
		});
	}
</script>
<body>
	<div class="ch-container">
		<div style="padding-top: 10px;"></div>
		   <div class="row">
				<div class="col-md-12">
					<div class="col-md-4">
						<label class="col-md-3">会议名称</label>
						<div class="col-md-8">
							<input class="form-control" id="mettingName" type="text" value="${labelName}">
						</div>
					</div>
					<div class="col-md-4">
						<label class="col-md-3">会议时间</label>
						<div class="col-md-8">
							<input class="form-control" id="mettingTime" type="text" value="${mettingTime}">
						</div>
					</div>
					<div class="col-md-4">
						<label class="col-md-3">会议录入人</label>
						<div class="col-md-8">
							<input class="form-control" id="insertUser" type="text" value="${insertUser}">
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
								<button class="btn btn-primary" onclick="addMettingType();">新增</button>
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
				                     <th>会议名称</th>
				                     <th>会议时间</th>
				                     <th>会议录入人</th>
				                     <th>操作</th>
				                 </tr>
			                 </thead>
			                 <tbody>
			                 	<c:forEach items="${metting}" var="metting">
			                 		<tr>
					                     <td class="center">${metting.mettingName}</td>
					                     <td class="center">${metting.mettingTime}</td>
					                     <td class="center">${metting.insertUser}</td>
					                     <td class="center">
					                         <a class="btn btn-info" href="#" onclick="editDetailList('${metting.id}');">
					                             <i class="glyphicon glyphicon-edit icon-white"></i>
					                             	编辑
					                         </a>
					                         <a class="btn btn-danger" href="#" onclick="delDetailList('${metting.id}');">
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
	
	
	<div class="modal fade" id="mettingModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
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
					<div style="height:530px;overflow: auto;">
						<div class="ch-container">
							
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭
					</button>
					<button type="button" class="btn btn-primary" onclick="">
						确认
					</button>
				</div>
			</div><!-- /.modal-content -->
		</div><!-- /.modal -->
	</div>
</body>
</html>