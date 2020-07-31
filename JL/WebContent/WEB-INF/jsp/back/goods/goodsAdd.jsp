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
        
<script type="text/javascript">

	
	function changeProvince(){
		var check = $("#province").val();
		$("#city").empty();
		if(check=="no"){
			$("#city").empty();
		}else{
			$.post("test/changeProvince",{"province":check},function(data){
				$("#city").append("<option value='no'>请选择</option>")
				$.each(data,function(index,city){
					$("#city").append("<option value="+city+">"+city+"</option>");					
				});
			},"json");
		}
	}
</script>
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
                                <h5>系统商户管理 <small>添加商品</small></h5>
                            </div>
                            <!-- 定义内容z -->
                            <div class="ibox-content" >
                                <form action="goods/goodsAddDo" method="post" enctype="multipart/form-data" class="form-horizontal">
                                	<div class="form-group" >
                                        <label class="col-sm-2 control-label">商品图片</label>
                                      
                                        <div class="layui-input-inline">
							                <input style="width: 400px;" type="file" id="photo" name="photo" required="" lay-verify="required"
							                  autocomplete="off" class="form-control">
							            </div>
                                        <div class="col-sm-6">
                                            <span style="color:red"class="help-block m-b-none text-success"></span>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">商品名称</label>
                                        <div class="col-sm-4">
                                            <input type="text"  name="goods_name" id="goods_name" required="" class="form-control" autofocus>
                                        </div>
                                        <div class="col-sm-6">
                                            <span style="color:red"class="help-block m-b-none text-success"></span>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">商品描述</label>
                                        <div class="col-sm-4">
                                            <input type="text"  name="goods_des" id="goods_des" required="" class="form-control" autofocus>
                                        </div>
                                        <div class="col-sm-6">
                                            <span style="color:red"class="help-block m-b-none text-success"></span>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">商品价格</label>
                                        <div class="col-sm-4">
                                            <input type="text"  name="goods_price" id="goods_price" required="" class="form-control" autofocus>
                                        </div>
                                        <div class="col-sm-6">
                                            <span style="color:red"class="help-block m-b-none text-success"></span>
                                        </div>
                                    </div>
                                   <%--  <div class="form-group">
                                        <label class="col-sm-2 control-label">商品门户</label>
                                        <div class="col-sm-4">
                                           <select name="goods_shop" id="goods_shop">
                                                <option value= "null">==请选择商品门店==</option>
												<c:forEach items="${shopList}" var="shop">
												 <option value="${shop.shop_id}" class="first_chose">${shop.shop_name }</option>
												 </c:forEach>
											</select>

                                        </div>
                                        <div class="col-sm-6">
                                            <span style="color:red"class="help-block m-b-none text-success"></span>
                                        </div>
                                    </div> --%>
                                 
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
            			let $shop_localregion = $("#shop_localregion");
            			let result = "<option>===请选择地区===</option>";
            			  for(var i = 0;i < list.length;i++){
            				 
            				 result = result + "<option value='"+list[i].region_id +
            					 "' >" + list[i].region_name
            				 "</option>";
            			}  
            			 $shop_localregion.html(result);
            			
            			
            		}
            	})
            }
        </script>
    </body>
</html>