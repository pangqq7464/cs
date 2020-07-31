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

        <title>系统特产管理</title>

        <link rel="shortcut icon" href="favicon.ico"> <link href="back/css/bootstrap.min.css?v=3.3.6" rel="stylesheet">
        <link href="back/css/font-awesome.css?v=4.4.0" rel="stylesheet">

        <link href="back/css/animate.css" rel="stylesheet">
        <link href="back/css/style.css?v=4.1.0" rel="stylesheet">
        <link href="artDialog/css/ui-dialog.css" rel="stylesheet" type="text/css" />
        <style type="text/css">
			 table {  
		            width:450px;  
		            table-layout:fixed;  
		        }  
        	td {  
		            white-space:nowrap;  
		            overflow:hidden;  
					text-overflow: ellipsis;
        		} 
        </style>
        <script type="text/javascript">
		function specialtyUpd(specialty_id) {
			var d = top.dialog({
				url:'back/specialtyUpd?specialty_id='+specialty_id,
			    title: '修改特产信息',
			    width:600,
			    height:400,
			    onclose:function (){
			    	//刷新页面
			    	window.location.reload();
			    }
			});
			d.showModal();
		}
		function specialtyAdd() {
			var d = top.dialog({
				url:'back/specialtyAdd',
			    title: '添加特产信息',
			    width:600,
			    height:400,
			    onclose:function (){
			    	//刷新页面
			    	window.location.reload();
			    }
			});
			d.showModal();
		}
		function specialtyDel(specialty_id) {
			var d = top.dialog({
				url:'back/specialtyDel?specialty_id='+specialty_id,
			    title: '添加特产信息',
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
                        <h5>系统特产信息管理</h5>
                        <!--<div class="ibox-tools">
                            <a href="projects.html" class="btn btn-primary btn-xs">创建新项目</a>
                        </div>-->
                    </div>
                    <div class="ibox-content">
                        <div class="row m-b-sm m-t-sm">
                            <div class="col-md-2">
                                <button type="button" onclick="specialtyAdd()" class="btn btn-primary btn-sm"><i class="fa fa-specialty-plus"></i> 新建</button>
                                <button type="button" id="specialty-loading-btn" class="btn btn-white btn-sm"><i class="fa fa-refresh"></i> 刷新</button>
                            </div>
                            
                            <form action="back/specialtyList" method="post">
	                            <div class="form-group">
			                            
			                            <div class="col-sm-4">
                                          <select  name="specialty_localCity" id="specialty_localCity"onchange="choseFirstCityHandler(this.value)">
											   	 <option value="0" selected>===请选择市===</option>
												 <c:forEach items="${list}" var="city">
												 <option value="${city.city_id}" class="first_chose">${city.city_name }</option>
												 </c:forEach>
										    </select>
											<select name="specialty_localRegion" id="specialty_localRegion">
												<option value="0" selected>===请选择地区===</option>
											</select>

                                        </div>
                                        <div class="col-md-3">
			                                <div class="input-group">
			                                    <input type="text" name="specialty_name" placeholder="请输入特产名称" >
			                                    <span class="input-group-btn">
			                                        <button  class="btn btn-sm btn-primary"> 搜索</button>
			                                    </span>
			                                </div>
			                            </div>
	                            </div>
                            </form> 
                        </div>

                        <div class="project-list">

                            <table class="table table-hover" table-layout: fixed;>
                                <tbody>
                                	<tr>
                                	    <td width="100px" align="center">编码</td>
                                        <td width="100px" align="center">图片</td>
                                        <td width="100px" align="center">特产名称</td>
                                        <td width="100px" align="center">特产类型</td>
                                        <td width="100px" align="center">特产归属</td>
                                        <td width="100px" align="center">特产简介</td>
                                        <td width="100px" align="center">创建时间</td>
                                        <td width="100px" align="center">修改时间</td>
                                        <td width="100px" align="center">操作</td>
                                    </tr>
                                    <c:forEach items="${specialtyList }" var="specialty">
	                                    <tr>
	                                    	<td width="100px" width="100px" align="center">${specialty.specialty_id }</td>
	                                        <td width="100px" align="center" class="client-avatar">
	                                            <img alt="image" src="upload/${specialty.specialty_img }">
	                                        </td>
	                                          <td width="100px" align="center">${specialty.specialty_name}</td>
	                                        <td width="100px" align="center">${specialty.type.type_name}</td>
	                                        <td width="100px" align="center">吉林省-${specialty.city.city_name}-${specialty.region.region_name}</td>
	                                        <td width="100px" align="center">${specialty.specialty_des}</td>
	                                        <td width="100px" align="center">  
	                                            <fmt:formatDate value="${specialty.createDate}" type="date" pattern="yyyy-MM-dd HH:mm:ss"/>
	                                        </td>
	                                         <td width="100px" align="center">  
	                                      		<fmt:formatDate value="${specialty.updateDate}" type="date" pattern="yyyy-MM-dd HH:mm:ss"/>
	                                        </td>
	                                        <td width="100px" align="center">
	                                            <a href="javascript:specialtyUpd(${specialty.specialty_id } );" class="btn btn-success btn-sm" ><i class="fa fa-pencil"></i> 编辑 </a>
	                                            <a href="javascript:specialtyDel(${specialty.specialty_id  });" pk-id="-999" user-status="1" class="btn btn-danger btn-sm user-status-btn"><i class="fa fa-remove"></i> 删除 </a>
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
            
            function choseFirstCityHandler(id){
                
            	$.ajax({
            		url:'shop/registGroup/queryScondeCity',
            		data:{id:id},
            		success:function(res){
            			console.log("res",res);
            			let list = res.list;
            			let $specialty_localRegion = $("#specialty_localRegion");
            			let result = "<option>===请选择地区===</option>";
            			  for(var i = 0;i < list.length;i++){
            				 
            				 result = result + "<option value='"+list[i].region_id +
            					 "' >" + list[i].region_name
            				 "</option>";
            			}  
            			 $specialty_localRegion.html(result);
            			
            			
            		}
            	})
            }
        </script>


    </body>
</html>