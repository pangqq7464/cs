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

        <title>特产信息编辑</title>

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
                                <h5>系统特产信息管理 <small>修改特产资料信息</small></h5>
                            </div>
                            <!-- 定义内容 -->
                            <div class="ibox-content">
                                <form action="back/specialtyUpdDo" method="post"  class="form-horizontal">
                                	<input type="hidden" name="specialty_id" id="specialty_id" value ="${specialty.specialty_id }">
                                	<div class="form-group" >
                                        <div class="layui-input-inline">
							                <img height="50px" width="50px"alt="" src="upload/${ specialty.specialty_img}">
							            </div>
                                        <div class="col-sm-6">
                                            <span style="color:red"class="help-block m-b-none text-success"></span>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">特产名称</label>
                                        <div class="col-sm-4">
                                            <input type="text"  name="specialty_name" id="specialty_name" value="${specialty.specialty_name }" required="required" class="form-control" autofocus required="required">

                                        </div>
                                        <div class="col-sm-6">
                                            <span style="color:red"class="help-block m-b-none text-success"></span>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">特产类型</label>
                                        <div class="col-sm-4">
											<select name="specialty_type" id="specialty_type">
												<option value="${specialty.specialty_type}">${specialty.type.type_name }</option>
												<c:forEach items="${typeList}" var="type">
												 <option value="${type.type_id}" class="first_chose">${type.type_name }</option>
												 </c:forEach>
											</select>
                                        </div>
                                        <div class="col-sm-6">
                                            <span style="color:red"class="help-block m-b-none text-success"></span>
                                        </div>
                                    </div>
                                     <div class="form-group">
                                        <label class="col-sm-2 control-label">特产归属地区</label>
                                        <div class="col-sm-4">
                                         <select  name="specialty_localCity" id="specialty_localCity"onchange="choseFirstCityHandler(this.value)">
											   	 <option value="${specialty.city.city_id}" selected>${specialty.city.city_name}</option>
												 <c:forEach items="${list}" var="city">
												 <option value="${city.city_id}" class="first_chose">${city.city_name }</option>
												 </c:forEach>
										    </select>
											<select name="specialty_localRegion" id="specialty_localRegion">
												<option value = "${specialty.region.region_id }">${specialty.region.region_name }</option>
											</select>

                                        </div>
                                        <div class="col-sm-6">
                                            <span style="color:red"class="help-block m-b-none text-success"></span>
                                        </div>
                                    </div>
                                	
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">特产简介</label>
                                        <div class="col-sm-4">
                                            <textarea row="100" col="60" name="specialty_des" id="specialty_des" value = "${specialty.specialty_des }"class="form-control">${specialty.specialty_des }</textarea>

                                        </div>
                                        <div class="col-sm-6">
                                            <span style="color:red"class="help-block m-b-none text-success"></span>
                                        </div>
                                    </div>	
                                           
										 
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