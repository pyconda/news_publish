<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Tam - Creative Portfolio Template</title>
	<meta name="description" content="Tam - Creative Portfolio Template" />
	<meta name="keywords" content="blog, business card, creative, creative portfolio, cv theme, online resume, personal, portfolio, professional cv, responsive portfolio, resume, resume theme, vcard" />
	<meta name="author" content="beingeorge" />
	<meta name="theme-color" content="#2a2d35">

	<!-- Vendor Css-->
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
                        <li class="nav-item active">
                            <a class="nav-link" href="${pageContext.request.contextPath}/home.jsp"><i class="lni-home"></i>首页</a>
                        </li>
                        <li class="nav-item ">
                            <a class="nav-link" href="${pageContext.request.contextPath}/index.action"><i class="lni-pencil"></i></i>新闻</a>
                        </li>
                        <li class="nav-item ">
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

		<!-- START: HOME -->		
    	<section class="section-home " id="home">
    		<div class="glass">第一新闻</div>
    		<!-- <img src="assets/images/banner.jpg" /> -->
    	</section>	
    	<!-- END: HOME -->

		<!-- START: ABOUT -->
		<section class="section section-about" id="about">
			<div class="container">
				<div class="section-head">
					<span>Get to know</span>
					<h2>版本更新列表</h2>
				</div>

				<div class="row justify-content-center align-items-center">
					<div class="col-md-6">
						<img class="about-img img-fluid wow fadeInUp" data-wow-duration="1s" src="assets/images/avatar.jpg" alt="About Picture">
					</div>
					<div class="col-md-6">
						<div class="about-desc wow fadeInUp" data-wow-duration="1s"  data-wow-delay="500ms">
							<div class="about-desc-content">
								<h1 class="font-weight-light mb-5">当前版本V1.0</h1>
								<p class="font-weight-light my-3">v1.0 登录验证码增删改查基本功能</p>
								<p class="font-weight-light my-3">v1.1 加入前端+md5</p>
								<p class="font-weight-light my-3">v1.2 导入 thymeleaf，semintic UI替换jsp</p>
								<p class="font-weight-light my-3">v1.3 redis评论做留言</p>
								<p class="font-weight-light my-3">v1.4 使用restful（swagger2)</p>
								<p class="font-weight-light my-3">v1.5 改成markdown</p>
								<p class="font-weight-light my-3">v1.6 整合成springBoot</p>
							</div>

					
						</div>
					</div>

				</div>
			</div>


		</section>
		<!-- END: ABOUT -->

		<!-- START: SERVICES -->
		<section class="section section-dark section-services" id="services">
			<div class="container">
				<div class="section-head">
					<span>WHAT I DO</span>
					<h2>My Services</h2>
				</div>

				<div class="row mt-4">
					<div class="col-sm-6 col-lg-6">
						<div class="services-list b-box hover-state p-4 mt-4 wow fadeInUp" data-wow-duration="1.5s">
							<div class="services-list-icon">
								<i class="lni-color-pallet"></i>
								<span>01</span>
							</div>
							<div class="mt-4">
								<h5 class="mb-0">Graphic Design</h5>
								<p class=" mt-3">Modern and mobile-ready website that will help of your marketing. Proin laoreet elementum ligula, ac tincidunt lorem accumsan nec.</p>
							</div>
						</div>
					</div>
					<div class="col-sm-6 col-lg-6">
						<div class="services-list b-box hover-state p-4 mt-4 wow fadeInUp" data-wow-duration="1.5s" data-wow-delay=".2s">
							<div class="services-list-icon">
								<i class="lni-laptop-phone"></i>
								<span>02</span>
							</div>
							<div class="mt-4">
								<h5 class="mb-0">Web Development</h5>
								<p class=" mt-3">Modern and mobile-ready website that will help of your marketing. Proin laoreet elementum ligula, ac tincidunt lorem accumsan nec.</p>
							</div>
						</div>
					</div>
				</div>
			
			</div>
		</section>
		<!-- END: SERVICES -->


		<!--START: FOOTER-->
		<footer class="footer section section-light">
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
	
	<!-- Custom Js -->
	<script src="assets/js/custom.js"></script>
</body>
</html>
