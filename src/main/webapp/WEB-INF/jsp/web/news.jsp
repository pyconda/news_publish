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

			
				
				
		
					


				<div class="row">
						<c:if test="${!empty pb1.list}">
						<c:forEach items="${pb1.list }" var="news">
					<div class="col-md-6">
						<a href="${pageContext.request.contextPath}/findFronNewsByNewsId.action?newsId=${news.newsId }" class="blog-list d-block mb-5">
							<div class="blog-list--img">
								<img src="assets/images/blog-1.jpg"  alt="Blog Image" class="img-fluid">
								<div class="blog-list--details d-flex justify-content-center align-items-center">
									<div class="blog-list--details-in">
										<p class="blog-date text-white"><fmt:formatDate value="${news.publishTime }" pattern="yyyy-MM-dd HH:mm:ss"/></p>
										<span class="blog-cat">${news.categoryName }</span>
									</div>
								</div>
							</div>
							<div class="blog-list--desc mt-4">
								<h3>${news.title }</h3>
								<p>${news.content }</p>
							</div>
						</a>	
					</div>
					
					
					
					</c:forEach>
					</c:if>
					
					
					
					
						<c:if test="${empty pb1.list }">
					<div>
						<tr>
						<td colspan="5" align="center">
						暂无新闻
						</td>
						</tr>
					</div>
					</c:if>
					
					<!--
					<div class="col-md-6">
						<a href="#" class="blog-list d-block mb-5">
							<div class="blog-list--img">
								<img src="assets/images/blog-2.jpg" alt="Blog Image" class="img-fluid">
								<div class="blog-list--details d-flex justify-content-center align-items-center">
									<div class="blog-list--details-in">
										<p class="blog-date text-white">02 Jan, 2020</p>
										<span class="blog-cat">Design</span>
									</div>
								</div>
							</div>
							<div class="blog-list--desc mt-4">
								<h3>10 tips for drawing with coloured pencils</h3>
								<p>Fusce eget urna ante. Donec massa velit, varius a accumsan ac, tempor iaculis massa. Sed placerat justo sed libero varius vulputate. Ut a mi tempus massa malesuada fermentum.</p>
							</div>
						</a>	
					</div>
					<div class="col-md-6">
						<a href="#" class="blog-list d-block mb-5">
							<div class="blog-list--img">
								<img src="assets/images/blog-3.jpg" alt="Blog Image" class="img-fluid">
								<div class="blog-list--details d-flex justify-content-center align-items-center">
									<div class="blog-list--details-in">
										<p class="blog-date text-white">02 Jan, 2020</p>
										<span class="blog-cat">Design</span>
									</div>
								</div>
							</div>
							<div class="blog-list--desc mt-4">
								<h3>10 tips for drawing with coloured pencils</h3>
								<p>Fusce eget urna ante. Donec massa velit, varius a accumsan ac, tempor iaculis massa. Sed placerat justo sed libero varius vulputate. Ut a mi tempus massa malesuada fermentum.</p>
							</div>
						</a>	
					</div>
					<div class="col-md-6">
						<a href="#" class="blog-list d-block mb-5">
							<div class="blog-list--img">
								<img src="assets/images/p4-4.jpg" alt="Blog Image" class="img-fluid">
								<div class="blog-list--details d-flex justify-content-center align-items-center">
									<div class="blog-list--details-in">
										<p class="blog-date text-white">02 Jan, 2020</p>
										<span class="blog-cat">Design</span>
									</div>
								</div>
							</div>
							<div class="blog-list--desc mt-4">
								<h3>10 tips for drawing with coloured pencils</h3>
								<p>Fusce eget urna ante. Donec massa velit, varius a accumsan ac, tempor iaculis massa. Sed placerat justo sed libero varius vulputate. Ut a mi tempus massa malesuada fermentum.</p>
							</div>
						</a>	
					</div>
					<div class="col-md-6">
						<a href="#" class="blog-list d-block mb-5">
							<div class="blog-list--img">
								<img src="assets/images/p5-5.jpg" alt="Blog Image" class="img-fluid">
								<div class="blog-list--details d-flex justify-content-center align-items-center">
									<div class="blog-list--details-in">
										<p class="blog-date text-white">02 Jan, 2020</p>
										<span class="blog-cat">Design</span>
									</div>
								</div>
							</div>
							<div class="blog-list--desc mt-4">
								<h3>10 tips for drawing with coloured pencils</h3>
								<p>Fusce eget urna ante. Donec massa velit, varius a accumsan ac, tempor iaculis massa. Sed placerat justo sed libero varius vulputate. Ut a mi tempus massa malesuada fermentum.</p>
							</div>
						</a>	
					</div>
					<div class="col-md-6">
						<a href="#" class="blog-list d-block mb-5">
							<div class="blog-list--img">
								<img src="assets/images/p6-6.jpg" alt="Blog Image" class="img-fluid">
								<div class="blog-list--details d-flex justify-content-center align-items-center">
									<div class="blog-list--details-in">
										<p class="blog-date text-white">02 Jan, 2020</p>
										<span class="blog-cat">Design</span>
									</div>
								</div>
							</div>
							<div class="blog-list--desc mt-4">
								<h3>10 tips for drawing with coloured pencils</h3>
								<p>Fusce eget urna ante. Donec massa velit, varius a accumsan ac, tempor iaculis massa. Sed placerat justo sed libero varius vulputate. Ut a mi tempus massa malesuada fermentum.</p>
							</div>
						</a>	
					</div>
			
				  -->
				  	</div>
				  	
				  	<tr>
					<td colspan="9" align="center">
					<div class="pagination">
						第${pb1.currentPage }页
						&nbsp;&nbsp;共${pb1.totalPage }页
						&nbsp;&nbsp;共${pb1.count }条新闻
						<div style="height:10px;"></div>
						<c:if test="${pb1.currentPage==1 }">首页&nbsp;&nbsp;上一页</c:if>
							<c:if test="${pb1.currentPage>1 }">
								<a href="#" onclick="fy(1)">首页</a>
								<a href="#" onclick="fy(${pb1.currentPage-1})">上一页</a>
							</c:if>
							<c:if test="${pb1.currentPage<pb1.totalPage }">
								<a href="#" onclick="fy(${pb1.currentPage+1})">下一页</a>
								<a href="#" onclick="fy(${pb1.totalPage})">尾页</a>
							</c:if>
							<c:if test="${pb1.currentPage==pb1.totalPage }">
							下一页&nbsp;&nbsp;尾页</c:if>&nbsp;&nbsp;
							跳转至
			<input type="text" style="height:22px;width:30px;" value="${gotoPageNo }" name="gotoPageNo" id="gotoPageNo">页
							<a href="#" onclick="validate()">跳转</a>
					</div>
					</td>
					</tr>
				  	
			    				
			</div>
    	</section>
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

	
	<script type="text/javascript">
		//翻页
		function fy(gotoPageNo)
		{
		
	
			var form = document.getElementById("ff");
			form.action=
				"${pageContext.request.contextPath}/findNewsByPage.action?currentPage="+gotoPageNo;
				form.submit();
				
		}
		//跳转验证
		function validate(){

			var totalPage=${pb.totalPage};
			var gotoPageNo=document.getElementById("gotoPageNo").value;
			if(gotoPageNo>totalPage || gotoPageNo<=0){
				alert("输入页码有错");
			}else{
				fy(gotoPageNo);
				return true;
			}
			fy(gotoPageNo);
			return true;
		}
		
		
	</script>


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
