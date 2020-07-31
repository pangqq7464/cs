<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
	pageContext.setAttribute("path", path);
	pageContext.setAttribute("basePath", basePath);
%>
<!DOCTYPE HTML>
<html>
	<head>

		<base href="${basePath}">
		<meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">


    <title>登录</title>
    <meta name="keywords" content="H+后台主题,后台bootstrap框架,会员中心主题,后台HTML,响应式后台">
    <meta name="description" content="H+是一个完全响应式，基于Bootstrap3最新版本开发的扁平化主题，她采用了主流的左右两栏式布局，使用了Html5+CSS3等现代技术">

    <link rel="shortcut icon" href="favicon.ico"> <link href="back/css/bootstrap.min.css?v=3.3.6" rel="stylesheet">
    <link href="back/css/font-awesome.css?v=4.4.0" rel="stylesheet">

    <link href="back/css/animate.css" rel="stylesheet">
    <link href="back/css/style.css?v=4.1.0" rel="stylesheet">
    <!--[if lt IE 9]>
    <meta http-equiv="refresh" content="0;ie.html" />
    <![endif]-->
    <script>
    
    if(window.top !== window.self){ window.top.location = window.location;}
    
 
	
    </script>
</head>

<body class="gray-bg">
        <div>

           <h1 style="color:#458B00" align = "center" class="logo-name">吉林特产点评网</h1>

        </div>
    <div class="middle-box text-center loginscreen  animated fadeInDown">
    <div>
        
            <h3>欢迎进入吉林特产点评网</h3>

            <form class="m-t" role="form" method="post" action="back/loginDo">
                <div class="form-group">
                    <input type="text" name="user_account" class="form-control" placeholder="用户名" required="">
                </div>
                <div class="form-group">
                    <input type="password" name="user_password" class="form-control" placeholder="密码" required="">
                </div>
            <!--     <div class="form-group">
                    <input type="text"  name="check_code" class="form-control" placeholder="验证码" onblur="if(this.value==''){this.value='验证码:'}" onclick="if(this.value=='验证码:'){this.value='';}" value="验证码:" style="width:150px;required="">
                    
                </div>
                <div class="form-group">
                    <img align="left"src="/Beauty/CheckServlet.do">
                    
                </div> -->
               
                 <div class="form-group">
                    <span style="color: red;">${message }</span>
                </div>
                <button type="submit" style="background:#458B00"class="btn btn-primary block full-width m-b">登 录</button>
                <c:if test="${!(empty message) }"><p style="color:red">${message}</p></c:if>

                <p class="text-muted text-center"> <a href="login.html#"><small>忘记密码了？</small></a> | <a href="back/regist">注册一个新账号</a>
                </p>

            </form>
        </div>
    </div>

    <!-- 全局js -->
    <script src="back/js/jquery.min.js?v=2.1.4"></script>
    <script src="back/js/bootstrap.min.js?v=3.3.6"></script>

    <script type="text/javascript" src="http://tajs.qq.com/stats?sId=9051096" charset="UTF-8"></script>
    <!--统计代码，可删除-->

</body>

</html>