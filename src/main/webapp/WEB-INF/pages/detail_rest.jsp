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
	<!-- Add fancyBox -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/fancybox/source/jquery.fancybox.css?v=2.1.5" type="text/css" media="screen" />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/fancybox/source/helpers/jquery.fancybox-thumbs.css?v=1.0.7" type="text/css" media="screen" />
	
</head>
<body ng-controller="mainCtrl">
<!-- ===================== FACEBOOK LIKE SHARE BUTTON================== -->
<div id="fb-root"></div>
<script>(function(d, s, id) {
  var js, fjs = d.getElementsByTagName(s)[0];
  if (d.getElementById(id)) return;
  js = d.createElement(s); js.id = id;
  js.src = "//connect.facebook.net/en_US/sdk.js#xfbml=1&version=v2.7";
  fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'facebook-jssdk'));</script>

<!-- ===================== FACEBOOK LIKE SHARE BUTTON================== -->
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
	<!-- ========= Restaurant Menu and Detail ============ -->
	<section class="rest_detail">
			<div class="container">
				<div class="row">
					<div class="col-md-7" style="padding: 20px 10px">
						<%-- <flipbook>
								<div id="flipbook">
									<img  class="hard" src="${pageContext.request.contextPath}/resources/images/logo.png">
									<div class="hard"></div>
									<img class="hard" ng-repeat="menu in menus" ng-src="http://localhost:9999{{menu.url}}"></div>
									<div class="hard"></div>
								</div>
						</flipbook> --%>
						<div class="row">
							<div class="col-md-12">
								<div id="menus">
									<div ng-repeat="menu in menus" menulist>
										<a ng-cloak class="fancybox" rel="group" href="http://localhost:9999{{menu.url}}">
											<img ng-cloak src="http://localhost:9999{{menu.url}}" class="img-fluid">
										</a>
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
							</div>
							<div class="col-md-12" style="margin-top:15px">
				
									 <div style="display:none">
										    <select id="start">
										      <option selected value="">Your Location</option>
										    </select>
										    
										    <select id="end">
										      <option selected value="{{coords}}">Your Restaurant</option>
										    </select>
									   </div>
					
									<div id="map" style="height:450px"></div>
									<!-- ======== TESTING GOOGLE MAP ======== -->
									
							</div>  
						</div><!-- end row -->
					</div><!-- end col-md-7 -->
                		
                
			<!--  ======================= end List Comment ===================== -->
			
			<div class="col-md-5 ">
				<div class="row">
					<div class="col-md-12 detail_rest">
							<h5 class="text-xs-center">ព័ត៌មានលំអិត</h5>
							<!-- <h4>
								<i class="fa fa-star text-warning"></i>
								<i class="fa fa-star text-warning"></i>
								<i class="fa fa-star text-warning"></i>
								<i class="fa fa-star text-warning"></i>
								<i class="fa fa-star text-warning"></i>
							 ONEMORE</h4> -->
							<p ng-cloak>{{about}}</p>
							<table class="table table-responsive">
								<tr>
									<td><i class="fa fa-male"> ឈ្មោះម្ចាស់ហាង</i></td>
									<td ng-cloak>{{owner_name}}</td>
								</tr>
								<tr>
									<td><i class="fa fa-cutlery"> ឈ្មោះហាង</i></td>
									<td ng-cloak>{{rest_name}}</td>
								</tr>	
								<tr>
									<td><i class="fa fa-phone"> ទំនាក់ទំនង</i></td>
									<td ng-cloak>{{contact}}</td>
								</tr>
								<tr>
									<td><i class="fa fa-home"> អាស្រ័យដ្ខាន </i></td>
									<td ng-cloak>{{address.village}}  </td>
								</tr>
								<tr>
									<td colspan="2" ng-cloak>{{address.communce}} {{address.district}} {{address.province}} លេខផ្លូវ:{{address.street}}</td>
								</tr>
								<!-- <tr>
									<td><i class="fa fa-location-arrow"> VIEW LOCATION</i></td>
									<td>{{location}}</td>
								</tr> -->
							</table>
							
							<div class="more_part">
							<button class="btnAdd" ng-click="addFavRest(rest_id)" id="btnfav">
							<i class="fa fa-heart"></i> SAVE FAVORITE </button>
							
						<!-- 	<button class="fb-like" data-href="https://nhamey.com" data-layout="button_count" data-action="like" data-show-faces="false" ></button>
							<button class="fb-share-button" data-href="https://nhamey.com/detail_rest/" data-layout="button_count"  data-show-faces="false" data-share="true"></button> -->
							<!-- <button class="btnAdd" id="location"><i class="fa fa-location-arrow"> VIEW LOCATION</i></button> -->
							<!-- <button class="btnAdd"><i class="fa fa-plus-circle"> VIEW MORE</i></button> -->
						</div>
					</div>
					<div class="col-md-12 comment">
						<!-- ============== comment =========== -->
						<sec:authorize access="isAuthenticated()">
							<div class="well">
			                    <h6>Leave a Comment:</h6>
			                    <form role="form" name="frmcomment">
			                        <div class="form-group">
			                            <textarea class="form-control" rows="3" ng-model="comment_text" ng-required="true"></textarea>
			                           <p id="user_id" style="display:none;"><sec:authentication property="principal.id" /></p>
			                        </div>
			                        <button type="submit" class="btn btn-success btn-sm" ng-click="addComment()" ng-disabled="frmcomment.$invalid">Submit</button>
			                    </form>
			                </div>
			             </sec:authorize>
                		<!-- ============== end comment =========== -->
						<!--  ======================= List Comment ===================== -->
		                <div class="list_comment" ng-show="checkcomment" style="background:#ffffff;padding:10px 14px;margin-top:10px;">
			                <div class="media"  ng-repeat="cm in comments">
								  <div class="media-left">
								    <a href="#">
								    <!-- 	<i class="fa fa-users fa-3x"></i> -->
								    <img class="img-circle" width="40" height="40" 
											src='http://localhost:9999{{cm.user.picture}}' />
								    <%--  <img class="media-object" src="${pageContext.request.contextPath}/resources/images/text.png" alt="Generic placeholder image"> --%>
								    </a>
								  </div>
								  <div class="media-body">
								    <h6 class="media-heading" ng-bind-template="{{cm.user.first_name}}"></h6>
								    <p>{{cm.comment}}</p>
								  </div>
								 
							</div>
						</div>
					</div>
				</div>
			</div>
			<!--  ================ Ending  ========== -->
		 </div>
       </div><!--  end container -->
	</section>
	<section>
		
			
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
	
	<!-- ========================= END Google Map ======================== -->
	<script> window.jQuery || document.write('<script src="booklet/jquery-2.1.0.min.js"><\/script>') </script>
	
	 <!-- ============= jQuery UI (optional) ============= -->
	<script src="${pageContext.request.contextPath}/resources/booklet/src/jquery-ui-1.10.4.min.js"></script>
	<script> window.jQuery.ui || document.write('<script src="${pageContext.request.contextPath}/resources/booklet/jquery-ui-1.10.4.min.js"><\/script>') </script>
	
	<!-- =============  Booklet ============== -->
	<script src="${pageContext.request.contextPath}/resources/booklet/src/jquery.easing.1.3.js" type="text/javascript"></script>
	<script src="${pageContext.request.contextPath}/resources/booklet/src/jquery.booklet.latest.js" type="text/javascript"></script>
	
	<!-- =============  Add Fancy Book =============  -->
	<%-- <script src="${pageContext.request.contextPath}/resources/fancybox/lib/jquery.easing.1.3.js" type="text/javascript"></script> --%>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/fancybox/lib/jquery.mousewheel-3.0.6.pack.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/fancybox/source/jquery.fancybox.pack.js?v=2.1.5"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/fancybox/source/helpers/jquery.fancybox-buttons.js?v=1.0.5"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/fancybox/source/helpers/jquery.fancybox-media.js?v=1.0.6"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/fancybox/source/helpers/jquery.fancybox-thumbs.js?v=1.0.7"></script>
    
    <!-- ========================= Google Map ======================== -->
	<script src="${pageContext.request.contextPath}/resources/map/route_for_user.js"></script>
    <script async defer
    src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBwcO947dFk6IkMpQlHtrCUDjOiyfp19AI&callback=initMap"></script>
    
    <!-- =============== Application JS ================= -->
    <script src="${pageContext.request.contextPath}/resources/scripts/home/login.js" ></script>
    <script src="${pageContext.request.contextPath}/resources/scripts/home/detail_rest.js" ></script>
    
</body>
</html>