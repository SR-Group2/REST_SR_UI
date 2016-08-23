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
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/screen.css"/>
	 <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/booklet/src/jquery.booklet.latest.css"/>
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
							<p id="user_id" style="display:none"><sec:authentication property="principal.id" /></p>
						</a>
						<div class="dropdown-menu" aria-labelledby="Preview">
							<a class="nav-link" href="${pageContext.request.contextPath}/logout">
							<i class="fa fa-sign-out"></i> ចាកចេញ</a>
							<a class="nav-link" href="${pageContext.request.contextPath}/profile">
							<i class="fa fa-user"></i> Profile</a>
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
						<%-- <flipbook>
								<div id="flipbook">
									<img  class="hard" src="${pageContext.request.contextPath}/resources/images/logo.png">
									<div class="hard"></div>
									<img class="hard" ng-repeat="menu in menus" ng-src="http://localhost:9999{{menu.url}}"></div>
									<div class="hard"></div>
								</div>
						</flipbook> --%>
						
						<div id="menus">
							<div ng-repeat="menu in menus" menulist>
								<img src="http://localhost:9999{{menu.url}}" class="img-fluid">
							</div>
							
							
							<%-- <div>
								<img  src="${pageContext.request.contextPath}/resources/images/logo.png" class="img-fluid">
							</div> 
							
							<div>
								<img  src="${pageContext.request.contextPath}/resources/images/logo.png" class="img-fluid">
							</div> 
							
							<div>
								<img  src="${pageContext.request.contextPath}/resources/images/logo.png" class="img-fluid">
							</div> 
							
							<div>
								<img  src="${pageContext.request.contextPath}/resources/images/logo.png" class="img-fluid">
							</div>  --%>
							
						</div>

						<!-- ============== comment =========== -->
						<sec:authorize access="isAuthenticated()">
							<div class="well">
			                    <h5>Leave a Comment:</h5>
			                    <form role="form">
			                        <div class="form-group">
			                            <textarea class="form-control" rows="3" ng-model="comment_text" required></textarea>
			                           <p id="user_id" style="display:none;"><sec:authentication property="principal.id" /></p>
			                        </div>
			                        <button type="submit" class="btn btn-success" ng-click="addComment()">Submit</button>
			                    </form>
			                </div>
			             </sec:authorize>
                <!-- ============== end comment =========== -->
                
                <!--  ======================= List Comment ===================== -->
                <div class="comment" style="background:#ffffff;padding:10px 14px;border:1px solid rgba(0,0,0,0.2);margin-top:10px;">
	                <div class="media"  ng-repeat="cm in comments">
						  <div class="media-left">
						    <a href="#">
						    <!-- 	<i class="fa fa-users fa-3x"></i> -->
						     <img class="media-object" src="${pageContext.request.contextPath}/resources/images/text.png" alt="Generic placeholder image">
						    </a>
						  </div>
						  <div class="media-body">
						    <h4 class="media-heading" ng-bind-template="{{cm.user.first_name}}"></h4>
						    <p>{{cm.comment}}</p>
						  </div>
					</div>
				</div>
			<!--  ======================= end List Comment ===================== -->
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
									<td><i class="fa fa-location-arrow"> Address </i></td>
									<td>{{address.village}}  </td>
								</tr>
								<tr>
									<td colspan="2">{{address.communce}} {{address.district}} {{address.province}} លេខផ្លូវ:{{address.street}}</td>
								</tr>
								<!-- <tr>
									<td><i class="fa fa-home"> LOCATION</i></td>
									<td>{{location}}</td>
								</tr> -->
							</table>
							
							<div class="more_part">
							<button class="btnAdd" ng-click="addFavRest(rest_id)" id="btnfav"><i class="fa fa-heart"> ADD FAVORITE </i></button>
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

	<sec:authorize access="isAuthenticated()" var="session_isLogin"/>
	<sec:authorize access="isAuthenticated()">
		<sec:authentication property="principal.id" var="session_userID"/>
	</sec:authorize>

	<script src="${pageContext.request.contextPath}/resources/scripts/jquery-2.1.0.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/scripts/bootstrap.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/scripts/angular.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/scripts/turn.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/scripts/sweetalert/sweetalert.min.js"></script> 
	<script src="${pageContext.request.contextPath}/resources/scripts/myapp.js"></script> 
	
	<script> window.jQuery || document.write('<script src="booklet/jquery-2.1.0.min.js"><\/script>') </script>
	
	 <!-- ============= jQuery UI (optional) ============= -->
	<script src="${pageContext.request.contextPath}/resources/booklet/src/jquery-ui-1.10.4.min.js"></script>
	<script> window.jQuery.ui || document.write('<script src="${pageContext.request.contextPath}/resources/booklet/jquery-ui-1.10.4.min.js"><\/script>') </script>
	
	<!-- =============  Booklet ============== -->
	<script src="${pageContext.request.contextPath}/resources/booklet/src/jquery.easing.1.3.js" type="text/javascript"></script>
	<script src="${pageContext.request.contextPath}/resources/booklet/src/jquery.booklet.latest.js" type="text/javascript"></script>
	<script>
	//==================== Get Restaurant Information ===================
		var id = window.location.href.substring(window.location.href.lastIndexOf('/') + 1);
	  		console.log(id);
	  		
	  		
	  		
	  		app.directive('menulist', [function() {
	            return {
	                restrict: 'A',       
	                link: function(scope, element) {
	                    // wait for the last item in the ng-repeat then call init
	                    if(scope.$last){
	                    	if(scope.$root.checkBooklet){
	                    		$('#menus').booklet();
	                    	}
	                    	scope.$root.checkBooklet = true;
	                    }
	                }
	            };
	        }]);	
		
	  	
		
	  	app.controller("mainCtrl", function($http, $scope, $rootScope){
	  		
	  		$rootScope.checkBooklet = false;
	
	  		var id = window.location.href.substring(window.location.href.lastIndexOf('/') + 1);
	  		console.log(id);
	  		//============================ LOAD DATA OF CATEGORY ===========================
	  		$scope.getCategory = function(){
	  		
	  			$http.get("${pageContext.request.contextPath}/rest/category/catrest/"+id)
				.then(function(rsp){
				
					$scope.menus = rsp.data.DATA;
					
				});
	  		} 
		 	
			$scope.getCategory();
			
			
			
		  	
	  		
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
	  				$scope.address = $scope.rest.address;
	  				$scope.getCategoryByRestID($scope.rest_id);
	  				
	  				
	  				//=========== Check usersession is login or not=============
	  				if("${session_isLogin}" == "true"){
	  					//alert("${session_isLogin}" + " " + "${session_userID}");
	  					$scope.isExist($scope.rest.rest_id, "${session_userID}");
	  				
	  				}

	  				
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

			//==================== Get comment ===================
				//http://localhost:8080/rest/comment/restaurant/3
			$scope.getComment = function(rest_id){
				$http.get("${pageContext.request.contextPath}/rest/comment/restaurant/"+rest_id)
	  			.then(function(rsp){
	  				if(rsp.data.DATA !=null){
	  					$scope.comments = rsp.data.DATA;
	  				}
	  				
	  				console.log("rsp");
	  			});
			}
			
			$scope.getComment(id);
			//==================== add comment ===================
			$scope.addComment = function(){
				var user_id = parseInt($("#user_id").text());
				var rest_id = parseInt(id);
				data = {
						  "comment":$scope.comment_text,
						  "user": {
						    "user_id": user_id
						  },
						  "rest": {
						    "rest_id": rest_id
						    }
						};

				if($scope.comment_text = ""){
					console.log(data);
				}
			$http.post("${pageContext.request.contextPath}/rest/comment/", data)
	  			.then(function(rsp){
	  				$scope.getComment(id);
	  				$scope.comment_text = "";
	  				
	  			});
			}
			
	/*========================Add Favorite Restaurant ======================*/
			
			
			$scope.addFavRest= function(rest_id){
				
				if("${session_isLogin}" == "false"){
					location.href="/login";
					return;
				}

			//$("#btnfav").text("Saved");
			$scope.user_id = parseInt($('#user_id').text());			
			data={
					'user':{
						'user_id':$scope.user_id
					},
					'rest':{
						'rest_id':rest_id
					}	
			}
			$http.post('http://localhost:8080/rest/favourite-restaurant',data).then(function(response){
				alert('successfully added');
				$("#btnfav").text("Saved");
				$("#btnfav").attr('disabled', 'disabled');
			});
			
		} 
			
			
		/*======================= Check Restaurant is Exist or not ===================*/
		$scope.isExist=function(rest_id,user_id){
				$http.get('http://localhost:8080/rest/favourite-restaurant/is-fav-existed/'+user_id+'/'+rest_id).then(function(response){	
					if(response.data.STATUS == false){						
						$("#btnfav").text("Saved");
						$("#btnfav").attr('disabled', 'disabled');
					}else{
						$("#btnfav").text("Add Favorite");
						
					}
					
				});
			}
	  	});
	
	  	//=================== login action ===============     
	        $('#login').on('hidden.bs.modal',
					function(e) {
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

	
    </script>
</body>
</html>