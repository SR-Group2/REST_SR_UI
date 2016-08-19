<div ng-controller="categoryCtrl">
<div class="col-md-12">	
	<div class="well">
		<h2 class="">CATEGORY</h2>
	</div>
<div class="frmadd">
	<!-- =========== Panel ========== -->	
	<div class="card card-outline-secondary">
		<div class="card-header">
			<h3 class="card-title">CATEGORY INFORMATION</h3>
		</div>
			<div class="panel-body">
				<fieldset>
			<div class="panel-body">
				
					<div class="row">
						<div class="col-md-12">
						<form name="categoryInfo">
								<div class="form-group row">
									<label for="contact" class="form-control-label col-sm-3 text-sm-center">Restaurant Name</label>
									<div class="col-sm-9">
										<select class="form-control" name="rest_name" ng-model="$parent.rest_id" required 
									      ng-options="restaurant.rest_id as restaurant.rest_name for restaurant in restaurants">
											<option value="">--- Select Restaurant ---</option>
									      </select>
									</div>
								</div>
								<div class="form-group row">
									<label for="brand_name" class="form-control-label col-sm-3 text-sm-center">Brand Name</label>
									<div class="col-sm-9">
										<input type="text" class="form-control" name="brand_name" ng-model="$parent.brand_name" placeholder="Brand Name" required>
									</div>
								</div>
								<div class="form-group row">
									<label for="contact" class="form-control-label col-sm-3 text-sm-center">Contact Number</label>
									<div class="col-sm-9">
										<input type="text" class="form-control" name="contact" ng-model="$parent.contact" placeholder="Contact Number" required>
									</div>
								</div>
								<div class="form-group row">
									<label for="contact" class="form-control-label col-sm-3 text-sm-center">Street Number</label>
									<div class="col-sm-9">
									<select class="form-control" name="street" ng-model="$parent.street" required 
									      ng-options="address.street as address.street for address in addresses">
											<option value="">--- Select Street ---</option>
									 </select>
									</div>
								</div>
								<div class="form-group row">
									<label for="address_id" class="form-control-label col-sm-3 text-sm-center">District</label>
									<div class="col-sm-9">
										<select class="form-control" name="district" ng-model="$parent.district" required 
									      ng-options="address.district as address.district for address in addresses">
											<option value="">--- Select District ---</option>
									 	</select>
									</div>
								</div>
								<div class="form-group row">
									<label for="address_id" class="form-control-label col-sm-3 text-sm-center">Communce</label>
									<div class="col-sm-9">
										<select class="form-control" name="communce" ng-model="$parent.communce" required 
									      ng-options="address.communce as address.communce for address in addresses">
											<option value="">--- Select Communce ---</option>
									 	</select>
									</div>
								</div>
								<div class="form-group row">
									<label for="address_id" class="form-control-label col-sm-3 text-sm-center">Province</label>
									<div class="col-sm-9">
										<select class="form-control" name="province" ng-model="$parent.province" required 
									      ng-options="address.province as address.province for address in addresses">
											<option value="">--- Select Province ---</option>
									 	</select>
									</div>
								</div>
								<div class="form-group row">
									<div class="col-sm-offset-3 col-sm-10">
										<a href="${pageContext.request.contextPath}/admin/brand" target="_self"><button type="button" class="btn btn-green" ng-click="addBrand($event)" data-dismiss="modal">
										<i class="fa fa-plus" aria-hidden="true"> Add New Brand</i></button>
										<button type="button" class="btn btn-green" data-dismiss="modal">
										<i class="fa fa-eye" aria-hidden="true"> View Brand</i></button></a>
									</div>
								</div>
							</form> 
 						</div>
						</div>
						</div>
					</fieldset>
				</div>
		</div>
		
	<!-- =========== End Panel ========== -->	
	</div>
	</div>
</div>