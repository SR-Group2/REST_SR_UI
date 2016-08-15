<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    
<!DOCTYPE html>
<html lang="en" ng-app="app">
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">

	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	<meta name="description" content="Neon Admin Panel" />
	<meta name="author" content="" />

	<title>King Of Restaurant Menu Integegration | Dashboard</title>

	
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/font-icons/entypo/css/entypo.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/bootstrap.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/neon-core.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/font-icons/font-awesome/css/font-awesome.min.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/scripts/sweetalert/sweetalert.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap-datetimepicker.min.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/css/style.css">
	

</head>
<body >
<div class="page-container">
	<div class="sidebar-menu">
		<div class="sidebar-menu-inner">
			<header class="logo-env">

				<!-- logo -->
				<div class="logo">
					<a href="index.html">
						<h1 style="color:#fff;font-weight:bold;">Nham Ey</h1>
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
					<a href="index.html" target="_blank">
						<i class="entypo-gauge"></i>
						<span class="title">Dashboard</span>
					</a>
				</li>
				<li >
					<a href="${pageContext.request.contextPath}/admin/user" target="_self" >
						<i class="entypo-user"></i>
						<span class="title">Users</span>
					</a>
				 			
					<ul >
						<li>
							<a href="${pageContext.request.contextPath}/admin/user" target="_self">
								<span class="title">View User</span>
							</a>
						</li>
						<li>
							<a href="${pageContext.request.contextPath}/admin/adduser">
								<span class="title">Add New User</span>
							</a>	
						</li>
						
					</ul>
				
				</li>
				
				
				
				<li>
					<a href="${pageContext.request.contextPath}/admin/category" target="_self">
						<i class="entypo-layout"></i>
						<span class="title">Category</span>
					</a>
					
				</li>
				<li>
					<a href="index.html" target="_blank">
						<i class="entypo-monitor"></i>
						<span class="title">Frontend</span>
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
				<li>
					<a href="mailbox.html">
						<i class="entypo-mail"></i>
						<span class="title">Mailbox</span>
						<span class="badge badge-secondary">8</span>
					</a>
					<ul>
						<li>
							<a href="mailbox.html">
								<i class="entypo-inbox"></i>
								<span class="title">Inbox</span>
							</a>
						</li>
						<li>
							<a href="mailbox-compose.html">
								<i class="entypo-pencil">.</i>
								<span class="title">Compose Message</span>
							</a>
						</li>
						<li>
							<a href="mailbox-message.html">
								<i class="entypo-attach"></i>
								<span class="title">View Message</span>
							</a>
						</li>
					</ul>
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
							<img src="assets/images/thumb-1@2x.png" alt="" class="img-circle" width="44">
							John Henderson
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
				
				<ul class="user-info pull-left pull-right-xs pull-none-xsm">
		
					<!-- Raw Notifications -->
					<li class="notifications dropdown">
		
						<a href="#" class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown" data-close-others="true">
							<i class="entypo-attention"></i>
							<span class="badge badge-info">6</span>
						</a>
		
						<ul class="dropdown-menu">
							<li class="top">
								<p class="small">
									<a href="#" class="pull-right">Mark all Read</a>
									You have <strong>3</strong> new notifications.
								</p>
							</li>
							
							<li>
								<ul class="dropdown-menu-list scroller" tabindex="5001" style="overflow: hidden; outline: none;">
									<li class="unread notification-success">
										<a href="#">
											<i class="entypo-user-add pull-right"></i>
											
											<span class="line">
												<strong>New user registered</strong>
											</span>
											
											<span class="line small">
												30 seconds ago
											</span>
										</a>
									</li>
									
									<li class="unread notification-secondary">
										<a href="#">
											<i class="entypo-heart pull-right"></i>
											
											<span class="line">
												<strong>Someone special liked this</strong>
											</span>
											
											<span class="line small">
												2 minutes ago
											</span>
										</a>
									</li>
									
									<li class="notification-primary">
										<a href="#">
											<i class="entypo-user pull-right"></i>
											
											<span class="line">
												<strong>Privacy settings have been changed</strong>
											</span>
											
											<span class="line small">
												3 hours ago
											</span>
										</a>
									</li>
									
									<li class="notification-danger">
										<a href="#">
											<i class="entypo-cancel-circled pull-right"></i>
											
											<span class="line">
												John cancelled the event
											</span>
											
											<span class="line small">
												9 hours ago
											</span>
										</a>
									</li>
									
									<li class="notification-info">
										<a href="#">
											<i class="entypo-info pull-right"></i>
											
											<span class="line">
												The server is status is stable
											</span>
											
											<span class="line small">
												yesterday at 10:30am
											</span>
										</a>
									</li>
									
									<li class="notification-warning">
										<a href="#">
											<i class="entypo-rss pull-right"></i>
											
											<span class="line">
												New comments waiting approval
											</span>
											
											<span class="line small">
												last week
											</span>
										</a>
									</li>
								</ul>
							</li>
							
							<li class="external">
								<a href="#">View all notifications</a>
							</li>
						<div id="ascrail2001" class="nicescroll-rails" style="padding-right: 3px; width: 10px; z-index: 1000; position: absolute; top: 0px; left: -10px; height: 0px; cursor: default; display: none;"><div style="position: relative; top: 0px; float: right; width: 5px; height: 0px; border: 1px solid rgb(204, 204, 204); border-radius: 1px; background-color: rgb(212, 212, 212); background-clip: padding-box;"></div></div><div id="ascrail2001-hr" class="nicescroll-rails" style="height: 7px; z-index: 1000; top: -7px; left: 0px; position: absolute; cursor: default; display: none;"><div style="position: relative; top: 0px; height: 5px; width: 0px; border: 1px solid rgb(204, 204, 204); border-radius: 1px; background-color: rgb(212, 212, 212); background-clip: padding-box;"></div></div></ul>
		
					</li>
		
					<!-- Message Notifications -->
					<li class="notifications dropdown">
		
						<a href="#" class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown" data-close-others="true">
							<i class="entypo-mail"></i>
							<span class="badge badge-secondary">10</span>
						</a>
		
						<ul class="dropdown-menu">
							<li>
								<form class="top-dropdown-search">
									
									<div class="form-group">
										<input type="text" class="form-control" placeholder="Search anything..." name="s">
									</div>
									
								</form>
								
								<ul class="dropdown-menu-list scroller" tabindex="5002" style="overflow: hidden; outline: none;">
									<li class="active">
										<a href="#">
											<span class="image pull-right">
												<img src="assets/images/thumb-1.png" alt="" class="img-circle">
											</span>
											
											<span class="line">
												<strong>Luc Chartier</strong>
												- yesterday
											</span>
											
											<span class="line desc small">
												This ain’t our first item, it is the best of the rest.
											</span>
										</a>
									</li>
									
									<li class="active">
										<a href="#">
											<span class="image pull-right">
												<img src="assets/images/thumb-1.png" alt="" class="img-circle">
											</span>
											
											<span class="line">
												<strong>Salma Nyberg</strong>
												- 2 days ago
											</span>
											
											<span class="line desc small">
												Oh he decisively impression attachment friendship so if everything. 
											</span>
										</a>
									</li>
									
									<li>
										<a href="#">
											<span class="image pull-right">
												<img src="assets/images/thumb-1.png" alt="" class="img-circle">
											</span>
											
											<span class="line">
												Hayden Cartwright
												- a week ago
											</span>
											
											<span class="line desc small">
												Whose her enjoy chief new young. Felicity if ye required likewise so doubtful.
											</span>
										</a>
									</li>
									
									<li>
										<a href="#">
											<span class="image pull-right">
												<img src="assets/images/thumb-1.png" alt="" class="img-circle">
											</span>
											
											<span class="line">
												Sandra Eberhardt
												- 16 days ago
											</span>
											
											<span class="line desc small">
												On so attention necessary at by provision otherwise existence direction.
											</span>
										</a>
									</li>
								</ul>
							</li>
							
							<li class="external">
								<a href="mailbox.html">All Messages</a>
							</li>
						<div id="ascrail2002" class="nicescroll-rails" style="padding-right: 3px; width: 10px; z-index: 1000; position: absolute; top: 0px; left: -10px; height: 0px; cursor: default; display: none;"><div style="position: relative; top: 0px; float: right; width: 5px; height: 0px; border: 1px solid rgb(204, 204, 204); border-radius: 1px; background-color: rgb(212, 212, 212); background-clip: padding-box;"></div></div><div id="ascrail2002-hr" class="nicescroll-rails" style="height: 7px; z-index: 1000; top: -7px; left: 0px; position: absolute; cursor: default; display: none;"><div style="position: relative; top: 0px; height: 5px; width: 0px; border: 1px solid rgb(204, 204, 204); border-radius: 1px; background-color: rgb(212, 212, 212); background-clip: padding-box;"></div></div></ul>
		
					</li>
		
					<!-- Task Notifications -->
					<li class="notifications dropdown">
		
						<a href="#" class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown" data-close-others="true">
							<i class="entypo-list"></i>
							<span class="badge badge-warning">1</span>
						</a>
		
						<ul class="dropdown-menu">
							<li class="top">
								<p>You have 6 pending tasks</p>
							</li>
							
							<li>
								<ul class="dropdown-menu-list scroller" tabindex="5003" style="overflow: hidden; outline: none;">
									<li>
										<a href="#">
											<span class="task">
												<span class="desc">Procurement</span>
												<span class="percent">27%</span>
											</span>
										
											<span class="progress">
												<span style="width: 27%;" class="progress-bar progress-bar-success">
													<span class="sr-only">27% Complete</span>
												</span>
											</span>
										</a>
									</li>
									<li>
										<a href="#">
											<span class="task">
												<span class="desc">App Development</span>
												<span class="percent">83%</span>
											</span>
											
											<span class="progress progress-striped">
												<span style="width: 83%;" class="progress-bar progress-bar-danger">
													<span class="sr-only">83% Complete</span>
												</span>
											</span>
										</a>
									</li>
									<li>
										<a href="#">
											<span class="task">
												<span class="desc">HTML Slicing</span>
												<span class="percent">91%</span>
											</span>
											
											<span class="progress">
												<span style="width: 91%;" class="progress-bar progress-bar-success">
													<span class="sr-only">91% Complete</span>
												</span>
											</span>
										</a>
									</li>
									<li>
										<a href="#">
											<span class="task">
												<span class="desc">Database Repair</span>
												<span class="percent">12%</span>
											</span>
											
											<span class="progress progress-striped">
												<span style="width: 12%;" class="progress-bar progress-bar-warning">
													<span class="sr-only">12% Complete</span>
												</span>
											</span>
										</a>
									</li>
									<li>
										<a href="#">
											<span class="task">
												<span class="desc">Backup Create Progress</span>
												<span class="percent">54%</span>
											</span>
											
											<span class="progress progress-striped">
												<span style="width: 54%;" class="progress-bar progress-bar-info">
													<span class="sr-only">54% Complete</span>
												</span>
											</span>
										</a>
									</li>
									<li>
										<a href="#">
											<span class="task">
												<span class="desc">Upgrade Progress</span>
												<span class="percent">17%</span>
											</span>
											
											<span class="progress progress-striped">
												<span style="width: 17%;" class="progress-bar progress-bar-important">
													<span class="sr-only">17% Complete</span>
												</span>
											</span>
										</a>
									</li>
								</ul>
							</li>
							
							<li class="external">
								<a href="#">See all tasks</a>
							</li>
						<div id="ascrail2003" class="nicescroll-rails" style="padding-right: 3px; width: 10px; z-index: 1000; position: absolute; top: 0px; left: -10px; height: 0px; cursor: default; display: none;"><div style="position: relative; top: 0px; float: right; width: 5px; height: 0px; border: 1px solid rgb(204, 204, 204); border-radius: 1px; background-color: rgb(212, 212, 212); background-clip: padding-box;"></div></div><div id="ascrail2003-hr" class="nicescroll-rails" style="height: 7px; z-index: 1000; top: -7px; left: 0px; position: absolute; cursor: default; display: none;"><div style="position: relative; top: 0px; height: 5px; width: 0px; border: 1px solid rgb(204, 204, 204); border-radius: 1px; background-color: rgb(212, 212, 212); background-clip: padding-box;"></div></div></ul>
		
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
							<img src="assets/images/flag-uk.png">
						</a>
		
						<ul class="dropdown-menu pull-right">
							<li>
								<a href="#">
									<img src="assets/images/flag-de.png">
									<span>Deutsch</span>
								</a>
							</li>
							<li class="active">
								<a href="#">
									<img src="assets/images/flag-uk.png">
									<span>English</span>
								</a>
							</li>
							<li>
								<a href="#">
									<img src="assets/images/flag-fr.png">
									<span>François</span>
								</a>
							</li>
							<li>
								<a href="#">
									<img src="assets/images/flag-al.png">
									<span>Shqip</span>
								</a>
							</li>
							<li>
								<a href="#">
									<img src="assets/images/flag-es.png">
									<span>Español</span>
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
			<div class="row" style="margin-top:-20px;">
			<jsp:include page="${page}"></jsp:include>
				
			<!-- ======= END Dynamic Page Content ====== -->
			</div>
		</div>
			
		</div>
				
		<!-- Footer 
		<footer class="main">
			&copy; 2016 <strong>KHMAEY</strong> Admin Theme by SRGroup2
		</footer>
		-->
	
	</div><!-- end main content -->
	
	<script src="${pageContext.request.contextPath}/resources/assets/js/jquery-1.11.0.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/scripts/angular.min.js"></script>
	<!-- Bottom scripts (common) -->
	<script src="${pageContext.request.contextPath}/resources/assets/js/gsap/main-gsap.js"></script>
	<script src="${pageContext.request.contextPath}/resources/assets/js/jquery-ui/js/jquery-ui-1.10.3.minimal.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/assets/js/bootstrap.js"></script>
	
	<script src="${pageContext.request.contextPath}/resources/assets/js/resizeable.js"></script>
	<script src="${pageContext.request.contextPath}/resources/assets/js/neon-api.js"></script>
	<script src="${pageContext.request.contextPath}/resources/assets/js/jvectormap/jquery-jvectormap-1.2.2.min.js"></script>

	<!-- JavaScripts initializations and stuff -->
	<script src="${pageContext.request.contextPath}/resources/assets/js/neon-custom.js"></script>
	<script src="${pageContext.request.contextPath}/resources/scripts/moment.js"></script>
	<script src="${pageContext.request.contextPath}/resources/scripts/app.js"></script>
	<script src="${pageContext.request.contextPath}/resources/scripts/bootstrap-datetimepicker.js"></script>
	<script src="${pageContext.request.contextPath}/resources/scripts/script.js"></script>
	<script src="${pageContext.request.contextPath}/resources/scripts/sweetalert/sweetalert.min.js"></script> 
	<script src="${pageContext.request.contextPath}/resources/scripts/dirPagination.js"></script>
	<script src="${pageContext.request.contextPath}/resources/scripts/phanit.js"></script>
	
	<script src="${pageContext.request.contextPath}/resources/scripts/restaurant.js"></script>

</body>
</html>