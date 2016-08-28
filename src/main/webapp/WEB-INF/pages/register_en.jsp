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
<title>Welcome to NHAMEY</title>
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
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/css/register.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/scripts/sweetalert/sweetalert.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap-datepicker.min.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/bootstrap.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/neon-core.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/neon-forms.css">
	
</head>
<body ng-controller="signUpCtrl">
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
							data-toggle="modal" data-target="#login">Login</a></li>
					</sec:authorize>
					<sec:authorize access="!isAuthenticated()">
						<li class="nav-item"><a class="nav-link" href="#">Create Account</a></li>
					</sec:authorize>
					<li class="nav-item"><a class="nav-link" href="#">Contact Us</a>
					</li>
					<li class="nav-item"><a class="nav-link" href="#">About Us</a>
					</li>
					<sec:authorize access="isAuthenticated()">
					<li class="nav-item dropdown logined">
						<a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#" 
						role="button" aria-haspopup="true" aria-expanded="false">
							Welcome  <sec:authentication property="principal.username" />
						</a>
						<div class="dropdown-menu" aria-labelledby="Preview">
							<a class="nav-link" href="${pageContext.request.contextPath}/logout">
							<i class="fa fa-sign-out"></i> Logout</a>
						</div>
					</li>
					</sec:authorize>
				</ul>
			</div>
		</div>
	</nav>

<%--   <sec:authentication property="principal.id" /> 
  <sec:authentication property="principal.username" />  --%>
	<section class="signup" style="margin:0 auto;background:#f9f9f9;margin-bottom:10px;">
		<div class="container">
				<div class="col-md-8 offset-md-2">
					<div class="frmSignup">
					<form name="frmRegister">
						<div class="row">
						<div class="col-md-6">
							<div class="register-info">
								<h3>Register Account</h3>
								<p>If you already have an account with us, please login at the login page.</p>
							</div>
						</div>
						<div class="col-md-6">
							<div class="fileinput fileinput-new" data-provides="fileinput"><input type="hidden">
								<div class="fileinput-new thumbnail" style="width: 200px; height: 150px;" data-trigger="fileinput">
									<img src="${pageContext.request.contextPath}/resources/assets/images/profile-icon.png" alt="">
								</div>
								<div class="fileinput-preview fileinput-exists thumbnail" style="max-width: 200px; max-height: 150px; line-height: 6px;"></div>
								<div>
									<span class="btn btn-white btn-file">
										<span class="fileinput-new">Select image</span>
										<span class="fileinput-exists">Change</span>
										<input id="file" type="file" name="..." accept="image/*">
									</span>
									<a href="#" class="btn btn-orange fileinput-exists" data-dismiss="fileinput">Remove</a>
								</div>
							</div>
						</div>
						</div>
						<fieldset>
								<div class="col-md-6">
									<div class="form-group">
									<label for="lblfirstname">First Name</label>
						    		<input type="text" class="form-control" id="lblfirstname" placeholder="First Name" ng-model="txtfirstname" name="password">
						    		</div>
								</div>
						    	<div class="col-md-6">
						    		<div class="form-group">
						    		<label for="lbllastname">Last Name</label>
						    		<input type="text" class="form-control" id="lbllastname" placeholder="Last Name" ng-model="txtlastname" name="lastname">
						    		</div>
						    	</div>
						    <div class="col-md-12">
							  <div class="form-group">
							    <label for="lblusername">Username</label>
							    <input type="text" class="form-control" id="lblusername" placeholder="Username" ng-model="txtusername" name="username" required ng-minlength="3" ng-maxlength="8">
							  </div>
						  	</div>
						  	<div class="col-md-12">
						  		 <div class="form-group">
								    <label for="lblemail">Email</label>
								    <input type="email" class="form-control" id="lblemail" placeholder="Email" ng-model="txtemail" name="email" required>
								  </div>
						  	
						  	</div>
						  	<div class="col-md-12">
						  		<div class="form-group">
						    		<label for="lblpassword">Password</label>
						   	 		<input type="password" class="form-control" id="lblpassword" placeholder="Password" ng-model="txtpassword" name="password"  required">							
								  
								</div>
						  	</div>
						  	<div class="col-md-12">
							  	<div class="form-group">
								    <label for="lblconfirmpassword">Confirm Password</label>
								    <input type="password" class="form-control" id="lblconfirmpassword" ng-model="txtconfrimpword" placeholder="Confirm Password" >
							  	</div>
						  	</div>
						  	<div class="col-md-12">
								<label for="date" class="">Date of Birth</label>
							    <div class="input-group">   
							        <input class="form-control" id="date" name="date" placeholder="YYYY-MM-DD" type="text"  ng-model="txtdob" />
							        <div class="input-group-addon">
							          <i class="fa fa-calendar"></i>
							        </div>
							    </div>
				            </div>
						  	
						  	<div class="col-md-12">
						  		<label for="">Gender</label>
						  		<div class="input-group">
							  		<label class="radio-inline">
									  <input type="radio" name="gender" id="gender" ng-model="txtgender" value="Male"> Male
									</label>
									<label class="radio-inline">
									  <input type="radio" name="gender" id="gender" ng-model="txtgender" value="Female"> Female
									</label>
								</div>
						  	</div>
					
						  	<div class="col-md-6" style="padding-top:20px;">
						  		<!-- <div class="col-md-3">																	
				  							<div>
												<label  class="input-label">User Profile</label>
											</div>
											<div class="fileinput fileinput-new" data-provides="fileinput"><input type="hidden">
												<div class="fileinput-new thumbnail" style="width: 150px; height: 150px;" data-trigger="fileinput">
													<img src="" alt="...">
												</div>
												<div class="" style="max-width: 200px; max-height: 150px; line-height: 6px;"></div>
												<div>
													<span class="btn btn-white btn-file">
														<span class="fileinput-new">Select image</span>
														<span class="fileinput-exists">Change</span>
														<input type="file" id="file" name="..." accept="image/*">
													</span>
													<a href="#" class="btn btn-orange fileinput-exists" data-dismiss="fileinput">Remove</a>
												</div>
											</div>
										</div> -->
									
									
						  	</div><!-- ======= end col-md-12 ===== -->
						  	<div class="col-md-12">
						    	<div class="form-group">
									<button type="button" class="btn btn-block btn-success" ng-click="addUser()">Sign Up</button>
								</div>
						  	</div>
						  
						  
						  </fieldset>					  
						</form>
						</div>
					</div>
		</div>		
	</section>


	<!-- ========= footer ============ -->
	<footer class="footer">
		<div class="container">
			<ul class=" nav-inline pull-right">
				<li class="nav-item"><a class="nav-link" href="#">Contact Us</a>
				</li>
				<li class="nav-item"><a class="nav-link" href="#">About Us</a>
				</li>
			</ul>
		</div>
	</footer>

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
	
	<script src="${pageContext.request.contextPath}/resources/assets/js/fileinput.js"></script>
		
	<script src="${pageContext.request.contextPath}/resources/scripts/sweetalert/sweetalert.min.js"></script> 
	<script src="${pageContext.request.contextPath}/resources/scripts/sweetalert/sweetalert.min.js"></script> 
	<script src="${pageContext.request.contextPath}/resources/scripts/angular.min.js"></script>  
	<script src="${pageContext.request.contextPath}/resources/scripts/myapp.js"></script>  
	<script src="${pageContext.request.contextPath}/resources/scripts/bootstrap-datepicker.min.js"></script> 
	
	
	<script>
	$(document).ready(function(){
		var date_input=$('input[name="date"]'); //our date input has the name "date"
		var container=$('.bootstrap-iso form').length>0 ? $('.bootstrap-iso form').parent() : "body";
		date_input.datepicker({
			format: 'yyyy-mm-dd',
			container: container,
			todayHighlight: true,
			autoclose: true,
		})
	})
</script>
	

	
</body>
</html>