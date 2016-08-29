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
						<%-- <div class="dropdown-menu" aria-labelledby="Preview">
							<a class="nav-link" href="${pageContext.request.contextPath}/logout">
							<i class="fa fa-sign-out"></i> ចាកចេញ</a>
						</div> --%>
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

	<!-- ======== Nearby ========= -->
	<section class="nearby-location">
		<div class="container-fulid">
			<div class="row">
				<div id="googleMap" style="height:760px; border-raduis:5px;"></div>
			</div> 
		</div>
	</section>
	<!--  end Nearby -->

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

	

	<script>
		
		function detailRest(id) {
			window.location.href = "${pageContext.request.contextPath}/restaurant/"
					+ id;
		}

		$(function() {
			$('#login')
					.on(
						'hidden.bs.modal',
						function(e) {

							console.log($("#frmLogin").serialize());

							$.ajax({
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

<script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDOj_c_OyElplz9uFhvd1fEngN8Afl061s&libraries=places"></script>
<script>
		var map;
		var infowindow;
		var request;
		var service;
		var markers=[];
		function initialize() {
		  var center={lat: 11.5449, lng: 104.8922};
		  var mapProp = {
		    center:center,
		    zoom:13,
		    panControl:true,
		    zoomControl:true,
		    mapTypeControl:true,
		    scaleControl:true,
		    streetViewControl:true,
		    overviewMapControl:true,
		    rotateControl:true,
		    mapTypeId:google.maps.MapTypeId.ROADMAP
		  };
		  map=new google.maps.Map(document.getElementById("googleMap"),mapProp);
		  request={
		  	location:center,
		  	radius:8047,
		  	types:['restaurant']
		  };
		  	infowindow= new google.maps.InfoWindow();
		 	service = new google.maps.places.PlacesService(map);
			service.nearbySearch(request, callback);
		
			google.maps.event.addDomListener(map,'dblclick',function(event){
				map.setCenter(event.latLng)
				clearResults(markers)
				var request={
				  	location:event.latLng,
				  	radius:700,
				  	types:['restaurant']
				 };
				service.nearbySearch(request, callback);
			})
		}
		
		 function callback(results,status){
		  	if(status==google.maps.places.PlacesServiceStatus.OK){
		  		for(var i=0; i<results.length;i++){
		  			markers.push(createMarker(results[i]));
		  		}
		
		  	}
		  }
		
		 function createMarker(place){
		  	var placeLoc=place.geometry.location;
		  		marker= new google.maps.Marker({
		  		map:map,
		  		position:place.geometry.location
		  	});
		
		  	google.maps.event.addDomListener(marker,'click',function(){
		  		
		  		map.setZoom(15);
		  		infowindow.setContent(place.name);
		  		infowindow.open(map,this);
		  		
		  	});
		  	return marker;
		  }
		  function clearResults(markers){
		  	for(var m in markers){
		  		markers[m].setMap(null);
		  	}
		  	markers=[];
		
		  }
		google.maps.event.addDomListener(window, 'load', initialize);
</script>

</body>
</html>