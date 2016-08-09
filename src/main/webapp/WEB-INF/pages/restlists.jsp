<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/style.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/restlist.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/font-awesome.min.css">
<script src="${pageContext.request.contextPath}/resources/scripts/jquery-2.1.4.min.js"></script>

<style>

</style>
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
		
	<section class="rest-list">
		<div class="container">
			<div class="row">
				<div class="col-md-3">
					<div class="row">
						<div class="box-filter">
							<h2>SEARCH:</h2>
								<form>
								  <div class="form-group">
								      <input type="text" class="form-control" id="keyword" placeholder="I want to eat..." 
								      style="background-color:#339524;color: #ffffff;">
								  </div>						 
								</form>
						</div>
					</div><!-- end row -->
				
					<div class="row">
						<div class="box-sort">
								<h2>SORTING:</h2>
								<form >
									<div class="form-group">
								        <select class="form-control input-lg">
								          <option selected>Food</option>
										  <option value="1">One</option>
										  <option value="2">Two</option>
										  <option value="3">Three</option>
								        </select>
								        <i class="fa fa-chevron-down"></i>							        
								      </div>
									<h5>PRICE : <output id="rangevalue"></output>$</h5>
									<!-- end option sort -->
									<!-- range-slider -->
									<div class="range-slider">
									  <input class="range-slider" type="range" value="100" min="0" max="100" onchange="rangevalue.value=value"/>
									  
									</div>
									<!-- end rang-slider -->
									
									<div class="form-group radio-btn">
									<label class="custom-control custom-radio">
									  <input id="radio1" name="radio" type="radio" class="custom-control-input">
									  <span class="custom-control-indicator"></span>
									  <span class="custom-control-description">PHOTOS</span>
									</label>
									
									</div>
									
									<!-- check box option -->
									<div class="check-option">
										<div class="check-box">
											<label class="custom-control custom-checkbox">
											  <input type="checkbox" class="custom-control-input">
											  <span class="custom-control-indicator"></span>
											  <span class="custom-control-description">Hot Food</span>
											</label>
										</div>
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
										<button type="button" class="btn btn-search">SEARCH</button>
									</div>
									<!-- end check box option -->
								</form>	
							</div>
					</div><!-- end row -->
				</div>
				
				<div class="col-md-9">
					<div class="row" id="getRest">
						
						<!-- ========= Pagination ============ -->
						<section class="cotainer text-xs-center">
							<nav id="pagination"  class="pagination"></nav>
						</section> 
						
						<!-- end pagination -->
					</div>	
				</div>
		</div>
	</section>	
	
	
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
	<script src="${pageContext.request.contextPath}/resources/assets/js/bootstrap.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/scripts/jquery.tmpl.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/scripts/jquery.bpopup.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/scripts/jquery.bootpag.min.js"></script>
    
     
	<script id="rest_tmpl" type="text/x-jquery-tmpl">
		<div class="col-md-4">
			<div class="list-box">
				<div>
					<a href="#"><img class="img-fluid" src="${pageContext.request.contextPath}/resources/images/Burger-PNG-Image.png"></img></a>
				</div>
				<div class="list-des">
					<h4>{{= rest_name }}</h4>
					<i class="fa fa-star text-warning"></i>
					<i class="fa fa-star text-warning"></i>
					<i class="fa fa-star text-warning"></i>
					<i class="fa fa-star text-secondary"></i>
					<i class="fa fa-star text-secondary"></i>
					<p>text food description here</p>
				</div>
			</div>
		</div>
	</script>

	<script>
	
	$(function(){
		
		
   		/* =======================  Pagination ================== */
		restaurant = {};
		var currentPage = 1;
		var check = true;
		var keyword = "";
		
		var id = window.location.href.substring(window.location.href.lastIndexOf('/') + 1);
		var URLREST =  "${pageContext.request.contextPath}/rest/restype?keyword="+keyword+"&page="+currentPage+"&limit=4";
		var URLRESTYPE = "${pageContext.request.contextPath}/rest/restaurant/"+id;
		
		$.ajax({ 
		    url: URLRESTYPE, 
		    type: 'GET',
		    beforeSend: function(xhr) {
                xhr.setRequestHeader("Accept", "application/json");
                xhr.setRequestHeader("Content-Type", "application/json");
            },
		    success: function(data) { 
		    	
		    	console.log(data);
		    	
		    	if(data.STATUS != false){
		    		$("#getRest").empty();
		    		$("#rest_tmpl").tmpl(data.DATA).appendTo("#getRest");
		    		$('#getRest').css("cursor", "pointer");
					if(check){
						//restaurant.setPagination(data.PAGINATION.TOTAL_PAGES,currentPage);
				    	 check=false;
				    } 
		    	}else{
					
		    		$("#getRest").empty();
		    	}
		    }
		});
		
		/*
		$('#keyword').on("keyup", function(e){
			e.preventDefault();
			
			keyword = $(this).val();
			
			restaurant.getRest(currentPage,keyword);
			
		});
		*/
		
		restaurant.getRest = function(currentPage, keyword){
    		if(keyword == undefined){
    			keyword = "";
    		}
   			$.ajax({ 
			    url: URLREST, 
			    type: 'GET',
			    beforeSend: function(xhr) {
                    xhr.setRequestHeader("Accept", "application/json");
                    xhr.setRequestHeader("Content-Type", "application/json");
                },
			    success: function(data) { 
			    	
			    	console.log(data);
			    	
			    	if(data.STATUS != false){
			    		$("#getRest").empty();
			    		$("#rest_tmpl").tmpl(data.DATA).appendTo("#getRest");
			    		$('#getRest').css("cursor", "pointer");
						if(check){
							//restaurant.setPagination(data.PAGINATION.TOTAL_PAGES,currentPage);
					    	 check=false;
					    } 
			    	}else{
						
			    		$("#getRest").empty();
			    	}
			    }
   			});
   		};
		
   		restaurant.setPagination = function(totalPage, currentPage){
	    	
			$('#pagination').bootpag({
		        total: totalPage,
		        page: currentPage,
		        maxVisible: 10,
		        leaps: true,
		        firstLastUse: true,
		        first: '←',
		        last: '→',
		        wrapClass: 'pagination',
		        activeClass: 'active',
		        disabledClass: 'disabled',
		        nextClass: 'next',
		        prevClass: 'prev',
		        lastClass: 'last',
		        firstClass: 'first'
		    }).on("page", function(event, currentPage){
		    	check = false;
		    	restaurant.getRest(currentPage);

	   		 });
			
			 $('#pagination .bootpag li').addClass("page-item");
			 $('#pagination .bootpag li a').addClass("page-link");
	    	
		}; 
		 
		
	/* 	restaurant.getRest(currentPage, ""); */
		 
		
	});
	</script>
</body>
</html>		
