<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.jstl.com" prefix="c" %>
<%@ taglib uri="http://www.jstl.com/fmt" prefix="fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Tam - Creative Portfolio Template</title>
	
	<meta name="description" content="Tam - Creative Portfolio Template" />
	<meta name="keywords" content="blog, business card, creative, creative portfolio, cv theme, online resume, personal, portfolio, professional cv, responsive portfolio, resume, resume theme, vcard" />
	<meta name="author" content="beingeorge" />
	<meta name="theme-color" content="#2a2d35">

	<!-- Vendor Css-->
	<link rel="stylesheet" type="text/css" href="../../themes/default/easyui.css">
	<link rel="stylesheet" type="text/css" href="../../themes/icon.css">
	<link rel="stylesheet" type="text/css" href="../demo.css">
	<script type="text/javascript" src="../../jquery.min.js"></script>
	<script type="text/javascript" src="../../jquery.easyui.min.js"></script>
	<link rel="stylesheet" href="assets/css/vendor.css" />
	<link rel="stylesheet" href="assets/css/LineIcons.min.css" />	

	<!-- TamTemplate style Css -->
	<link href="assets/css/tam.css" rel="stylesheet">

	<!-- Custom style Css -->
	<link href="assets/css/custom.css" rel="stylesheet">
</head>

<body data-spy="scroll" data-target=".navbar">

	<!-- START: Preloader -->
	<div id="preloader" class="preloader">
		<div class="spinner-grow text-dark" role="status">
			<span class="sr-only">Loading...</span>
		</div>
	</div>
	<!-- END: Preloader -->


	<!-- START: Aside -->
	<aside class="aside">
		<!-- START: NAVBAR -->

		<div class="nav-wrapper">

			<div class="navbar-toggler">
				<svg class="ham hamRotate ham1" viewBox="0 0 100 100" width="60">
				  <path class="line top" d="m 30,33 h 40 c 0,0 9.044436,-0.654587 9.044436,-8.508902 0,-7.854315 -8.024349,-11.958003 -14.89975,-10.85914 -6.875401,1.098863 -13.637059,4.171617 -13.637059,16.368042 v 40" />
				  <path class="line middle" d="m 30,50 h 40" />
				  <path class="line bottom" d="m 30,67 h 40 c 12.796276,0 15.357889,-11.717785 15.357889,-26.851538 0,-15.133752 -4.786586,-27.274118 -16.667516,-27.274118 -11.88093,0 -18.499247,6.994427 -18.435284,17.125656 l 0.252538,40" />
				</svg>
			</div>

			<nav class="navbar text-center align-items-center justify-content-center">


 
               
                <div class="collapse navbar-collapse show" id="navbarCollapse">
                	<div class="about-avatar mb-5">
                		<a href="index.html">
							<img src="assets/images/about.jpg" alt="" class="img-fluid mx-auto d-block shadow-sm rounded-full">
						</a>

						<div class="about-avatar-details mt-4">
							<h1>第一新闻网</h1>
							<p class="badge">NEWS TODAY</p>
						</div>

					</div>
                    <ul class="navbar-nav mx-auto">
                        <li class="nav-item">
                            <a class="nav-link" href="${pageContext.request.contextPath}/home.jsp"><i class="lni-home"></i>首页</a>
                        </li>
                        <li class="nav-item active">
                            <a class="nav-link" href="${pageContext.request.contextPath}/index.action"><i class="lni-pencil"></i></i>新闻</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="${pageContext.request.contextPath}/contact.jsp"><i class="lni-phone-handset"></i>联系我们</a>
                        </li>
                    </ul>
                </div>

               	<div class="aside-footer">
                	<ul class="list-unstyled list-inline">
                        <li class="list-inline-item"><a href="#"><i class="lni-facebook-filled"></i></a></li>
                        <li class="list-inline-item"><a href="#"><i class="lni-skype"></i></i></a></li>
                        <li class="list-inline-item"><a href="#"><i class="lni-youtube"></i></a></li>
                        <li class="list-inline-item"><a href="#"><i class="lni-linkedin-original"></i></a></li>
                    </ul>
                </div>
	        </nav>
        </div>
        <!-- END: NAVBAR -->
    </aside>
    <!-- START: Aside -->

    <div class="page-overlay">
    	<span class="overlay-1"></span>
    	<span class="overlay-2"></span>
    </div>

    <div class="page-wrapper">

    	<!-- START: BLOG -->
    	<section class="section section-light">
    		<div class="container">
				<div class="section-head">
					<span>NEWS</span>
					<h2>新闻浏览</h2>
				</div>

			
				<h1>${news.title }</h1>
	<p>内容概述:${news.contentTitle }<p>
	<p>出版公司:${news.categoryId } &nbsp;&nbsp;出版时间:<fmt:formatDate value="${news.publishTime }" pattern="yyyy-MM-dd HH:mm:ss"/></p>
	<p>作者:${news.author } &nbsp;&nbsp;点击数:	${news.clicks }</p>
	<div style="margin:20px 0;"></div>
	
	<p class="easyui-textbox" data-options="multiline:true" value="" style="width:300px;height:100px">
	${news.content }
	</p>
	
	
	<a href="#" onClick="javascript :history.back(-1);">返回</a>
	
	
</body>







    	<!-- END: BLOG -->

		<!--START: FOOTER-->
		<footer class="footer section section-dark">
			<div class="container">
				<p class="copyright text-center mb-0">&copy; pyconda@foxmail.com | All Right Reserved <a href="https://github.com/pyconda" target="_blank">pyconda</a></p>
			</div>
		</footer>
		<!--END: FOOTER-->
	</div>


	<!-- JAVASCRIPTS -->

	


	<script src="assets/js/vendor.js"></script>

	<!-- Map -->
	<script src="assets/js/map.js"></script>
	<script src="https://ditu.google.cn/maps/api/js?key=AIzaSyD79MY72taVRlZVX2DU6L5PXOh3ezUUKMc&amp;callback=initMap" async="" defer=""></script>
	
	<script src="assets/js/imagesloaded.pkgd.js"></script>
	<script src="assets/js/jquery.shuffle.min.js"></script>
	<script src="assets/js/custom-shuffle-init.js"></script>
	
	<!-- Custom Js -->
	<script src="assets/js/custom.js"></script>

</body>
</html>
