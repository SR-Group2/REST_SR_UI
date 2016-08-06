<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
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
	
	<script src="${pageContext.request.contextPath}/resources/assets/js/jquery-1.11.0.min.js"></script>
	<script>$.noConflict();</script>

	


</head>
<body>

<div class="page-container">
	<div class="sidebar-menu">
		<div class="sidebar-menu-inner">
			<header class="logo-env">

				<!-- logo -->
				<div class="logo">
					<a href="index.html">
						<h1 style="color:#fff;font-weight:bold;">nmamey</h1>
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
				<li>
					<a href="#">
						<i class="entypo-layout"></i>
						<span class="title">Category</span>
					</a>
					<ul>
						<li>
							<a href="#">
								<span class="title">Khmer</span>
							</a>
						</li>
						<li>
							<a href="#">
								<span class="title">Korean</span>
							</a>
							<ul>
								<li>
									<a href="#">
										<span class="title">Korean</span>
									</a>
								</li>
							</ul>
						</li>
						<li>
							<a href="#">
								<span class="title">Thai</span>
							</a>
						</li>
						<li>
							<a href="#">
								<span class="title">Vietname</span>
							</a>
						</li>
					</ul>
				</li>
				<li>
					<a href="index.html" target="_blank">
						<i class="entypo-monitor"></i>
						<span class="title">Frontend</span>
					</a>
				</li>
				<li>
					<a href="#">
						<i class="entypo-newspaper"></i>
						<span class="title">Restaurant</span>
					</a>
					<ul>
						<li>
							<a href="#">
								<span class="title">Lucky</span>
							</a>
						</li>
						<li>
							<a href="#">
								<span class="title">Lukluk</span>
							</a>
						</li>
						<li>
							<a href="#">
								<span class="title">KFC</span>
							</a>
						</li>
					</ul>
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
								<i class="entypo-pencil"></i>
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
			
			
		</div>
				
		<!-- Footer -->
		<footer class="main">
			&copy; 2016 <strong>KHMAEY</strong> Admin Theme by SRGroup2
		</footer>
	
	</div><!-- end main content -->
</div>

	<!-- Bottom scripts (common) -->
	<script src="${pageContext.request.contextPath}/resources/assets/js/gsap/main-gsap.js"></script>
	<script src="${pageContext.request.contextPath}/resources/assets/js/jquery-ui/js/jquery-ui-1.10.3.minimal.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/assets/js/bootstrap.js"></script>
	
	<script src="${pageContext.request.contextPath}/resources/assets/js/resizeable.js"></script>
	<script src="${pageContext.request.contextPath}/resources/assets/js/neon-api.js"></script>
	<script src="${pageContext.request.contextPath}/resources/assets/js/jvectormap/jquery-jvectormap-1.2.2.min.js"></script>

	<!-- JavaScripts initializations and stuff -->
	<script src="${pageContext.request.contextPath}/resources/assets/js/neon-custom.js"></script>

	
	

</body>
</html>