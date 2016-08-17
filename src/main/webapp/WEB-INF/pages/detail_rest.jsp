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
<meta charset="UTF-8">
<title>Restaurant || Page</title>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/style.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/font-awesome.min.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/screen.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/jquery.booklet.latest.css">
	
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/source/jquery.fancybox.css?v=2.1.5" media="screen" />

	<!-- Add Button helper (this is optional) -->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/source/helpers/jquery.fancybox-buttons.css?v=1.0.5" />
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/source/helpers/jquery.fancybox-buttons.js?v=1.0.5"></script>

	<!-- Add Thumbnail helper (this is optional) -->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/source/helpers/jquery.fancybox-thumbs.css?v=1.0.7" />
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/source/helpers/jquery.fancybox-thumbs.js?v=1.0.7"></script>
	
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
					<li class="nav-item"><a class="nav-link" href="#">ទំនាក់ទំនង់</a>
					</li>
					<li class="nav-item"><a class="nav-link" href="#">អំពីយើង</a>
					</li>
					<sec:authorize access="isAuthenticated()">
					<li class="nav-item dropdown logined">
						<a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#" 
						role="button" aria-haspopup="true" aria-expanded="false">
							Welcome  <sec:authentication property="principal.username" />
						</a>
						<div class="dropdown-menu" aria-labelledby="Preview">
							<a class="nav-link" href="${pageContext.request.contextPath}/logout">
							<i class="fa fa-sign-out"></i> ចាកចេញ</a>
						</div>
					</li>
					</sec:authorize>
				</ul>
			</div>
		</div>
	</nav>
	<!-- ========= Restaurant Menu and Detail ============ -->
	<section class="rest_detail">
			<div class="container">
				<div class="row">
					<div class="col-md-7">
						<div class="box-img formlogin">
							<div id="menu">
								<%-- <a class="fancybox" rel="gallery1"  ng-repeat="menu in menus"
								href="${pageContext.request.contextPath}/resources/images/flipbook/{{menu.picture}}" 
								title="Category">
						        <img  ng-repeat="menu in menus" src="${pageContext.request.contextPath}/resources/images/flipbook/{{menu.picture}}" >
						        </a> --%>
						        <a class="fancybox" rel="gallery1" href="${pageContext.request.contextPath}/resources/images/flipbook/rest-menu.png" title="Category">
						        <img src="${pageContext.request.contextPath}/resources/images/flipbook/rest-menu.png">
						        </a>
						        <a class="fancybox" rel="gallery1" href="${pageContext.request.contextPath}/resources/images/flipbook/rest-menu.png" title="Category">
						        <img src="${pageContext.request.contextPath}/resources/images/flipbook/rest-menu.png">
						        </a>
						        <a class="fancybox" rel="gallery1" href="${pageContext.request.contextPath}/resources/images/flipbook/rest-menu.png" title="Category">
						        <img src="${pageContext.request.contextPath}/resources/images/flipbook/rest-menu.png">
						        </a>
						        <a class="fancybox" rel="gallery1" href="${pageContext.request.contextPath}/resources/images/flipbook/rest-menu.png" title="Category">
						        <img src="${pageContext.request.contextPath}/resources/images/flipbook/rest-menu.png">
						        </a> 
						    </div>
						</div>
						<br>
						
						<!-- ============== comment =========== -->
						<div class="well">
                    <h5>Leave a Comment:</h5>
                    <form role="form" lpformnum="1">
                        <div class="form-group">
                            <textarea class="form-control" rows="3"></textarea>
                        </div>
                        <button type="submit" class="btn btn-success">Submit</button>
                    </form>
                </div>
                <!-- ============== end comment =========== -->
					</div>
					<div class="col-md-5 box-img formlogin restinfo">
							<h2>Restaurant Information</h2>
							<h4>
								<i class="fa fa-star text-warning"></i>
								<i class="fa fa-star text-warning"></i>
								<i class="fa fa-star text-warning"></i>
								<i class="fa fa-star text-warning"></i>
								<i class="fa fa-star text-warning"></i>
							 ONEMORE</h4>
							<p>{{about}}</p>
							<table class="table">
								<tr>
									<td><i class="fa fa-users"> OWNER RESTAURANT</i></td>
									<td>{{owner_name}}</td>
								</tr>
								<tr>
									<td><i class="fa fa-cutlery"> RESTAURANT NAME</i></td>
									<td>{{rest_name}}</td>
								</tr>	
								<tr>
									<td><i class="fa fa-phone"> CONTACT</i></td>
									<td>{{contact}}</td>
								</tr>
								<tr>
									<td><i class="fa fa-home"> LOCATION</i></td>
									<td>{{location}}</td>
								</tr>
							</table>
							
							<div class="more_part">
							<button class="btnAdd"><i class="fa fa-heart"> ADD FAVORITE</i></button>
							<!-- <button class="btnAdd"><i class="fa fa-plus-circle"> VIEW MORE</i></button> -->
						</div>
					</div>
				</div>  
			</div>
			<!--  ================ Ending  ========== -->
			
			
                
		</section>
			<!-- ========= footer ============ -->
		<footer class="">
			<div class="container">
				<p>Copy Right 2016. All right reserved.</p>
			</div>
	</footer>
			<!-- ========= footer ============ -->
			
			
			<!--  ========  Model LOgin ====== -->
<!--  ========  Model LOgin ====== -->
	<!-- Modal -->
	<div class="modal fade" id="login" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header text-xs-center">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<img id="myModalLabel" class="logo"
						src="${pageContext.request.contextPath}/resources/images/logo.png"></img>
				</div>
				<div class="modal-body">
					<form class="formlogin" id="frmLogin" method="POST">
						<fieldset>
							<h3 class="text-success text-xs-center">Welcome</h3>
							<div class="form-group">
								<label class="text-xs-left">Username</label> <input type="text"
									class="form-control form-control-succes" name="username"
									placeholder="enter your username">
							</div>
							<div class="form-group">
								<label class="text-xs-left">Password</label> <input
									type="password" class="form-control form-control-succes"
									name="password" placeholder="enter your password">
							</div>
							<div class="form-group">
								<button type="button" class="btn btn-outline-success"
									data-dismiss="modal">Sing in</button>
								-- or -- <a href="#"><img
									src="${pageContext.request.contextPath}/resources/images/facebooklogin.png"></a>
							</div>
						</fieldset>
					</form>
				</div>
			</div>
		</div>
	</div>


	<script src="${pageContext.request.contextPath}/resources/scripts/jquery-2.1.4.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/scripts/bootstrap.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/scripts/angular.min.js"></script>

	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/scripts/restaurant-menu.js"></script>
	
	

	<script src="${pageContext.request.contextPath}/resources/scripts/jquery-ui-1.10.4.min.js"> </script>
	<script src="${pageContext.request.contextPath}/resources/scripts/jquery-ui.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/scripts/jquery.easing.1.3.js"></script>
	<script src="${pageContext.request.contextPath}/resources/scripts/jquery.booklet.latest.min.js"></script>
	
	<!-- Add mousewheel plugin (this is optional) -->
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/scripts/jquery.mousewheel-3.0.6.pack.js"></script>

	<!-- Add fancyBox main JS and CSS files -->
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/source/jquery.fancybox.js?v=2.1.5"></script>
	

	<!-- Add Media helper (this is optional) -->
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/source/helpers/jquery.fancybox-media.js?v=1.0.6"></script>
	
	<script>
	//==================== Get Restaurant Information ===================
		var app = angular.module("app", []);
	  	app.controller("mainCtrl", function($http, $scope){
	  		
	  		var id = window.location.href.substring(window.location.href.lastIndexOf('/') + 1);
	  		
	  		$scope.getRestDetail = function(){
	  			
	  			$http.get("${pageContext.request.contextPath}/rest/restaurant/"+id)
	  			.then(function(rsp){
	  				console.log(rsp);
	  				$scope.rest = rsp.data.DATA;
	  				$scope.rest_name = $scope.rest.rest_name;
	  				$scope.about = $scope.rest.about;
	  				$scope.contact = $scope.rest.contact;
	  				$scope.location = $scope.rest.location;
	  				$scope.owner_name = $scope.rest.user.username;
	  				$scope.rest_id = $scope.rest.rest_id;
	  				
	  				$scope.getCategoryByRestID($scope.rest_id);
	  			});
	  		}
	  		
	  		$scope.getRestDetail();
	  		
	  		//==================== Get Category From Restaurant ID ===================
			$scope.getCategoryByRestID = function(rest_id){	
	  			$http.get("${pageContext.request.contextPath}/rest/category/catrest/"+rest_id)
	  			.then(function(rsp){
	  				$scope.menus = rsp.data.DATA;
	  				console.log($scope.menus);
	  			});
	  		}
			
	  	});
	  	//========================= Style Button ================
	  	$(".btn-outline-success").on("mouseenter", function(){
		
		});
	  	
	  	// =============== Book Flip Menu Restaurant ============
	    $(function () {		
	        $("#menu").booklet({
	        	speed:500,
	        	width: 600,
        		height: 400
	        });
	        $(".fancybox").fancybox({
	    		openEffect	: 'none',
	    		closeEffect	: 'none',
	    		fitToView: true
	    		
	    	});
	        
	        
	        $('#login')
			.on(
					'hidden.bs.modal',
					function(e) {

						console.log($("#frmLogin").serialize());

						$
								.ajax({
									url : "${pageContext.request.contextPath}/login",
									type : "POST",
									data : $("#frmLogin").serialize(),
									success : function(data) {
										if (data == "User account is locked") {
											alert(data);
										} else if (data == "User is disabled") {
											alert(data);
										} else if (data == "Bad credentials") {
											alert(data);
										} else {
											swal("Welcome To Nham Ey", "You clicked the button!", "success")
											window.location.href = "${pageContext.request.contextPath}/"
													+ data;
										}
									},
									error : function(data) {
										console.log(data);
									}
								});
					});

	    });
	
	
		
	
	    
    </script>
</body>
</html>