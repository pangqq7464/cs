
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
	pageContext.setAttribute("path", path);
	pageContext.setAttribute("basePath", basePath);
%>
<!DOCTYPE HTML>
<html class="no-js" lang="en">
	<head>
		<base href="${basePath}">
		<meta charset="utf-8">
		<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>Home</title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- Place favicon.ico in the root directory -->
<link rel="shortcut icon" type="image/x-icon" href="img/favicon.ico">
<!-- google fonts -->
<link href='https://fonts.googleapis.com/css?family=Lato:400,900,700,300' rel='stylesheet'
	type='text/css'>
<!-- all css here -->
<!-- bootstrap v3.3.6 css -->
<link rel="stylesheet" href="before/css/bootstrap.min.css">
<!-- animate css -->
<link rel="stylesheet" href="before/css/animate.css">
<!-- jquery-ui.min css -->
<link rel="stylesheet" href="before/css/jquery-ui.min.css">
<!-- meanmenu css -->
<link rel="stylesheet" href="before/css/meanmenu.min.css">
<!-- RS slider css -->
<link rel="stylesheet" type="text/css" href="before/lib/rs-plugin/css/settings.css" media="screen" />
<!-- owl.carousel css -->
<link rel="stylesheet" href="before/css/owl.carousel.css">
<!-- font-awesome css -->
<link rel="stylesheet" href="before/css/font-awesome.min.css">
<!-- style css -->
<link rel="stylesheet" href="before/css/style.css">
<!-- responsive css -->
<link rel="stylesheet" href="before/css/responsive.css">
<!-- modernizr css -->
 <style type="text/css">
      	#screen img{
      	   float:left;
      	   width:1300px;
      	   
      	}
      	#screen{
      		margin-left: 200px;
      		margin-top:10px;
      	}
      	#tv{
        		width:1305px;
        		height:450px;
        		overflow: hidden;
        	}
        
      #a-menu{
      	padding:12px 35px
      }
      #li-menu:HOVER  a{
       color: #fff;
       background-color: #458B00;
      
      }
      #li-menu a{
      	font-size: 17px;
      	font-weight: lighter;
      	font-family: 微软雅黑;
      }
     .specialtyList{
        margin-top:10px;
        margin-left:0px;
     }
     #specialty-img{
         float:left
     }
     #specialty-message{
        width:600px;
        height:400px;
        padding:0;
        
     }
     .single-title{
     	
     	font-size: 30px;
     	font-family: 微软雅黑;
     	font-weight: bolder;
     }
   .action a{
   	  float:right;
   	  margin-left:
   	   10px;color:#C1C1C1
   }
   
    
      .butt-sub{
      
		border: none;
		background-color: #458B00;
		outline: none;  
		color:white;
		float: right; 
		margin-right: 5px;
      }
	

        </style>
<script src="js/vendor/modernizr-2.8.3.min.js"></script>

<script type="text/javascript">

		function loginOut() {
			if(window.confirm("确定要退出吗？")){
				window.location.href="bf/loginOut";
			}
			
		}

		
	


</script>
</head>
<body>

<!--[if lt IE 8]>
		<p class="browserupgrade">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade your browser</a> to improve your experience.</p>
	<![endif]-->
<!-- Add your site or application content here -->
<!-- header-top-area start -->
<div class="header-top-area hidden-xs" style="background:#458B00 ; color:#FFF">
	<div class="container">
		<div class="row">
			<div class="col-lg-6 col-md-6 col-sm-4">
				<div class="welcome">
					<span class="phone">Phone: +12345 67890</span> <span class="hidden-sm">/</span>
					<span class="email hidden-sm">Email: yourname@domain.com</span>
				</div>
			</div>
			<div class="col-lg-6 col-md-6 col-sm-8">
				<div class="top-menu">
					<!-- <ul id="currency">
						<li><a href="#">用户论坛 <i class="fa fa-angle-down"></i></a>
							<ul>
								<li><a href="#">美妆帖</a></li>
								<li><a href="#">护肤帖</a></li>
								<li><a href="#">彩妆贴</a></li>
							</ul>
						</li>
					</ul> -->
					<ul>
						<li><c:if test="${3 eq sessionScope.user.role_id}" ><a href="shop/registGroup">门店注册</a></c:if></li>
					</ul>
					<ul>
						<li><c:if test="${3 eq sessionScope.user.role_id}" ><a href="back/loginH">后台门店管理</a></c:if></li>
					</ul>
					<ul>
						<li><c:if test="${1 eq sessionScope.user.role_id}" ><a href="back/loginH">后台管理</a></c:if></li>
					</ul>
					<ul>
						<li>
							<c:if test="${empty sessionScope.user }"><a href="back/login">登录</a>
							</c:if>
							<c:if test="${!(empty sessionScope.user) }">欢迎  | ${sessionScope.user.user_name } | 
								<a href="javascript:void(0)" onclick="loginOut()">退出 </a>
							</c:if >	
						</li>
					</ul>
					
				</div>
			</div>
		</div>
	</div>
</div>
<!-- header-top-area end -->
<div class="sticky-wrapper">
	<header>			
		<!-- header-bottom-area start -->            
		<div class="header-bottom-area">
			<div class="container">
				<div class="row">
					<div class="col-lg-3 col-md-3 col-sm-3 col-xs-12" width="227" height="70">
						<div class="logo">
							<img src="before/img/logo/logo-jl.jpg" width="300" height="50"alt="" />
						</div>
					</div>
					<form aciton="before/specialtyListByLocal" method = "post">
					<div style="margin-top:60px"class="col-lg-6 col-md-5 col-sm-5 col-xs-8 hidden-xs" >
						<div class="header-search">
							<select name="specilaty_type">
								<option value="0">所有类型</option>
								<option value="1">粮食、食材</option>
								<option value="2">珍贵药材</option>
								<option value="3">特色美食</option>
								<option value="4">珍贵皮草</option>
								
							</select>
							<input type="text" placeholder="搜索特色产品" name= "specialty_name" />
							<button id="search_button"><i class="fa fa-search"></i></button>
						</div>
					</div>
					</form>
			
					</div>
				</div>
			</div>
		</div>
		<!-- header-bottom-area end -->
		<!-- main-menu-area start -->
		<div class="main-menu-area hidden-xs">
			<div class="container">
				<div  >
					<div class="col-lg-12 col-md-12 col-sm-12" id="menu_main">
						<div class="main-menu">
						
							<nav>
							    
								<ul >
								    <li value="0"  id="li-menu"><a id = "a-menu"href="before/specialtyListByLocal?specialty_localCity=0">全部</a></li>
								    <c:forEach items="${cityList }" var="city">
									<li value="${city.city_id }"  id="li-menu"><a id = "a-menu"href="before/specialtyListByLocal?specialty_localCity=${city.city_id}">${city.city_name }</a></li>
									</c:forEach>	
								</ul>
							
								
							</nav>
							
						</div>
						
					</div>
				</div>
				
			</div>
		</div>            
		<!-- main-menu-area end -->
		
	</header>
</div>
  <!-- 导航栏结束 --> 
<!-- 特产详情导航开始 -->

<!-- heading-banner start -->
<div class="heading-banner">
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<ul class="breadcrumb">
					<li><a href="goods/selGoodsByShop?goods_shop=${shop.shop_id } ">查看店铺所有商品</a></li>
					
				</ul>
			</div>
		</div>
	</div>
</div>
<!-- heading-banner end -->
<!-- 特产详情导航结束 -->
<!--店铺详情开始  -->
<div class="container" >
    <div >
		<div >
		    
			<div id="specialty-img">
				<img class="primary-img" src="upload/${shop.shop_img }" style="width: 400px;height: 200px"alt="" />
			</div>
			<div class="product-info" id="specialty-message">
				<div class="specialty-title">
					${shop.shop_name }	
				</div>
				<br>
				<div >
					地点:吉林省-${shop.city.city_name }-${shop.region.region_name }
				</div>
				<div class="specialty-des">
					&nbsp&nbsp${shop.shop_des }
											
				</div>
											
		   </div>
		</div>
	</div>
<!-- 特产详情结束  -->

<!-- 评论 -->

<!-- 评论区  -->


<form action="before/addCommon" method="post">
	<div class="container"  >
    <input type="hidden" name="common_account" value = "${sessionScope.user.user_account}">
    <input type="hidden" name="common_specialty" value = "${specialty.specialty_id }">
    <input type="hidden" name="action" value="1">
    <div style="margin-top: 20px;">
		<div  style="background-color: #008B00;width: 100px;height:40px;text-align: center;color:white;font-weight: bolder;line-height: 40px;font-size: 20px" 
		id="test"  value ="评论"onclick="change('${sessionScope.user.user_name }')">点击评论</div>
        </div>
    <div id="test1" style="border:3px solid #CACACA;padding:25px;	margin-top: 10px;display: none;">	
        
        <div style="width: 1300px;height: 110px" >
        	<div >
	        	<div style="float: left;">
	        		<img style="width:100px;width: 100px;height: 100px"class="primary-img" src="upload/${sessionScope.user.user_image }" alt="" />
	        	</div>
	        	
				<div style="float: left;">
					<p style="color:red;margin-left: 20px">@${sessionScope.user.user_name }&nbsp&nbsp评论:</p>
					<textarea name="common_message" style="margin-bottom: 0;margin-left: 20px"rows="3px" cols="130px"></textarea>
				
			    </div>	
        	</div>
		</div>	
		<button type="submit" class="butt-sub">提交</button>							
	</div>
	
</div>
	
	
 </form>

<!-- 评论区结束 -->

<div class="container" >
   <c:forEach items="${commonList }" var="common">
   <div  style="border:3px solid #CACACA;padding:5px;	margin-top: 10px;">
	   	<div style="width: 1300px;height: 130px">
	   		<div style="float:left;">
	   			<img style="width:100px;width: 100px;height: 100px"class="primary-img" src="upload/${common.user.user_image }" alt="" />
	   		</div>
	   		<div style="float: left;">
				<p style="color:red;margin-left: 20px">@${common.user.user_name}&nbsp&nbsp</p>
				<div style="border:1px solid #CACACA;padding:5px;margin-bottom: 0;margin-left: 20px;width:1000px;height: 70px" >${common.common_message}</div>
			 		<div class="action" style="color:red;margin-left: 20px;margin-top: 5px;color:#C1C1C1">更新于@${common.user.user_name }&nbsp&nbsp评论:
			 			<a href="javascript:delCommon(${common.common_id}) ">删除</a>
			 			<a href="javascript:addRespond(${common.common_id},${specialty.specialty_id },${sessionScope.user.user_account })">回应(${common.common_count})</a>
			 	    </div>
			 </div>
	   	</div>
   </div>
   </c:forEach>
</div>
<!-- 评论结束 -->

<!-- all js here -->
<!-- jquery latest version -->

<script src="before/js/vendor/jquery-1.12.0.min.js"></script>
<!-- bootstrap js -->
<script src="before/js/bootstrap.min.js"></script>
<!-- owl.carousel js -->
<script src="before/js/owl.carousel.min.js"></script>
<!-- jquery-ui js -->
<script src="before/js/jquery-ui.min.js"></script>
<!-- RS-Plugin JS -->

<!-- meanmenu js -->
<script src="before/js/jquery.meanmenu.js"></script>
<!-- wow js -->
<script src="before/js/wow.min.js"></script>
<!-- plugins js -->
<script src="before/js/plugins.js"></script>
<!-- main js -->
<script src="before/js/main.js"></script>
<script type="text/javascript">
       function change(action){
    	   alert(action);
    	   if(action==""){
    		   alert("请登录！");
    		   $('#test1').hide();
    	   }else{
    		   $('#test1').show();
    	   }
       }
	   
      function delCommon(id){
    	  alert(id);
    	  $.ajax({
    		    url:'before/delCommon', 
    		    type:'get',
    		    data: {id:id},
    		    success: function (data) {
    		    	console.log(data);
    		        if (data.result==1) {
    		            alert("删除成功")
    		        } else {
    		            alert("删除失败")
    		        }
    		    }
    		})
      }
      function addRespond(common_id,specialty_id,account){
    	  console.log(common_id);
    	  console.log(specialty_id);
    	  console.log(account);
    	  alert(account);
    	  var test = account;
    	  if(typeof(test)=="undefined"){
    		  alert("请登录！");
    	  }else{
    		  window.location.href = "before/addResponse?common_id="+common_id+"&specialty_id="+specialty_id;
    	  }
      }
</script>

</body>
<!-- Mirrored from themepure.net/tf/tp-shop-preview/tp-shop/index.html by HTTrack Website Copier/3.x [XR&CO'2010], Wed, 13 Apr 2016 11:24:56 GMT -->
</html>