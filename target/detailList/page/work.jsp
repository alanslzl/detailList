<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="./include.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="Charisma, a fully featured, responsive, HTML5, Bootstrap admin template.">
<meta name="author" content="Muhammad Usman">
</head>

<script type="text/javascript">
	function queryWork(){
		window.location.href="./queryWork.jsp";
	}
	function descDetailList(){
		window.location.href="./descDetailList.jsp";
	}
	$(function(){
		$("#detailListBody tr").click(function(){
			window.location.href="./descDetailList.jsp";
		});
		$("#matterBody tr").click(function(){
			window.location.href="./queryWork.jsp";
		});
		$("#workWarnningBody tr").click(function(){
			window.location.href="./queryWork.jsp";
		});
	});
</script>
<body>
<div>
	<div class="row">
        <div class="box col-md-12">
            <div class="box-inner">
                <div class="box-header well" data-original-title="">
                    <h2><i class="glyphicon glyphicon-user"></i> 待办事项</h2>

                    <div class="box-icon">
                        <a href="#" class="btn btn-minimize btn-round btn-default"><i
                                class="glyphicon glyphicon-chevron-up"></i></a>
                        <a href="#" class="btn btn-close btn-round btn-default"><i
                                class="glyphicon glyphicon-remove"></i></a>
                    </div>
                </div>
                <div class="box-content">
                    <table class="table table-striped table-bordered responsive">
                        <thead>
	                        <tr>
	                            <th>事项简介</th>
	                            <th>时间</th>
	                        </tr>
	                        </thead>
	                        <tbody id="matterBody">
		                        <tr>
		                            <td>XXX工作结项申请</td>
		                            <td class="center">2012/03/01</td>
		                        </tr>
		                        <tr>
		                            <td>XXX工作结项申请</td>
		                            <td class="center">2012/03/01</td>
		                        </tr>
		                        <tr>
		                            <td>XXX工作变更申请</td>
		                            <td class="center">2012/03/01</td>
		                        </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
	<div class="row">
		<div class="box col-md-12">
            <div class="box-inner">
                <div class="box-header well" data-original-title="">
                    <h2><i class="glyphicon glyphicon-user"></i> 工作预警</h2>

                    <div class="box-icon">
                        <a href="#" class="btn btn-minimize btn-round btn-default"><i
                                class="glyphicon glyphicon-chevron-up"></i></a>
                        <a href="#" class="btn btn-close btn-round btn-default"><i
                                class="glyphicon glyphicon-remove"></i></a>
                    </div>
                </div>
                <div class="box-content">
                    <table class="table table-striped table-bordered responsive">
                        <thead>
                        <tr>
                            <th>工作名称</th>
                            <th>所属部门</th>
                            <th>责任人</th>
                            <th>时间</th>
                        </tr>
                        </thead>
                        <tbody id="workWarnningBody">
	                        <tr>
	                            <td>关于***********工作</td>
	                            <td class="center">起重机事业部</td>
	                            <td class="center">张三</td>
	                            <td class="center">2012/03/01</td>
	                        </tr>
	                        <tr>
	                            <td>关于***********工作</td>
	                            <td class="center">流程信息化事业部</td>
	                            <td class="center">李四</td>
	                            <td class="center">2012/03/01</td>
	                        </tr>
	                        <tr>
	                            <td>关于***********工作</td>
	                            <td class="center">泵送事业部</td>
	                            <td class="center">张三</td>
	                            <td class="center">2012/03/01</td>
	                        </tr>
	                        <tr>
	                            <td>关于***********工作</td>
	                            <td class="center">泵送事业部</td>
	                            <td class="center">张三</td>
	                            <td class="center">2012/03/01</td>
	                        </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
		<div align="center">
			<ul class="pagination">
				<li>
					 <a href="#">Prev</a>
				</li>
				<li>
					 <a href="#">1</a>
				</li>
				<li>
					 <a href="#">2</a>
				</li>
				<li>
					 <a href="#">3</a>
				</li>
				<li>
					 <a href="#">4</a>
				</li>
				<li>
					 <a href="#">5</a>
				</li>
				<li>
					 <a href="#">Next</a>
				</li>
			</ul>
		</div>
	</div>
</div>
</body>
</html>