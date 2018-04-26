<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+""+path;
%>
<link id="bs-css" href="<%=basePath%>/backer/css/bootstrap-cerulean.min.css" rel="stylesheet">
<link href="<%=basePath%>/backer/css/charisma-app.css" rel="stylesheet">
<link href='<%=basePath%>/backer/bower_components/fullcalendar/dist/fullcalendar.css' rel='stylesheet'>
<link href='<%=basePath%>/backer/bower_components/fullcalendar/dist/fullcalendar.print.css' rel='stylesheet' media='print'>
<link href='<%=basePath%>/backer/bower_components/chosen/chosen.min.css' rel='stylesheet'>
<link href='<%=basePath%>/backer/bower_components/colorbox/example3/colorbox.css' rel='stylesheet'>
<link href='<%=basePath%>/backer/bower_components/responsive-tables/responsive-tables.css' rel='stylesheet'>
<link href='<%=basePath%>/backer/bower_components/bootstrap-tour/build/css/bootstrap-tour.min.css' rel='stylesheet'>
<link href='<%=basePath%>/backer/css/jquery.noty.css' rel='stylesheet'>
<link href='<%=basePath%>/backer/css/noty_theme_default.css' rel='stylesheet'>
<link href='<%=basePath%>/backer/css/elfinder.min.css' rel='stylesheet'>
<link href='<%=basePath%>/backer/css/elfinder.theme.css' rel='stylesheet'>
<link href='<%=basePath%>/backer/css/jquery.iphone.toggle.css' rel='stylesheet'>
<link href='<%=basePath%>/backer/css/uploadify.css' rel='stylesheet'>
<link href='<%=basePath%>/backer/css/animate.min.css' rel='stylesheet'>

<script src="<%=basePath%>/backer/bower_components/jquery/jquery.min.js"></script>
<script src="<%=basePath%>/backer/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
<script src="<%=basePath%>/backer/js/jquery.cookie.js"></script>
<script src='<%=basePath%>/backer/bower_components/moment/min/moment.min.js'></script>
<script src='<%=basePath%>/backer/bower_components/fullcalendar/dist/fullcalendar.min.js'></script>
<script src='<%=basePath%>/backer/js/jquery.dataTables.min.js'></script>
<script src="<%=basePath%>/backer/bower_components/chosen/chosen.jquery.min.js"></script>
<script src="<%=basePath%>/backer/bower_components/colorbox/jquery.colorbox-min.js"></script>
<script src="<%=basePath%>/backer/js/jquery.noty.js"></script>
<script src="<%=basePath%>/backer/bower_components/responsive-tables/responsive-tables.js"></script>
<script src="<%=basePath%>/backer/bower_components/bootstrap-tour/build/js/bootstrap-tour.min.js"></script>
<script src="<%=basePath%>/backer/js/jquery.raty.min.js"></script>
<script src="<%=basePath%>/backer/js/jquery.iphone.toggle.js"></script>
<script src="<%=basePath%>/backer/js/jquery.autogrow-textarea.js"></script>
<script src="<%=basePath%>/backer/js/jquery.uploadify-3.1.min.js"></script>
<script src="<%=basePath%>/backer/js/jquery.history.js"></script>
<script src="<%=basePath%>/backer/js/charisma.js"></script>
<script src="<%=basePath%>/backer/bower_components/jquery/jquery.min.js"></script>

