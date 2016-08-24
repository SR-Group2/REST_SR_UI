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
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/restlist.css">
	
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
		
	<section class="rest-list">
		<div class="container" >
			<div class="row">
				<div class="col-md-3">
					<div class="row">
						<div class="box-filter">
							<h2>Search:</h2>
								<form>
								  <div class="form-group" id="remote">
							      	 <div class="right-inner-addon">
								         <i class="fa fa-search" id="fa-btnsearch"></i>
									      <input type="text" class="form-control typeahead" id="keyword" 
									      placeholder="search restaurant ....." 
									      typeahead-on-select="onSelect()"
									      style="background-color:#339524;color: #ffffff;">
								      	</div>
								  </div>						 
								</form>
						</div>
					</div><!-- end row -->
				
					<div class="row">
						<div class="box-sort">
								<h2>Filter:</h2>
								<form >
									<div class="form-group">
								        <select class="form-control"  id="filterRestype">
								          <option selected>---- select category -----</option>
										  <option ng-repeat="category in categories" value="{{category.restype_id}}">
										  	{{category.restype_name}}
										  </option>
								        </select>
								        <i class="fa fa-chevron-down"></i>							        
								      </div>
									
									<!-- check box option -->
									<div class="check-option">
										<div class="check-box">
											<label class="custom-control custom-checkbox">
											  <input type="checkbox" class="custom-control-input">
											  <span class="custom-control-indicator"></span>
											  <span class="custom-control-description">Recommended</span>
											</label>
										</div>
										<div class="check-box">
											<label class="custom-control custom-checkbox">
											  <input type="checkbox" class="custom-control-input">
											  <span class="custom-control-indicator"></span>
											  <span class="custom-control-description">Promotion</span>
											</label>
										</div>
										<div class="check-box">
											<label class="custom-control custom-checkbox">
											  <input type="checkbox" class="custom-control-input">
											  <span class="custom-control-indicator"></span>
											  <span class="custom-control-description">Most Favorite</span>
											</label>
										</div>
									</div>
									<div class="text-md-center">
										<button type="button" class="btn btn-search" id="searchRest">SEARCH</button>
									</div>
									<!-- end check box option -->
								</form>	
							</div>
					</div><!-- end row -->
				</div>
				
				<div class="col-md-9">
					<div class="row" id="getRest">
					
						
					</div>
					<!-- ========= Pagination ============ -->
						<section class="cotainer text-xs-center">
							<nav id="pagination"  class="pagination"></nav>
						</section> 
						<!-- end pagination -->
						
				</div><!-- ======== col-md-9 -->
		</div>
	</div>
	\</section>	
	
	
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


	<!-- ========= footer ============ -->
	<footer>
		<div class="container">
			<div class="row">
				
			</div>
			<p>Copy Right 2016. All right reserved.</p>
		</div>
	</footer>
	
	<!-- ========= footer ============ -->
	<script src="${pageContext.request.contextPath}/resources/scripts/jquery-2.1.4.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/scripts/angular.min.js"></script>
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
    
  
   <!--  ================ JQuery Template ======== -->
	<script id="rest_tmpl" type="text/x-jquery-tmpl">
		<div class="col-md-4">
			<div class="list-box" onclick="detailRest({{= rest_id}})">
				<div>
					  
                    <img class="img-fluid" src="http://localhost:9999{{= restpictures[0].path_name}}">
                       
				</div>
				<div class="list-des">
					<p style="
						white-space: nowrap;overflow: hidden;
						text-overflow: ellipsis;max-width: 100px;">{{= rest_name }}</p>
					<i class="fa fa-star text-warning"></i>
					<i class="fa fa-star text-warning"></i>
					<i class="fa fa-star text-warning"></i>
					<i class="fa fa-star text-secondary"></i>
					<i class="fa fa-star text-secondary"></i>
					<p style="
						white-space: nowrap;overflow: hidden;
						text-overflow: ellipsis;max-width: 150px;">{{= about}}</p>
				</div>
			</div>
		</div>
	</script>
	
	<script src="${pageContext.request.contextPath}/resources/scripts/restlists.js">></script>
</body>
</html>		
