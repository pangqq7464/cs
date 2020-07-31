<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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

        <title>系统用户管理</title>

        <link rel="shortcut icon" href="favicon.ico"> <link href="back/css/bootstrap.min.css?v=3.3.6" rel="stylesheet">
        <link href="back/css/font-awesome.css?v=4.4.0" rel="stylesheet">

        <link href="back/css/animate.css" rel="stylesheet">
        <link href="back/css/style.css?v=4.1.0" rel="stylesheet">
        <link href="artDialog/css/ui-dialog.css" rel="stylesheet" type="text/css" />
        <script type="text/javascript">
        function userAdd() {
			var d = top.dialog({
				url:'UserAdd.do',
			    title: '添加员工',
			    width:600,
			    height:400,
			    onclose:function (){
			    	//刷新页面
			    	window.location.reload();
			    }
			});
			d.showModal();
		}
		function userUpd(user_id,user_status) {
			var d = top.dialog({
				url:'back/userUpdStatus?user_id='+user_id+"&user_status="+user_status,
			    title: '修改员工信息',
			    width:600,
			    height:400,
			    onclose:function (){
			    	//刷新页面
			    	window.location.reload();
			    }
			});
			d.showModal();
		}
		function userDel(user_id) {
			var d = top.dialog({
				url:'UserDel.do?user_id='+user_id,
			    title: '删除员工',
			    width:600,
			    height:400,
			    onclose:function (){
			    	//刷新页面
			    	window.location.reload();
			    }
			});
			d.showModal();
		}
        
        </script>

    </head>

<body class="gray-bg">

        <div class="row">
            <div class="col-sm-12">
                <div class="ibox">
                    <div class="ibox-title">
                        <h5>系统用户管理</h5>
                        <!--<div class="ibox-tools">
                            <a href="projects.html" class="btn btn-primary btn-xs">创建新项目</a>
                        </div>-->
                    </div>
                    <div class="ibox-content">
                        <div class="row m-b-sm m-t-sm">
                            <div class="col-md-2">
                               <!--  <button type="button" onclick="userAdd()" class="btn btn-primary btn-sm"><i class="fa fa-user-plus"></i> 新建</button> -->
                                <button type="button" id="user-loading-btn" class="btn btn-white btn-sm"><i class="fa fa-refresh"></i> 刷新</button>
                            </div>
                            <form action="back/userList" method="post">
	                            <div class="col-md-2 ">
	                                <div class="input-group">
	                                    <input type="text" name="user_name" placeholder="请输入用户的姓名" value="${user_name }" >
	                                </div>
	                            </div>
	                            <div class="col-md-3">
	                                <div class="input-group">
	                                    <input type="text" name="user_account" placeholder="请输入用户的账号" value="${user_account }" ">
	                                    <span class="input-group-btn">
	                                        <button  class="btn btn-sm btn-primary"> 搜索</button>
	                                    </span>
	                                </div>
	                            </div>
                            </form>
                        </div>

                        <div class="project-list">

                            <table class="table table-hover">
                                <tbody>
                                	<tr>
                                	    <td width="100px" align="center">编码</td>
                                        <td width="100px" align="center">头像</td>
                                        <td width="100px" align="center">姓名</td>
                                        <td width="100px" align="center">账号</td>
                                        <td width="100px" align="center">电话</td>
                                        <td width="100px" align="center">性别</td>
                                        <td width="100px" align="center">年龄</td>
                      					<td width="100px" align="center">角色</td>
                                        <td width="100px" align="center">个人简介</td>
                                        <td width="100px" align="center">创建时间</td>
                                        <td width="100px" align="center">修改时间</td>
                                        <td width="100px" align="center">状态</td>
                                        <td width="100px" align="center">操作</td>
                                    </tr>
                                    <c:forEach items="${userList }" var="user">
	                                    <tr>
	                                    	<td width="100px" width="100px" align="center">${user.user_id }</td>
	                                        <td width="100px" align="center" class="client-avatar">
	                                            <img alt="image" src="upload/${user.user_image }">
	                                        </td>
	                                        <td width="100px" align="center">${user.user_name }</td>
	                                        <td width="100px" align="center">${user.user_account }</td>
	                                        <td width="100px" align="center">${user.user_tel }</td>
	                                        <td width="100px" align="center">${1 eq user.user_sex ? '男':'女' }</td>
	                                        <td width="100px" align="center">${user.user_age }</td>
	                                        <td width="100px" align="center">${1 eq user.role_id ? '超级管理员':'用户' }</td>
	                                        <td width="100px" align="center">${user.user_des}</td>
	                                        <td width="100px" align="center">  
	                                          <fmt:formatDate value="${user.createDate }" type="date" pattern="yyyy-MM-dd HH:mm:ss"/>
	                                        </td>
	                                         <td width="100px" align="center">  
	                                          <fmt:formatDate value="${user.updateDate}" type="date" pattern="yyyy-MM-dd HH:mm:ss"/>
	                                        </td>
	                                        <td width="100px" align="center">${1 eq user.user_status ?'已锁':'未锁' }</td>
	                                        <td width="100px" align="center">
	                                            <c:if test="${1 eq user.user_status }">
	                                            <a href="javascript:userUpd(${user.user_id },${user.user_status} );" class="btn btn-success btn-sm" ><i class="fa fa-pencil"></i> 解锁 </a>
	                                            </c:if>
	                                        </td>
	                                    </tr>
                                    </c:forEach>
                                    

                                </tbody>
                            </table>
                        </div>
                        <jsp:include page="../main/pages.jsp"></jsp:include>
                    </div>
                </div>
            </div>
        </div>

        <!-- 全局js -->
        <script src="back/js/jquery.min.js?v=2.1.4"></script>
        <script src="back/js/bootstrap.min.js?v=3.3.6"></script>
        <script src="back/js/plugins/layer/layer.min.js"></script>


        <!-- 自定义js -->
        <script src="back/js/content.js?v=1.0.0"></script>
		<script type="text/javascript" src="artDialog/dist/dialog-plus.js"></script>

        <script>
            $(document).ready(function(){
                $('#user-loading-btn').click(function () {
                    simpleLoad($(this), true)
                });

                $("#user-add-btn").click(function () {
                    window.location.href="system_user_add.html";
                });

                $(".user-status-btn").click(function () {
                    //获取两个自定义属性
                    var user_id = $(this).attr("pk-id");
                    var user_status = $(this).attr("user-status");
                    console.log("用户主键:"+user_id+",用户状态:"+user_status);

                    var textArray=["激活","禁用","注销"]

                    layer.confirm('您确定要['+textArray[user_status-1]+']操作吗？', {
                        skin: 'layui-layer-molv', //样式类名
                        btn: ['确定继续','取消'], //按钮
                        shade: 0.01, //显示遮罩
                        shift:6
                    }, function(){

                        //需要发送ajax请求
                        $.get("result.json",{user_id:user_id,user_status:user_status},function (data) {
                           if(data.flag=="success"){
                               window.location.reload();
                               return false;
                           }else{
                               layer.msg('操作失败');
                               return false;
                           }
                        })
                    }, function(){});

                });

                $(".user-role-btn").click(function () {
                    var user_id = $(this).attr("pk-id");
                    layer.open({
                        title:"系统用户设置角色",
                        type: 2,
                        area: ['400px', '220px'],
                        fixed: false, //不固定
                        shade: 0.01,
                        content: 'system_user_role.html?user_id='+user_id
                    });
                });

                $(".user-photo-btn").click(function () {
                    var user_id = $(this).attr("pk-id");
                    layer.open({
                        title:"系统用户头像",
                        type: 2,
                        area: ['350px', '400px'],
                        fixed: false, //不固定
                        shade: 0.01,
                        content: 'system_user_photo.html?user_id='+user_id
                    });
                });
            });

            function simpleLoad(btn, state) {
                if (state) {
                    btn.children().addClass('fa-spin');
                    btn.contents().last().replaceWith(" Loading");
                    window.location.reload();
                } else {
                    setTimeout(function () {
                        btn.children().removeClass('fa-spin');
                        btn.contents().last().replaceWith(" Refresh");
                        window.location.reload();
                    }, 2000);
                }
            }
        </script>


    </body>
</html>