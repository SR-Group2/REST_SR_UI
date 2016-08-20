<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@page import="org.khmeracademy.rest.entities.User"%>
<%@page import="org.springframework.security.core.context.SecurityContextHolder"%>
<%@page import="org.springframework.security.core.Authentication"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
    
<!DOCTYPE html>
<html lang="en" ng-app="app">
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">

	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	<meta name="description" content="Restaurant Menu Integration" />
	<meta name="author" content="" />

	<title>King Of Restaurant Menu Integegration | Dashboard</title>
	
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/js/jquery-ui/css/no-theme/jquery-ui-1.10.3.custom.min.css">

	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/font-icons/entypo/css/entypo.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/bootstrap.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/neon-core.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/font-icons/font-awesome/css/font-awesome.min.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/scripts/sweetalert/sweetalert.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap-datetimepicker.min.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/css/style.css">
	
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/font-icons/entypo/css/entypo.css">
	<link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Noto+Sans:400,700,400italic">
	
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/neon-theme.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/neon-forms.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/custom.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/typeaheadjs.css">
	
	<script src="${pageContext.request.contextPath}/resources/assets/js/jquery-1.11.0.min.js"></script>
	<script>$.noConflict();</script>
	
</head>
<body >
<div class="page-container">
	<div class="sidebar-menu">
		<div class="sidebar-menu-inner">
			<header class="logo-env">

				<!-- logo -->
				<div class="logo">
					<a href="${pageContext.request.contextPath}/admin">
						<h1 style="color:#fff;font-weight:bold;">NHAM EY</h1>
					</a>
				</div>

				<!-- logo collapse icon -->
				<div class="sidebar-collapse">
					<a href="#" class="sidebar-collapse-icon">
						<i class="entypo-menu"></i>
					</a>
				</div>

				<div class="sidebar-mobile-menu visible-xs">
					<a href="#" class="with-animation">
						<i class="entypo-menu"></i>
					</a>
				</div>

			</header>					
			<ul id="main-menu" class="main-menu">
				<li class="active opened active">
					<a href="${pageContext.request.contextPath}/home" target="_blank">
						<i class="entypo-gauge"></i>
						<span class="title">Home Page</span>
					</a>
				</li>
				<li >
					<a href="${pageContext.request.contextPath}/admin/user" target="_self" >
						<i class="entypo-user"></i>
						<span class="title">Users</span>
					</a>
				
				</li>
				<li>
					<a href="${pageContext.request.contextPath}/admin/category" target="_self">
						<i class="fa fa-book"></i>
						<span class="title">Menu Restaurant</span>
					</a>
				</li>
				<li>
					<a href="${pageContext.request.contextPath}/admin/menu" target="_self">
						<i class="fa fa-list"></i>
						<span class="title">Category Restaurant</span>
					</a>
					
				</li>
				<li>
					<a href="${pageContext.request.contextPath}/admin/restaurant" target="_self">
						<i class="fa fa-cutlery"></i>
						<span class="title">Restaurant</span>
					</a>
					
				</li>
				<li>
					<a href="${pageContext.request.contextPath}/admin/brand" target="_self">
						<i class="fa fa-random"></i>
						<span class="title">Brand Restaurant</span>
					</a>
				</li>
				<li>
					<a href="${pageContext.request.contextPath}/admin/vote" target="_self">
						<i class="fa fa-star"></i>
						<span class="title">Vote</span>
					</a>
				</li>
				<li>
					<a href="${pageContext.request.contextPath}/admin/comment" target="_self">
						<i class="fa fa-comment"></i>
						<span class="title">Comment</span>
					</a>
				</li>
			</ul>
			
		</div>

	</div>
	<div class="main-content">			
		<div class="row">
			<!-- ============  Header Menu ================ -->
			<div class="col-md-6 col-sm-8 clearfix">
		
				<ul class="user-info pull-left pull-none-xsm">
		
					<!-- Profile Info -->
					<li class="profile-info dropdown"><!-- add class "pull-right" if you want to place this from right -->
		
						<a href="#" class="dropdown-toggle" data-toggle="dropdown">
							<img src="${pageContext.request.contextPath}/resources/images/logo.png" alt="" 
							class="img-circle" width="44">
							<sec:authorize access="isAuthenticated()">
								 <sec:authentication property="principal.username" />
								 <p style="display:none" id="user_id"> <sec:authentication property="principal.id" /></p>
							</sec:authorize>
						</a>
		
						<ul class="dropdown-menu">
		
							<!-- Reverse Caret -->
							<li class="caret"></li>
		
							<!-- Profile sub-links -->
							<li>
								<a href="extra-timeline.html">
									<i class="entypo-user"></i>
									Edit Profile
								</a>
							</li>
		
							<li>
								<a href="mailbox.html">
									<i class="entypo-mail"></i>
									Inbox
								</a>
							</li>
		
							<li>
								<a href="extra-calendar.html">
									<i class="entypo-calendar"></i>
									Calendar
								</a>
							</li>
		
							<li>
								<a href="#">
									<i class="entypo-clipboard"></i>
									Tasks
								</a>
							</li>
						</ul>
					</li>
		
				</ul>
				
				
			</div>
			<!--  ============ right column ============= -->
			<div class="col-md-6 col-sm-4 clearfix hidden-xs">
		
				<ul class="list-inline links-list pull-right">
		
					<!-- Language Selector -->
					<li class="dropdown language-selector">
		
						Language: &nbsp;
						<a href="#" class="dropdown-toggle" data-toggle="dropdown" data-close-others="true">
							<img src="${pageContext.request.contextPath}/resources/images/flag-uk.png">
						</a>
		
						<ul class="dropdown-menu pull-right">
							<li>
								<a href="#">
									<img src="${pageContext.request.contextPath}/resources/images/flag-kh.png">
									<span>Khmer</span>
								</a>
							</li>
						</ul>
		
					</li>
		
					<li class="sep"></li>
		
					
					<li>
						<a href="#" data-toggle="chat" data-collapse-sidebar="1">
							<i class="entypo-chat"></i>
							Chat
		
							<span class="badge badge-success chat-notifications-badge">3</span>
						</a>
					</li>
		
					<li class="sep"></li>
		
					<li>
						<a href="${pageContext.request.contextPath}/logout">
							Log Out <i class="entypo-logout right"></i>
						</a>
					</li>
				</ul>
		
			</div>
			<hr style="margin-top:60px;"/>
			<!-- ======= Dynamic Page Content ====== -->
			<div class="">
			
				<jsp:include page="${page}"></jsp:include>
				<footer class="main" style="padding-left:10px;">
			
					&copy; 2016 <strong>SR-GROUP2</strong> Admin Dashboard <a href="#" target="_blank">Siem Reap</a>
				
				</footer>
				
			</div>
			<!-- ======= END Dynamic Page Content ====== -->
		</div>
			
		</div>
				
		<!-- Footer 
		<footer class="main">
			&copy; 2016 <strong>KHMAEY</strong> Admin Theme by SRGroup2
		</footer>
		-->
	
	</div><!-- end main content -->

	<!-- Imported scripts on this page -->


	<script src="${pageContext.request.contextPath}/resources/assets/js/jquery-1.11.0.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/scripts/angular.min.js"></script>
	<!-- Bottom scripts (common) -->
	<script src="${pageContext.request.contextPath}/resources/assets/js/gsap/main-gsap.js"></script>
	<script src="${pageContext.request.contextPath}/resources/assets/js/jquery-ui/js/jquery-ui-1.10.3.minimal.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/assets/js/bootstrap.js"></script>
	
	<script src="${pageContext.request.contextPath}/resources/assets/js/resizeable.js"></script>
	<script src="${pageContext.request.contextPath}/resources/assets/js/neon-api.js"></script>
	<script src="${pageContext.request.contextPath}/resources/assets/js/jvectormap/jquery-jvectormap-1.2.2.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/assets/js/joinable.js"></script>
	
	
	
	<script src="${pageContext.request.contextPath}/resources/assets/js/jvectormap/jquery-jvectormap-europe-merc-en.js"></script>
	<script src="${pageContext.request.contextPath}/resources/assets/js/jquery.sparkline.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/assets/js/rickshaw/vendor/d3.v3.js"></script>
	<script src="${pageContext.request.contextPath}/resources/assets/js/rickshaw/rickshaw.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/assets/js/raphael-min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/assets/js/morris.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/assets/js/toastr.js"></script>
	
	<!-- JavaScripts initializations and stuff -->
	<script src="${pageContext.request.contextPath}/resources/assets/js/neon-custom.js"></script>
	<script src="${pageContext.request.contextPath}/resources/scripts/moment.js"></script>
	<script src="${pageContext.request.contextPath}/resources/assets/scripts/angular-bootstrap-multiselect.js"></script>
	<script src="${pageContext.request.contextPath}/resources/assets/scripts/app.js"></script>
	<script src="${pageContext.request.contextPath}/resources/assets/js/bootstrap-datepicker.js"></script>
	<script src="${pageContext.request.contextPath}/resources/assets/scripts/script.js"></script>
	<script src="${pageContext.request.contextPath}/resources/scripts/sweetalert/sweetalert.min.js"></script> 
	<script src="${pageContext.request.contextPath}/resources/scripts/dirPagination.js"></script>
	
	<script src="${pageContext.request.contextPath}/resources/scripts/jquery.bootpag.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/scripts/typeahead.bundle.min.js"></script>
	
	
	<!-- Demo Settings -->
	<script src="${pageContext.request.contextPath}/resources/assets/js/neon-demo.js"></script>
	
	
		
	<!-- =========== JS Application  ================ -->
	<script src="${pageContext.request.contextPath}/resources/assets/scripts/phanit.js"></script>
	<script src="${pageContext.request.contextPath}/resources/assets/scripts/restaurant.js"></script>
	
	<!--  =====================  File Upload   ========================= -->
	

	
	
</body>
</html>