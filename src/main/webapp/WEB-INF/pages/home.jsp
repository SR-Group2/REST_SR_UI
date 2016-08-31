<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="org.khmeracademy.rest.entities.User"%>
<%@page
	import="org.springframework.security.core.context.SecurityContextHolder"%>
<%@page import="org.springframework.security.core.Authentication"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html ng-app="app">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>NHAM EY Welcome</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/style.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/screen.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/typeaheadjs.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/scripts/sweetalert/sweetalert.css">
</head>
<body ng-controller="mainCtrl">
	<!-- ======== Navigation ==========  -->
	<nav class="navbar navbar-light bg-faded"
		style="background-color: #ffffff;">
		<div class="container">
			<a href="${pageContext.request.contextPath}/home"> <img
				class="navbar-brand img-fluid logo"
				src="${pageContext.request.contextPath}/resources/images/logo.png"></a>
			<div class="menu">
				<ul class="nav navbar-nav pull-xs-right">
					<sec:authorize access="!isAuthenticated()">
						<li class="nav-item"><a class="nav-link" href="#"
							data-toggle="modal" data-target="#login">ចូលប្រើ</a></li>
					</sec:authorize>
					<sec:authorize access="!isAuthenticated()">
						<li class="nav-item">
							<a class="nav-link" href="${pageContext.request.contextPath}/register">បង្កើតគណនី</a></li>
					</sec:authorize>
					
					<sec:authorize access="isAuthenticated()">
					<li class="nav-item dropdown logined">
						<a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#"
						 style="color:#35ac2a !important;text-transform:uppercase;"
						role="button" aria-haspopup="true" aria-expanded="false">
							<sec:authentication property="principal.username" />
						</a>
						<div class="dropdown-menu" aria-labelledby="Preview">
							<ul class="list-unstyled">
								<li>
									<a class="nav-link" href="${pageContext.request.contextPath}/profile">
									<i class="fa fa-user"></i>&nbsp;&nbsp; គណនី</a>
								</li>
								<li>
									<a class="nav-link" href="${pageContext.request.contextPath}/logout">
									<i class="fa fa-sign-out"></i>&nbsp;&nbsp; ចាកចេញ</a>
								</li>
							</ul>

						</div>
					</li>
					<li class="nav-item">
						<img class="img-circle profileimage" 
						src='http://localhost:9999<sec:authentication property="principal.picture" />'/>
					</li>
					</sec:authorize>
				</ul>
			</div>
		</div>
	</nav>

	<!-- ========= Slide show============== -->
	<section class="slideShow">
		<div class="container">
			<div id="sponsor" class="carousel slide" data-ride="carousel">
				<ol class="carousel-indicators">
					<li data-target="#sponsor" data-slide-to="0" class="active"></li>
					<li data-target="#sponsor" data-slide-to="1"></li>
					<li data-target="#sponsor" data-slide-to="2"></li>
				</ol>
				<div class="carousel-inner" role="listbox">
					<div class="carousel-item active">
						<img
							src="${pageContext.request.contextPath}/resources/images/sponsors/sponsor_01.jpg"
							alt="First slide" class="img-fluid img-rounded">
					</div>
					<div class="carousel-item">
						<img
							src="${pageContext.request.contextPath}/resources/images/sponsors/sponsor_01.jpg"
							alt="Second slide" class="img-fluid img-rounded">
					</div>
					<div class="carousel-item">
						<img
							src="${pageContext.request.contextPath}/resources/images/sponsors/sponsor_01.jpg"
							alt="Third slide" class="img-fluid img-rounded">
					</div>
				</div>
				<a class="left carousel-control" href="#sponsor" role="button"
					data-slide="prev"> <span class="icon-prev" aria-hidden="true"></span>
					<span class="sr-only">Previous</span>
				</a> <a class="right carousel-control" href="#sponsor" role="button"
					data-slide="next"> <span class="icon-next" aria-hidden="true"></span>
					<span class="sr-only">Next</span>
				</a>
			</div>
		</div>
	</section>
	
	<!--  =========== Search Section ====================== -->

	<section class="homepage">
		<div class="container search">
			<div class="text-md-center row">
				<div class="offset-md-2 col-md-8">
					<form class="">
						<div class="form-group">
							<div class="input-group" id="remote">
								<input type="text" class="form-control typeahead" id="keyword"
									placeholder="search restaurant .....">
								<div class="input-group-addon" id="btnsearch">
									<button type="submit" class="">
										<i class="fa fa-search"></i>
									</button>
								</div>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</section>
	<!-- ======== Category Content ========= -->
	<section class="category">
		<div id="loader">
			<div id="loader-container" class="">
				<img src="${pageContext.request.contextPath}/resources/images/loading1.gif">
			</div>
		</div>
		
		<div class="container">
			<!-- <div class="card">
				<div class="card-header bg-success">Popular Category</div>
				<div class="card-block"> -->
					<div class="row" id="getRest"></div>
					<!-- end row 2 -->
			<!-- 	</div>
			</div> -->
		</div>
		<!-- end container -->
	</section>
	<!--  end Category -->

	<!-- ========= Pagination ============ -->
	<section class="cotainer text-xs-center">
		<!-- <nav id="pagination" class="pagination"></nav> -->
	</section>

	<!-- ========= footer ============ -->
	<footer class="footer">
		<div class="container">
			<p class="pull-left">Copy Right 2016. All right reserved.</p>
			<ul class="nav nav-pills pull-right">
				<li class="nav-item"><a class="nav-link" href="#">ទំនាក់ទំនង់</a>
				</li>
				<li class="nav-item"><a class="nav-link" href="#">អំពីយើង</a>
				</li>
			</ul>
		</div>
	</footer>

	<!--  ========  Model LOgin ====== -->
		<jsp:include page="modal_login.jsp"></jsp:include>
	<!--  ========  Model LOgin ====== -->

	

	<!-- ========= footer ============ -->
	<script
		src="${pageContext.request.contextPath}/resources/scripts/jquery-2.1.4.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/scripts/bootstrap.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/scripts/jquery.tmpl.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/scripts/jquery.bpopup.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/scripts/jquery.bootpag.min.js"></script>

	<script
		src="${pageContext.request.contextPath}/resources/scripts/typeahead.bundle.min.js"></script>
		
		<script src="${pageContext.request.contextPath}/resources/scripts/sweetalert/sweetalert.min.js"></script> 

	<script id="rest_tmpl" type="text/x-jquery-tmpl">
		<div class="col-lg-3 col-md-4 col-xs-12 col-sm-6 text-xs-right">
			<div class="box-img" onclick="detailRest({{= restype_id }})">
				<h2 class="text-xs-left">{{= restype_name_kh }}</h2>
				<h4 class="text-capitalize text-xs-left">{{= restype_name }}</h4>
				<a href="#"><img class="" alt="" src="/resources/images/restype/{{= restype_picture}}" width="200" height="150"></a>
			</div>
		</div>
	</script>

	<!-- ================ JS Application ==================== -->
	<script src="${pageContext.request.contextPath}/resources/scripts/home/home.js" ></script>
	<script src="${pageContext.request.contextPath}/resources/scripts/home/login.js" ></script>

</body>
</html>