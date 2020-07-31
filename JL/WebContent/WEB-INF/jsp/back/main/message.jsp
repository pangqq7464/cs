<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	pageContext.setAttribute("path", path);
	pageContext.setAttribute("basePath", basePath);
%>
<!DOCTYPE HTML>
<html>
<head>

<base href="${basePath}">
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">


<title>H+ 后台主题UI框架 - 基础表格</title>
<meta name="keywords" content="H+后台主题,后台bootstrap框架,会员中心主题,后台HTML,响应式后台">
<meta name="description"
	content="H+是一个完全响应式，基于Bootstrap3最新版本开发的扁平化主题，她采用了主流的左右两栏式布局，使用了Html5+CSS3等现代技术">

<link rel="shortcut icon" href="favicon.ico"> <link href="back/css/bootstrap.min.css?v=3.3.6" rel="stylesheet">
        <link href="back/css/font-awesome.css?v=4.4.0" rel="stylesheet">

        <link href="back/css/animate.css" rel="stylesheet">
        <link href="back/css/style.css?v=4.1.0" rel="stylesheet">
		<link href="artDialog/css/ui-dialog.css" rel="stylesheet" type="text/css" />
<script type="text/javascript">
	function closes() {
		var d = top.dialog.get(window);
		d.close();
		d.remove();
		return false;
	}
</script>
</head>

<body class="gray-bg">
					<br /><br /><br /><br /><br /><br /><br /><br /><br />
					<p style="font-size: 40px;" align="center">${message }</p>
					<br /><br /><br /><br />
					<p align="right" style="margin-right: 100px;"><button type="button" onclick="closes()" class="btn btn-outline btn-danger">关闭窗口</button></p>
	<!-- 全局js -->
        <script src="back/js/jquery.min.js?v=2.1.4"></script>
        <script src="back/js/bootstrap.min.js?v=3.3.6"></script>
        <script src="back/js/plugins/layer/layer.min.js"></script>


        <!-- 自定义js -->
        <script src="back/js/content.js?v=1.0.0"></script>
		<script type="text/javascript" src="artDialog/dist/dialog-plus.js"></script>
</body>


<!-- Mirrored from www.zi-han.net/theme/hplus/table_basic.html by HTTrack Website Copier/3.x [XR&CO'2014], Wed, 20 Jan 2016 14:20:01 GMT -->
</html>