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
						<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/logout">ចាកចេញ</a>
						</li>
					</sec:authorize>
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
							<h2>ស្វែងរក:</h2>
								<form>
								  <div class="form-group" id="remote">
								   	 <div class="input-group">
								   	 	   <div class="input-group-addon" id="btnsearch">
									      	<button type="submit" class=""><i class="fa fa-search"></i></button>
									      </div>
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
									<h5>តម្លៃ : <output id="rangevalue"></output>$</h5>
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
					
						
					</div>
					<!-- ========= Pagination ============ -->
						<section class="cotainer text-xs-center">
							<nav id="pagination"  class="pagination"></nav>
						</section> 
						<!-- end pagination -->
						
				</div><!-- ======== col-md-9 -->
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
	<!-- ========= footer ============ -->
	<script
		src="${pageContext.request.contextPath}/resources/scripts/jquery-2.1.4.min.js"></script>
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
    
  
   <!--  ================ JQuery Template ======== -->
	<script id="rest_tmpl" type="text/x-jquery-tmpl">
		<div class="col-md-4">
			<div class="list-box" onclick="detailRest({{= rest_id}})">
				<div>
					<img class="img-fluid" src="${pageContext.request.contextPath}/resources/images/Burger-PNG-Image.png">
				</div>
				<div class="list-des">
					<h4>{{= rest_name }}</h4>
					<i class="fa fa-star text-warning"></i>
					<i class="fa fa-star text-warning"></i>
					<i class="fa fa-star text-warning"></i>
					<i class="fa fa-star text-secondary"></i>
					<i class="fa fa-star text-secondary"></i>
					<p>{{= about}}</p>
				</div>
			</div>
		</div>
	</script>
	
	<script>
	
	function detailRest(id){
		
		window.location.href = "${pageContext.request.contextPath}/detail_rest/"+id;
	}
	
	$(function(){
		
		var id = window.location.href.substring(window.location.href.lastIndexOf('/') + 1);
		
		/* =======================  Load Data With Pagination ================== */
		restaurant = {};
		currentPage = 1;
		var check = true;

		restaurant.getRest = function(currentPage, id) {
			
			$.ajax({
				url : "${pageContext.request.contextPath}/rest/restaurant/list/"+id+"?page="+currentPage+"&limit=1",
				type : 'GET',
				beforeSend : function(xhr) {
					xhr.setRequestHeader("Accept",
							"application/json");
					xhr.setRequestHeader("Content-Type",
							"application/json");
				},
				success : function(data) {

					if (data.STATUS != false) {
						console.log(data);
						$("#getRest").empty();
						$("#rest_tmpl").tmpl(data.DATA).appendTo(
								"#getRest");
						$('#getRest').css("cursor", "pointer");
						if (check) {
							restaurant.setPagination(
									data.PAGINATION.TOTAL_PAGES,
									currentPage);
							check = false;
						}
						$("#pagination").show()
					} else {
						$("#pagination").hide();
						$("#getRest").empty();
					}
				}
			});
		};

		restaurant.setPagination = function(totalPage, currentPage) {

			$('#pagination').bootpag({
				total : totalPage,
				page : currentPage,
				maxVisible : 10,
				leaps : true,
				firstLastUse : true,
				first : '←',
				last : '→',
				wrapClass : 'pagination',
				activeClass : 'active',
				disabledClass : 'disabled',
				nextClass : 'next',
				prevClass : 'prev',
				lastClass : 'last',
				firstClass : 'first'
			}).on("page", function(event, currentPage) {
				check = false;
				restaurant.getRest(currentPage,id);

			});

			$('#pagination .bootpag li').addClass("page-item");
			$('#pagination .bootpag li a').addClass("page-link");

		};
		
		/* ================= Run First Load With Click Id ==================*/
		restaurant.getRest(currentPage, id);
		/* =======================   Load Data Acording to typehead select  With Pagination ================== */
		$('#keyword').on('typeahead:selected', function(){ 
			$("#getRest").empty();
			var keyword = $(this).val();
			check = true;
			$.ajax({ 
			    url:"${pageContext.request.contextPath}/rest/restype?keyword="+keyword+"&page="+currentPage+"&limit=4", 
			    type: 'GET',
			    beforeSend: function(xhr) {
                    xhr.setRequestHeader("Accept", "application/json");
                    xhr.setRequestHeader("Content-Type", "application/json");
                },
			    success: function(data) { 
			    	
			    	id = data.DATA[0].restype_id;
			    	restaurant.getRest(currentPage, id);
			    	
			    }
   			});
		});
	
		// ==================== Get Restaurant Type ============================
	
		var substringMatcher = function(strs) {
			  return function findMatches(q, cb) {
			    var matches, substringRegex;
			    matches = [];
			    substrRegex = new RegExp(q, 'i');

			    $.each(strs, function(i, str) {
			      if (substrRegex.test(str)) {
			        matches.push(str);
			      }
			    });

			    cb(matches);
			  };
			};
			
			
			var states;
			
			var bestPictures = new Bloodhound({
				  datumTokenizer: Bloodhound.tokenizers.obj.whitespace('value'),
				  queryTokenizer: Bloodhound.tokenizers.whitespace,
				  remote: {
				        url: "${pageContext.request.contextPath}/rest/restype?keyword=%QUERY"+"&page="+currentPage+"&limit=4",
				        wildcard: '%QUERY',
				        filter: function (restypes) {
				            return $.map(restypes.DATA, function (restype) {
				                return {
				                      
				                        value: restype.restype_name
				                };
				            });
				        }
				    }
				});
		
				$('#remote .typeahead').typeahead(null, {
				  	name: 'best-pictures',
				  	display: 'value',
				  	source: bestPictures
				});
				

		});
	</script>
</body>
</html>		
