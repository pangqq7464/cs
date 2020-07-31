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

        <title>H+ 后台主题UI框架 - 基本表单</title>

        <link rel="shortcut icon" href="favicon.ico">
        <link href="back/css/bootstrap.min.css?v=3.3.6" rel="stylesheet">
        <link href="back/css/font-awesome.css?v=4.4.0" rel="stylesheet">
        <link href="back/css/plugins/iCheck/custom.css" rel="stylesheet">
        <link href="back/css/animate.css" rel="stylesheet">
        <link href="back/css/style.css?v=4.1.0" rel="stylesheet">
    </head>
    <body class="gray-bg">
        <div style="height: 400px;overflow: scroll;" class="wrapper wrapper-content">
                <!-- 定义行数 -->
                <div class="row">
                    <!-- 定义列数 -->
                    <div class="col-md-12">
                        <div class="ibox float-e-margins">
                            <!-- 定义标题 -->
                            <div class="ibox-title">
                                <h5>系统用户管理 <small>修改用个人资料信息</small></h5>
                            </div>
                            <!-- 定义内容 -->
                            <div class="ibox-content">
                                <form method="post" class="form-horizontal" action="back/userUpdDo">
                                	<input type="hidden" name="user_id" value="${user.user_id }">
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">账号</label>
                                        <div class="col-sm-4">
                                            <input type="text" value="${user.user_account }" name="user_account" id="user_account" required="" class="form-control" autofocus>

                                        </div>
                                        <div class="col-sm-6">
                                            <span class="help-block m-b-none text-success">请输入唯一的账号信息,需要使用Ajax验证</span>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">姓名</label>
                                        <div class="col-sm-4">
                                            <input type="text" value="${user.user_name }" name="user_name" id="user_name" class="form-control">

                                        </div>
                                        <div class="col-sm-6">
                                            <span class="help-block m-b-none text-success"></span>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">电话</label>
                                        <div class="col-sm-4">
                                            <input type="text" value="${user.user_tel }" name="user_tel" id="user_tel" class="form-control">

                                        </div>
                                        <div class="col-sm-6">
                                            <span class="help-block m-b-none text-success"></span>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">年龄</label>
                                        <div class="col-sm-4">
                                            <input type="text" value="${user.user_age }" name="user_age" id="user_age" class="form-control">

                                        </div>
                                        <div class="col-sm-6">
                                            <span class="help-block m-b-none text-success"></span>
                                        </div>
                                    </div>
                                    
                                    <div class="form-group">
                                    
                                        <label class="col-sm-2 control-label">性别</label>
                                        <div class="col-sm-4">
                                            <div class="checkbox i-checks">
                                                <label>
                                                    <input type="radio" <c:if test="${1 eq user.user_sex }">checked="checked"</c:if> name="user_sex" value="1" > <i></i> 男
                                                </label>

                                                <label>
                                                    <input type="radio" <c:if test="${0 eq user.user_sex }">checked="checked"</c:if> name="user_sex" value="0" > <i></i> 女
                                                </label>
                                            </div>

                                        </div>
                                        <div class="col-sm-6">
                                            <span class="help-block m-b-none text-success"></span>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">个人简介</label>
                                        <div class="col-sm-4">
                                            <textarea row="10" col="60" name="user_des" class="form-control">${user.user_des }</textarea>
                                        </div>
                                        <div class="col-sm-6">
                                            <span class="help-block m-b-none text-success">请输入唯一的账号信息,需要使用Ajax验证</span>
                                        </div>
                                    </div>
                                    <div class="hr-line-dashed"></div>
                                    <div class="form-group">
                                        <div class="col-sm-4 col-sm-offset-2">
                                            <button class="btn btn-primary" type="submit">保存</button>
                                            <button class="btn btn-default" type="reset">取消</button>
                                            <button class="btn btn-white" type="button" onclick="javascript:history.back()">返回</button>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
        </div>

        <!-- 全局js -->
        <script src="back/js/jquery.min.js?v=2.1.4"></script>
        <script src="back/js/bootstrap.min.js?v=3.3.6"></script>

        <!-- 自定义js -->
        <script src="back/js/content.js?v=1.0.0"></script>

        <!-- iCheck -->
        <script src="back/js/plugins/iCheck/icheck.min.js"></script>
        <script>
            $(document).ready(function () {
                $('.i-checks').iCheck({
                    checkboxClass: 'icheckbox_square-green',
                    radioClass: 'iradio_square-green',
                });
            });
        </script>
    </body>
</html>