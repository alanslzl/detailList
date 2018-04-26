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
</head>
<script type="text/javascript">
	$(function(){ 
		$("#Bar").hide();
	});
	function queryWork(){
		window.location.href="./queryWork.jsp";
	}
	function editWork(){
		window.location.href="./queryWork.jsp";
	}
	function descWork(){
		window.location.href="./queryWork.jsp";
	}
	function queryLabelPage(page){
		window.location.href="<%=path%>/work/queryWorkManager.do?labelPage="+page;
	}
	function queryDeviceRecords(page){
		window.location.href="<%=path%>/work/queryWorkManager.do?tablePage="+page;
	}
	$(document).ready(function(){
		$("#hide").click(function(){
			$("#Graphical").toggle();
			$("#Bar").toggle();
		});
	});
</script>
<body>
	<div class="ch-container">
		<div style="padding-top:10px;"></div>
		<div class="row">
			<div class="col-md-12">
				<div class="col-md-4">
					<label class="col-md-3">清单名称</label>
					<div class="col-md-8">
						<input class="form-control" id="focusedInput" type="text">
					</div>
				</div>
				<div class="col-md-4">
					<label class="col-md-3">工作类别</label>
					<div class="col-md-8">
						<input class="form-control" id="focusedInput" type="text">
					</div>
				</div>
				<div class="col-md-4">
					<label class="col-md-3">责任人</label>
					<div class="col-md-8">
						<input class="form-control" id="focusedInput" type="text">
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
					<div class="box col-md-3">
						<div class="box-inner">
				            <div class="box-header well">
				                <h2><i class="glyphicon glyphicon-user"></i>${label.workName}</h2>
				                <div class="box-icon">
				                	<a href="#" class="btn btn-setting btn-round btn-default" title="编辑工作"><i
				                            class="glyphicon glyphicon-cog" onclick="editWork();"></i></a>
				                	<a href="#" class="btn btn-setting btn-round btn-default" title="查看详细"><i
				                            class="glyphicon glyphicon-th-list" onclick="descWork();"></i></a>
				                    <a href="#" class="btn btn-close btn-round btn-default"><i
				                            class="glyphicon glyphicon-remove"></i></a>
				                </div>
				            </div>
				            <div id="myTabContent" class="tab-content">
			                    <div class="tab-pane active" id="info">
			                        <h5>工作简介:
			                            <small>${label.workName}</small>
			                        </h5>
			                        <p>${label.workStatus}</p>
									<p>工作单位:${label.workCompany}</p>
			                        <p>负责人:${label.liablePerson}</p>
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
		                     <th>完成日期</th>
		                     <th>工作内容</th>
		                     <th>操作</th>
		                 </tr>
		                 </thead>
		                 <tbody>
		                 	<c:forEach items="${tableList}" var="table">
									<tr>
				                     <td>${table.workName}</td>
				                     <td class="center">${table.workName}</td>
				                     <td class="center">${table.workName}</td>
				                     <td class="center">${table.workName}</td>
				                     <td class="center">${table.workName}</td>
				                     <td class="center">
				                         <span class="label-warning label label-default">${table.workName}</span>
				                     </td>
				                     <td class="center">
				                         <a class="btn btn-success" href="#" onclick="descWork();">
				                             <i class="glyphicon glyphicon-zoom-in icon-white"></i>
				                           	 	查看
				                         </a>
				                         <a class="btn btn-info" href="#" onclick="editWork();">
				                             <i class="glyphicon glyphicon-edit icon-white"></i>
				                             	编辑
				                         </a>
				                         <a class="btn btn-danger" href="#">
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
</body>
</html>