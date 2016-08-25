<section class="add_restaurant"  ng-controller="restUpdateCtrl">

	<form name="frmAddRest" id="frmAddRest">
	<div class="row">
		<div class="col-md-12">
			
			
			<div class="panel panel-primary" data-collapsed="0">
			
				<div class="panel-heading">
					<div class="panel-title">
						<h3>Restaurant Information</h3> 
					</div>
				</div>
				<div class="panel-body with-table">
					
					
					<table class="table ">
					<tbody>
						<tr>
							<td>Restaurant Name:</td>
							<td>{{restaurant.rest_name}}</td>
						</tr>
						<tr>
							<td>Owner:</td>
							<td ng-bind-template="{{restaurant.user.last_name}}  {{restaurant.user.first_name}}"></td>
						</tr>
						<tr>
							<td>Contact:</td>
							<td>{{restaurant.contact}}</td>
						</tr>	
						<tr>
							<th>About:</th>
							<td>{{restaurant.about}}</td>
							
						</tr>
						<tr>
							<td>Open - Close:</td>
							<td>{{restaurant.open_close | date: "yyyy-MM-dd"}}</td>
						</tr>
						<tr>
							<td>Place:</td>
							<td> Street {{restaurant.address.street}}  {{restaurant.address.communce}} {{restaurant.address.district}}  {{restaurant.address.province}}</td>
						</tr>		
					
					</tbody>				
				</table>
				</div><!-- ==============  end Panel ===================== -->				
			</div>
			
			<div class="panel panel-primary" data-collapsed="0"" >
					<div class="panel-body with-table">
					<div class="panel-heading">
						<div class="panel-title">
							<h3>Restaurant Type</h3> 
						</div>
					</div>
						<table class="table table-bordered table-responsive">
						<thead class="thead-inverse">
							<tr>
								<th>Restaurant Name </th>
								<th>Restaurant Name Khmer </th>
							</tr>
						</thead>
						<tbody>
							<tr ng-repeat="rest_type in restaurant.restype">
								<td>	{{rest_type.restype_name}}</td>
								<td>	{{rest_type.restype_name_kh}}</td>
							</tr>
						</tbody>
				
					 </table>
				</div><!-- ==============  end Panel ===================== -->
			
			</div>
			
			<div class="panel panel-primary" data-collapsed="0"" >
				
					<div class="panel-heading">
						<div class="panel-title">
							<h3>Restaurant Picture</h3>
						</div>
					</div>
					<div class="panel-body">
						<div class="col-sm-2 col-xs-4 __web-inspector-hide-shortcut__" data-tag="1d" ng-repeat="rest in restaurant.restpictures" style="margin-bottom:20px;">						
							<article class="image-thumb">
									<img class="img-fluid" src="http://localhost:9999{{rest.path_name}}" width="200" height="200" style="border:2px solid #ABB2B9;     border-radius: 5px;">
							</article>
						</div>
				</div><!-- ==============  end Panel ===================== -->
			</div>
		 <div class="panel panel-primary" data-collapsed="0"" >
					<div class="panel-heading">
						<div class="panel-title">
							<h3>Restaurant Picture</h3>
						</div>
					</div>
					<div class="panel-body">
						<div class="col-sm-2 col-xs-4 __web-inspector-hide-shortcut__" data-tag="1d" ng-repeat="category in restaurant.categories" style="margin-bottom:20px;">						
							<article class="image-thumb">
									<img class="img-fluid" src="http://localhost:9999{{category.url}}" width="200" height="200" style="border:2px solid #ABB2B9;     border-radius: 5px;">
							</article>
						</div>
				
					</div>
					
		</div>
    	</div><!-- ==============  end col-md-12 ===================== -->
	</div><!-- ==============  end row ===================== -->
</form>
</section>