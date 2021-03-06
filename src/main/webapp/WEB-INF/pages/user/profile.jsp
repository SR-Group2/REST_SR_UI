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
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/css/style-profile.css">
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
						<li class="nav-item"><a class="nav-link" href="#">បង្កើតគណនី</a></li>
					</sec:authorize>
					<!-- <li class="nav-item"><a class="nav-link" href="#">ទំនាក់ទំនង់</a>
					</li>
					<li class="nav-item"><a class="nav-link" href="#">អំពីយើង</a>
					</li> -->
					<sec:authorize access="isAuthenticated()">
					<li class="nav-item dropdown logined">
						<a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#" 
						role="button" aria-haspopup="true" aria-expanded="false"  style="color:#35ac2a !important;text-transform:uppercase;">
							<sec:authentication property="principal.username" />
							<p id="user_id" style="display:none"><sec:authentication property="principal.id" /></p>
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

<%--   <sec:authentication property="principal.id" /> 
  <sec:authentication property="principal.username" />  --%>

	
	
		<section class="profile">
		<div class="container">
			<div class="header-profile">
				<div class="row">
					<div class="col-md-3"> 
						<div class="img-profile">
							<img class="img-circle" src="http://localhost:9999{{picture}}" width="150px" height="150px">
						</div>	
					</div>
					<div class="col-md-9"> 
						<div class="row">
							<div class="text-profile">
							<div class="input-group">
								<span><h3 style="display: inline;">Ful Name: {{first_name}} {{last_name}}</h3></span>
								<span>
									<button class="btn btn-secondary pull-md-right" ng-click="getUserById(user_id)">... <i class="fa fa-pencil"></i>
									</button>
								</span>						
							</div>
								<div>
									<p>Date Of Birth: {{dob | date:'yyyy-MM-dd'}}</p>
									<p>Gender : {{gender }}</p>
								</div>
							</div>	
						</div>
						<div>
							<h3>Favorite Restaurant: </h3>
							<h3>{{favouriteRestaurants[0].fav_total}}</h3>
							<p><i class="fa fa-heart-o"></i> Favorite</p>
						</div>
					</div>
				</div>
			</div>
			<div class="row">
				<hr>
			</div>
			<div class="row"> 
				
				<div class="col-md-3"  ng-repeat=" fav in favouriteRestaurants">
					<div class="fav-box">
						<h6>{{fav.rest.rest_name}}</h6>
						<h6>{{fav.rest.total}}</h6>
						<a href="/detail_rest/{{fav.rest.rest_id}}">
							<img  class="img-fluid" src="http://localhost:9999{{fav.restpictures[0].path_name}}">
						</a>
					</div>
				</div>
				
			</div>
			
		</div>
	</section>
	<!-- <footer class="">
		<div class="container">
			<p>Copy Right 2016. All right reserved.</p>
		</div>
	</footer> -->
	<!-- ========= footer ============ -->
	<script
		src="${pageContext.request.contextPath}/resources/scripts/jquery-2.1.4.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/assets/js/bootstrap.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/scripts/jquery.tmpl.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/scripts/jquery.bpopup.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/scripts/jquery.bootpag.min.js"></script>

	<script
		src="${pageContext.request.contextPath}/resources/scripts/typeahead.bundle.min.js"></script>
		
	<script src="${pageContext.request.contextPath}/resources/scripts/sweetalert/sweetalert.min.js"></script> 
	<script src="${pageContext.request.contextPath}/resources/scripts/angular.min.js"></script> 
	<script src="${pageContext.request.contextPath}/resources/scripts/myapp.js"></script> 
</body>
</html>