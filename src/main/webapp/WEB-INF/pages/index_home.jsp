<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html ng-app="app" >
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>NHAM EY Welcome </title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/style.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/screen.css">

</head>
<body ng-controller="mainCtrl">
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
			<div class="text-md-center row">
				<div class="offset-sm-3 col-sm-6">
					 <form class="">
					  <div class="form-group">
					    <div class="input-group">
					      <input type="text" class="form-control" id="keyword" placeholder="search by category .....">
					      <div class="input-group-addon" id="btnsearch">
					      	<button type="submit" class=""><i class="fa fa-search"></i></button>
					      </div>
					    </div>
					  </div>
					</form>
				</div>
	 		</div>
 		 </div>
	</section>
	<!-- ======== Category Content ========= -->
	<section class="category">
		<div class="container">
			<div class="card">
			  <div class="card-header bg-success">
			  	 Popular Category
			  </div>
			  <div class="card-block">
			   	<div class="row" id="getRest">				
					
				</div><!-- end row 2 -->		    
			  </div>
			</div>
			
			
		</div><!-- end container -->
	</section><!--  end Category -->
	
	<!-- ========= Pagination ============ -->
	<section class="cotainer text-xs-center">
		<nav id="pagination"  class="pagination"></nav>
	</section> 
    
	<!-- ========= footer ============ -->
	<footer class="">
		<div class="container">
			<p>Copy Right 2016. All right reserved.</p>
		</div>
	</footer>
	
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
	<script src="${pageContext.request.contextPath}/resources/scripts/jquery-2.1.4.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/assets/js/bootstrap.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/scripts/jquery.tmpl.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/scripts/jquery.bpopup.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/scripts/jquery.bootpag.min.js"></script>
    
    
    
	<script id="rest_tmpl" type="text/x-jquery-tmpl">
		<div class="col-md-3 col-xs-6">
			<div class="box-img" onclick="detailRest({{= restype_id }})">
				<h2>{{= restype_name_kh }}</h2>
				<h4 class="text-capitalize">{{= restype_name }}</h4>
				<a href="#"><img class="img-fluid" alt="" src="/resources/images/pizza-png-23.png"></a>
			</div>
		</div>
	</script>
	
	
	<script>
	
		function detailRest(id){
			window.location.href = "${pageContext.request.contextPath}/rest_lists/"+id;
		}

        $(function(){
        	
        	
        	
			/* =======================  Pagination ================== */
        		course = {};
        		currentPage = 1;
        		var check = true;
        		var keyword = "";
        		
        		$('#btnsearch').on("click", function(e){
        			e.preventDefault();
        			
        			keyword = $('#keyword').val();
        			
        			course.courses(currentPage,keyword);
        		});
        		
	        	course.courses = function(currentPage, keyword){
	        		if(keyword == undefined){
	        			keyword = "";
	        		}
	       			$.ajax({ 
	    			    url:"${pageContext.request.contextPath}/rest/restype?keyword="+keyword+"&page="+currentPage+"&limit=4", 
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
	    							 course.setPagination(data.PAGINATION.TOTAL_PAGES,currentPage);
	    					    	 check=false;
	    					    } 
	    			    	}else{
	    						
	    			    		$("#getRest").empty();
	    			    	}
	    			    }
	       			});
	       		};
        		
        		course.setPagination = function(totalPage, currentPage){
			    	
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
				    	course.courses(currentPage);
		
			   		 });
        			
        			 $('#pagination .bootpag li').addClass("page-item");
        			 $('#pagination .bootpag li a').addClass("page-link");
			    	
				}; 
				 
				
				course.courses(currentPage, "");
				 
				
        });
        
        
	</script>
	
    
</body>
</html>