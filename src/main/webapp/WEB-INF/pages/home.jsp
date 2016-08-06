<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>NHAM EY Welcome </title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/style.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/font-awesome.min.css">

</head>
<body>
	<!-- ======== Navigation ==========  -->
	<nav class="navbar navbar-light bg-faded" style="background-color: #ffffff;">
		<div class="container">
				 <a href="#"><img class="navbar-brand img-fluid logo" src="${pageContext.request.contextPath}/resources/images/logo.png"></a>	
			  <div class="menu">
				  <ul class="nav navbar-nav pull-md-right">
				    <li class="nav-item">
				      <a class="nav-link" href="#">ចូលប្រើ</a>
				    </li>
				    <li class="nav-item">
				      <a class="nav-link" href="#">បង្កើតគណនី</a>
				    </li>
				  </ul>
			  </div>
		</div> 
	</nav>
	<!-- Slide show -->
	<section class="slideShow">
		<div class="container">
			<div id="sponsor" class="carousel slide" data-ride="carousel">
			  <ol class="carousel-indicators">
			    <li data-target="#sponsor" data-slide-to="0" class="active"></li>
			    <li data-target="#sponsor" data-slide-to="1"></li>
			    <li data-target="#sponsor" data-slide-to="2"></li>
			  </ol>
			  <div class="carousel-inner" role="listbox">
			    <div class="carousel-item active">
			      <img src="${pageContext.request.contextPath}/resources/images/sponsors/sponsor_01.jpg" alt="First slide" class="img-fluid img-rounded">
			    </div>
			    <div class="carousel-item">
			      <img src="${pageContext.request.contextPath}/resources/images/sponsors/sponsor_01.jpg" alt="Second slide" class="img-fluid img-rounded">
			    </div>
			    <div class="carousel-item">
			      <img src="${pageContext.request.contextPath}/resources/images/sponsors/sponsor_01.jpg" alt="Third slide" class="img-fluid img-rounded">
			    </div>
			  </div>
			  <a class="left carousel-control" href="#sponsor" role="button" data-slide="prev">
			    <span class="icon-prev" aria-hidden="true"></span>
			    <span class="sr-only">Previous</span>
			  </a>
			  <a class="right carousel-control" href="#sponsor" role="button" data-slide="next">
			    <span class="icon-next" aria-hidden="true"></span>
			    <span class="sr-only">Next</span>
			  </a>
			</div>
		</div>
	</section>
	<!--  Search Section -->
	<section>
		<div class="container search">
			<div class="text-md-center ">
				 <form class="">
				  <div class="form-group">
				    <div class="input-group">
				      <input type="text" class="form-control" id="keyword" placeholder="search by category .....">
				      <div class="input-group-addon">
				      	<button type="submit" class=""><i class="fa fa-search"></i></button>
				      </div>
				    </div>
				  </div>
				  
				</form>
	 		 </div>
 		 </div>
	</section>
	<!-- ======== Category Content ========= -->
	<section class="content">
		<div class="container">
			<div class="row">
				<div class="col-md-3 col-sm-4 col-xs-6">
						<div class="box-img">
							<h2>ភីស្សា</h2>
							<h4>Pizza</h4>
							<a href="#category1" ><img class="img-fluid" alt="" src="${pageContext.request.contextPath}/resources/images/pizza-png-23.png"></a>
						</div>

				</div>
				
				<div class="col-md-3 col-sm-4 col-xs-6">
					<div class="box-img">
						<h2>ភីស្សា</h2>
						<h4>Pizza</h4>
						<a href="##category2" ><img class="img-fluid" alt="" src="${pageContext.request.contextPath}/resources/images/pizza-png-23.png"></a>
					</div>
				</div>
				<div class="col-md-3 col-sm-4 col-xs-6">
					<div class="box-img">
						<h2>ភីស្សា</h2>
						<h4>Pizza</h4>
						<a href="##category3" ><img class="img-fluid" alt="" src="${pageContext.request.contextPath}/resources/images/pizza-png-23.png"></a>
					</div>
				</div>
				<div class="col-md-3 col-sm-4 col-xs-6">
					<div class="box-img">
						<h2>ភីស្សា</h2>
						<h4>Pizza</h4>
						<a href="##category4" ><img class="img-fluid" alt="" src="${pageContext.request.contextPath}/resources/images/pizza-png-23.png"></a>
					</div>
				</div>
			</div><!-- end row -->
			<div class="row">
				<div class="col-md-3 col-sm-4 col-xs-6">
						<div class="box-img">
							<h2>ភីស្សា</h2>
							<h4>Pizza</h4>
							<a href="#" ><img class="img-fluid" alt="" src="${pageContext.request.contextPath}/resources/images/pizza-png-23.png"></a>
						</div>
				</div>
				
				<div class="col-md-3 col-sm-4 col-xs-6">
					<div class="box-img">
						<h2>ភីស្សា</h2>
						<h4>Pizza</h4>
						<a href="#" ><img class="img-fluid" alt="" src="${pageContext.request.contextPath}/resources/images/pizza-png-23.png"></a>
					</div>
				</div>
				<div class="col-md-3 col-sm-4 col-xs-6">
					<div class="box-img">
						<h2>ភីស្សា</h2>
						<h4>Pizza</h4>
						<a href="#" ><img class="img-fluid" alt="" src="${pageContext.request.contextPath}/resources/images/pizza-png-23.png"></a>
					</div>
				</div>
				<div class="col-md-3 col-sm-4 col-xs-6">
					<div class="box-img">
						<h2>ភីស្សា</h2>
						<h4>Pizza</h4>
						<a href="#" ><img class="img-fluid" alt="" src="${pageContext.request.contextPath}/resources/images/pizza-png-23.png"></a>
					</div>
				</div>
			</div><!-- end row 2 -->
			
		</div>
	</section>
	
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
	<script src="${pageContext.request.contextPath}/resources/scripts/bootstrap.min.js"></script>
</body>
</html>