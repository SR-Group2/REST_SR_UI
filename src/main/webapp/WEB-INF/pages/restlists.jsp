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
	<!-- ======== end Navigation ==========  -->
	<!-- ======== search section ==========  -->
	<section class="search_rest">
		<div class="container">
			<div class="row">
				<form id="frmsearch">
				  <div class="col-md-3 col-sm-3  col-xs-12" style="padding:10px 13px!important">
				  	 <select class="form-control"  id="filterRestype">
			          <option selected value="0"> select category </option>
					  <option ng-repeat="category in categories" value="{{category.restype_id}}">
					  	{{category.restype_name}}
					  </option>
			        </select> 
				  </div>
				  
				  <div class="col-md-7 col-sm-9  col-xs-12" style="padding:10px 13px!important">
				    <div class="input-group" id="remote">
				      <input type="text" class="form-control typeahead" id="keyword" 
									      placeholder="search restaurant ....." 
									      typeahead-on-select="onSelect()">
				      <span class="input-group-btn">
				        <button class="btn btn-secondary" type="submit"  id="fa-btnsearch" style="background:#5cb85c">
				        	<i class="fa fa-search" style="color:#ffffff"></i>
				        </button>
				      </span>
				    </div>
				  </div>
				</form>
			</div><!-- end row -->
		</div><!-- end container -->
	</section>
	<!-- ======== end search section ==========  -->

	<section class="rest-list">
		<div id="loader" class="container">
			<div id="loader-container">
				<img src="${pageContext.request.contextPath}/resources/images/loading1.gif">
			</div>
		</div>
	
		<div class="container" id="sidebar" >
			<div class="row">
				<!-- <div class="col-md-3">
					<div class="row" style="margin-top:15px">
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
					</div>end row
					
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
									
									check box option
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
									end check box option
								</form>	
							</div>
					</div>end row
				</div>end col-md-3 -->
				
				<div class="col-md-12">
					<div class="row" id="getRest">
								
						
					</div>
					<!-- ========= Pagination ============ -->
					<div class="row"  id="pagelimit">
						<div class=" text-xs-center">
							<nav id="pagination"  class="pagination"></nav>
						</div> 
					</div>
					<!-- end pagination -->
						
			 </div><!-- ======== col-md-9 -->
		</div>
	</div>
	</section>	
	
	<!--  ========  Model LOgin ====== -->
		<jsp:include page="modal_login.jsp"></jsp:include>
	<!--  ========  Model LOgin ====== -->


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
	
	<!-- ========= footer ============ -->
	<script src="${pageContext.request.contextPath}/resources/scripts/jquery-2.1.4.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/scripts/angular.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/scripts/bootstrap.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/scripts/jquery.tmpl.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/scripts/jquery.bpopup.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/scripts/jquery.bootpag.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/scripts/typeahead.bundle.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/scripts/sweetalert/sweetalert.min.js"></script> 
    
   <!--  ================ JQuery Template ======== -->
	<script id="rest_tmpl" type="text/x-jquery-tmpl">
		<div class="col-lg-3 col-md-4 col-xs-12 col-sm-6">
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
	
	<script src="${pageContext.request.contextPath}/resources/scripts/home/restlists.js"></script>
	<script src="${pageContext.request.contextPath}/resources/scripts/home/login.js" ></script>
</body>
</html>		
