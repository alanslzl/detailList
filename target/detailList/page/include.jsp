<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+""+path;
%>
<link rel="stylesheet" href="<%=path %>/page/js/bootstrap/dist/css/bootstrap.css">
<link rel="stylesheet" href="<%=path %>/page/css/bootstrap-select.css">
<link rel="stylesheet" href="<%=path %>/page/css/bootstrap-table.css">
<link rel="stylesheet" href="<%=path %>/page/css/bootstrap-datetimepicker.css">

<link id="bs-css" href="css/bootstrap-cerulean.min.css" rel="stylesheet">
<link href="css/charisma-app.css" rel="stylesheet">
<link href='bower_components/fullcalendar/dist/fullcalendar.css' rel='stylesheet'>
<link href='bower_components/fullcalendar/dist/fullcalendar.print.css' rel='stylesheet' media='print'>
<link href='bower_components/chosen/chosen.min.css' rel='stylesheet'>
<link href='bower_components/colorbox/example3/colorbox.css' rel='stylesheet'>
<link href='bower_components/responsive-tables/responsive-tables.css' rel='stylesheet'>
<link href='bower_components/bootstrap-tour/build/css/bootstrap-tour.min.css' rel='stylesheet'>
<link href='css/jquery.noty.css' rel='stylesheet'>
<link href='css/noty_theme_default.css' rel='stylesheet'>
<link href='css/elfinder.min.css' rel='stylesheet'>
<link href='css/elfinder.theme.css' rel='stylesheet'>
<link href='css/jquery.iphone.toggle.css' rel='stylesheet'>
<link href='css/uploadify.css' rel='stylesheet'>
<link href='css/animate.min.css' rel='stylesheet'>

<script src="<%=path %>/page/js/jquery/jquery.js"></script>
<script src="<%=path %>/page/js/bootstrap/dist/js/bootstrap.js"></script>
<script src="<%=path %>/page/js/bootstrap/dist/js/bootstrap-select.js"></script>
<script src="<%=path %>/page/js/bootstrap/dist/js/bootstrap-paginator.js"></script>
<script src="<%=path %>/page/js/bootstrap/dist/js/bootstrap-datetimepicker.js"></script>
<script src="<%=path %>/page/js/bootstrap/dist/js/bootstrap-datetimepicker.zh-CN.js"></script>
<script src="<%=path %>/page/js/bootstrap/dist/js/bootstrap-table.js"></script>
<script src="<%=path %>/page/js/bootstrap/dist/js/bootstrap-table-zh-CN.js"></script>

<script src="js/jquery.cookie.js"></script>
<script src='bower_components/moment/min/moment.min.js'></script>
<script src='bower_components/fullcalendar/dist/fullcalendar.min.js'></script>
<script src='js/jquery.dataTables.min.js'></script>
<script src="bower_components/chosen/chosen.jquery.min.js"></script>
<script src="bower_components/colorbox/jquery.colorbox-min.js"></script>
<script src="js/jquery.noty.js"></script>
<script src="bower_components/responsive-tables/responsive-tables.js"></script>
<script src="bower_components/bootstrap-tour/build/js/bootstrap-tour.min.js"></script>
<script src="js/jquery.raty.min.js"></script>
<script src="js/jquery.iphone.toggle.js"></script>
<script src="js/jquery.autogrow-textarea.js"></script>
<script src="js/jquery.uploadify-3.1.min.js"></script>
<script src="js/jquery.history.js"></script>
<script src="js/charisma.js"></script>