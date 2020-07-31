
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
<title>主页</title>
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
      	   width:1100px;
      	   
      	}
      	#screen{
      		
      		margin-top:10px;
      		margin-bottom: 30px;
      	}
      	#tv{
        		width:1305px;
        		height:450px;
        		overflow: hidden;
        	}
        #menu_main{
            margin-left:100px;
        }
      #a-menu{
      	padding:12px 30px
      }
      #li-menu:HOVER  a{
       color: #fff;
       background-color: #458B00;
}

      #search_button{
      	background-color: #458B00;
      }

      

      
	
}
        </style>
<script src="js/vendor/modernizr-2.8.3.min.js"></script>

<script type="text/javascript">

function loginOut() {
	if(window.confirm("确定要退出吗？")){
		window.location.href="bf/loginOut";
	}
	
}

		var imgs=document.getElementsByClassName("imgs");
		var m=0;
		
		
		setInterval(lbu,1000)
		function lbu(){
		for(var i=0;i<imgs.length;i++){
		imgs[i].style.display="none";
		}
		imgs[m].style.display="block";
		m++;
		if(m>imgs.length-1){
		m=0;
		}
		}

//自动轮播代码

	


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
				<!-- <div class="welcome">
					<span class="phone">网站联系人电话: 17843102015</span> <span class="hidden-sm">/</span>
					<span class="email hidden-sm">联系邮箱:7464pqq@163.com</span>
				</div> -->
			</div>
			<div class="col-lg-6 col-md-6 col-sm-8">
				<div class="top-menu">
					
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
<div class="sticky-wrapper" >
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
					<form action="before/specialtyListByLocal" method = "post">
					<div style="margin-top:40px"class="col-lg-6 col-md-5 col-sm-5 col-xs-8 hidden-xs" >
						<div class="header-search">
							<select name="specialty_type">
								<option value="0">所有类型</option>
								<option value="1">粮食、食材</option>
								<option value="2">珍贵药材</option>
								<option value="3">特色美食</option>
								<option value="4">珍贵皮草</option>
								
							</select>
							<input type="text" placeholder="搜索特色产品" name= "specialty_name" />
							<button><i class="fa fa-search"></i></button>
						</div>
					</div>
					</form>
					<!-- <div style="margin-top:40px" class="col-lg-3 col-md-4 col-sm-4 col-xs-12 float-right account-wrap">
						Header shopping cart
						<div class="my-account-holder float-right">                
							<div class="total-cart my-account-title" data-toggle="my-cart">
								<div class="user-icon float-left">
									<i class="fa fa-shopping-cart" aria-hidden="true"></i>
								</div>
								<div class="float-left cart-link">
									<a href="#">2 Item(s)</a>
								</div>
								<div class="clearfix"></div>  
								<ul>
									<li>
										<div class="cart-img">
											<a href="#"><img src="img/cart/total-cart.jpg" alt="" /></a>											    
										</div>
										<div class="cart-info">
											<h4><a href="#">Vestibulum suscipit</a></h4>
											<span>£165.00 <span>x 1</span></span>
										</div>
										<div class="del-icon">
											<i class="fa fa-times-circle"></i>
										</div>
									</li>
									<li>
										<div class="cart-img">
											<a href="#"><img src="img/cart/total-cart.jpg" alt="" /></a>											    
										</div>
										<div class="cart-info">
											<h4><a href="#">Vestibulum suscipit</a></h4>
											<span>£165.00 <span>x 1</span></span>
										</div>
										<div class="del-icon">
											<i class="fa fa-times-circle"></i>
										</div>
									</li>
									<li>
										<div class="subtotal-text">Subtotal: </div>
										<div class="subtotal-price">£300.00</div>
									</li>
									 <li>
										<a href="#" class="button float-right">Checkout</a>										    
									</li>
								</ul>                   
							</div>
						</div> -->
						<!-- Header shopping cart -->
						<!-- <div class="my-account-holder float-right">                
							<div class="my-account-title">
								<div class="user-icon float-left">
									<i class="fa fa-heart" aria-hidden="true"></i>
								</div>                                   
								<div class="clearfix"></div>                     
							</div>
						</div>
						 <div class="my-account-holder float-right">                
							<div class="my-account-title">
								<div class="user-icon float-left">
									<i class="fa fa-exchange" aria-hidden="true"></i>
								</div>                                   
								<div class="clearfix"></div>                     
							</div>
						</div> -->
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
<!-- HOME SLIDER -->
<div class="container">
			<div id="tv">
    		<div id="screen">
    		    <c:forEach items="${specialtyList }" var="specialty">
    			<img src="upload/${ specialty.specialty_img}" class="imgs"  >
    			</c:forEach>

    		</div>
    	</div>
</div>
<!-- END HOME SLIDER -->





 

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
<script type="text/javascript" src="lib/rs-plugin/js/jquery.themepunch.tools.min.js"></script>
<script type="text/javascript" src="lib/rs-plugin/js/jquery.themepunch.revolution.min.js"></script>
<script src="before/lib/rs-plugin/rs.home.js"></script>
<!-- meanmenu js -->
<script src="before/js/jquery.meanmenu.js"></script>
<!-- wow js -->
<script src="before/js/wow.min.js"></script>
<!-- plugins js -->
<script src="before/js/plugins.js"></script>
<!-- main js -->
<script src="before/js/main.js"></script>

</body>
<!-- Mirrored from themepure.net/tf/tp-shop-preview/tp-shop/index.html by HTTrack Website Copier/3.x [XR&CO'2010], Wed, 13 Apr 2016 11:24:56 GMT -->
</html>