<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Restaurant || Page</title>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/style.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/font-awesome.min.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/screen.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/jquery.booklet.latest.css">
</head>
<body>
	<!-- ======== Navigation ==========  -->
	<nav class="navbar navbar-light bg-faded" style="background-color: #ffffff;">
		<div class="container">
				 <a href="#"><img class="navbar-brand img-fluid logo" src="${pageContext.request.contextPath}/resources/images/logo.png"></a>	
			  <div class="menu">
				  <ul class="nav navbar-nav pull-xs-right">
				    <li class="nav-item">
				      <a class="nav-link" href="#" data-toggle="modal" data-target="#login">ចូលប្រើ</a>
				    </li>
				    <li class="nav-item">
				      <a class="nav-link" href="#">បង្កើតគណនី</a>
				    </li>
				    <li class="nav-item">
				      <a class="nav-link" href="#">ទំនាក់ទំនង់</a>
				    </li>
				    <li class="nav-item">
				      <a class="nav-link" href="#">អំពីយើង</a>
				    </li>
				  </ul>
			  </div>
		</div> 
	</nav>
	<!-- ========= Restaurant Menu and Detail ============ -->
			<div class="container">
				<div class="row">
					<div class="col-md-7">
						<div class="box-img formlogin">
							<div id="menu">
						        <img src="${pageContext.request.contextPath}/resources/images/flipbook/rest-menu.png">
						        <img src="${pageContext.request.contextPath}/resources/images/flipbook/rest-menu.png">
						        <img src="${pageContext.request.contextPath}/resources/images/flipbook/rest-menu.png">
						        <img src="${pageContext.request.contextPath}/resources/images/flipbook/rest-menu.png">
						        <img src="${pageContext.request.contextPath}/resources/images/flipbook/rest-menu.png">
						    </div>
						</div>
						<br>
						<div class="btn-outline-success">
							<button class="btn-outline-success btn"><i class="fa fa-plus"> ADD FAVORITE</i></button>
							<button class="btn-outline-success btn"><i class="fa fa-plus"> VIEW MORE</i></button>
						</div>
						
					</div>
					<div class="col-md-5 box-img formlogin restinfo">
							<h2>Restaurant Information In Detail</h2>
							<h4>
								<i class="fa fa-star text-warning"></i>
								<i class="fa fa-star text-warning"></i>
								<i class="fa fa-star text-warning"></i>
								<i class="fa fa-star text-warning"></i>
								<i class="fa fa-star text-warning"></i>
							 ONEMORE</h4>
							<p> Ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod....</p>
							<table class="table" ng-repeat="restaurant in restaurants">
								<tr>
									<td><i class="fa fa-users"> Name</i></td>
									<td>{{restaurant.rest_name}}</td>
								</tr>	
								<tr>
									<td><i class="fa fa-phone"> Contact</i></td>
									<td>{{restaurant.contact}}</td>
								</tr>
								<tr>
									<td><i class="fa fa-home"> Location</i></td>
									<td>{{restaurant.location}}</td>
								</tr>
							</table>
					</div>
				</div>
			</div>
			<!--  ================ Ending  ========== -->
			<!-- ========= footer ============ -->
		<footer class="navbar-fixed-bottom">
			<div class="container">
				<p>Copy Right 2016. All right reserved.</p>
			</div>
	</footer>
			<!-- ========= footer ============ -->
			
			
			<!--  ========  Model LOgin ====== -->
<!-- Modal -->
<div class="modal fade" id="login" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header text-xs-center">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
        <img id="myModalLabel" class="logo" src="${pageContext.request.contextPath}/resources/images/logo.png"></img>
      </div>
      <div class="modal-body">
      	<form class="formlogin">
      		<fieldset>
      			<h3 class="text-success text-xs-center">Welcome</h3>
      			<div class="form-group">
      				<label class="text-xs-left">Username</label>
      				<input type="text" class="form-control form-control-succes" name="username" placeholder="enter your username">
      			</div>
      			<div class="form-group">
      				<label class="text-xs-left">Password</label>
      				<input type="password" class="form-control form-control-succes" name="password" placeholder="enter your password">
      			</div>
      			<div class="form-group">
      				<button type="button" class="btn btn-outline-success">Sing in</button>
      				-- or --
      				<a href="#"><img src="${pageContext.request.contextPath}/resources/images/facebooklogin.png"></a>
      			</div>
      		</fieldset>
      	</form>
      </div>
    </div>
  </div>
</div>

	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/scripts/restaurant-menu.js"></script>
	<script src="${pageContext.request.contextPath}/resources/scripts/jquery-2.1.4.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/scripts/bootstrap.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/scripts/angular.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/scripts/jquery-3.1.0.js"></script>
	<script src="${pageContext.request.contextPath}/resources/scripts/jquery-2.1.0.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/scripts/jquery-ui-1.10.4.min.js"> </script>
	<script src="${pageContext.request.contextPath}/resources/scripts/jquery-ui.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/scripts/jquery.easing.1.3.js"></script>
	<script src="${pageContext.request.contextPath}/resources/scripts/jquery.booklet.latest.min.js"></script>
	<script>
	    $(function () {		
	        $("#menu").booklet({
	        	speed:500,
	        	width: 600,
        		height: 400
	        });

	    });
    </script>
</body>
</html>