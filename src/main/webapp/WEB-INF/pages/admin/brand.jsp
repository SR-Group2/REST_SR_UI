<div ng-controller="brandCtrl">
			<div class="well">
				<button type="button" class="btn btn-success" data-toggle="modal" data-target="#btnAddBrand"><i class="fa fa-plus-square-o" ></i> Add New Brand</button>
			</div>
			<table class="table">
				<thead>
					<tr>
						<th>#</th>
						<th>Contact Number</th>
						<th>Restaurant Name</th>
						<th>Street</th>
						<th>District</th>
						<th>Communce</th>
						<th>Province</th>
						<th>Date Add</th>
						<th>Date Modify</th>
						<th>Action</th>
					</tr>
				</thead>
				<tbody ng-repeat="brand in brands">
				    <tr>
				    	<td>{{ $index+1 }}</td>
					    <td>{{ brand.contact }}</td>
					    <td>{{ brand.rest.rest_name}}</td>
					    <td>{{ brand.address.street }}</td>
					    <td>{{ brand.address.district }}</td>
					    <td>{{ brand.address.communce }}</td>
					    <td>{{ brand.address.province }}</td>
					    <td>{{ brand.date_added | date: "yyyy-MM-dd"}}</td>
					    <td>{{ brand.date_modify | date: "yyyy-MM-dd" }}</td>
					    <td>
					    <button class="btn btn-success btn-sm " ng-click="getBrandById(brand.brand_id)" data-toggle="modal" data-target="#btnUpdate"><i class="fa fa-pencil-square-o" aria-hidden="true"></i> Update</button>
					    <button class="btn btn-danger btn-sm" ng-click="deleteBrand(brand.brand_id)"><i class="fa fa-trash-o" aria-hidden="true"></i> Delete</button>
					    </td>
				    </tr>
			   </tbody>
			</table>
			<!-- Adding Brand Form -->
				  	<div class="modal fade" id="btnAddBrand" role="dialog">
				    <div class="modal-dialog">
				      <div class="modal-content">
				        <div class="modal-header">
				          <button type="button" class="close" data-dismiss="modal">&times;</button>
				          <h4 class="modal-title">Add New Brand</h4>
				        </div>
				        <div class="modal-body">
				          <div class="modal-body">
							<form name="brandInfo">
								<div class="form-group row">
									<label for="contact" class="form-control-label col-sm-3 text-sm-center">Contact</label>
									<div class="col-sm-9">
										<input type="text" class="form-control" id="contact" ng-model="contact" name="contact" placeholder="Contact" required>
									</div>
								</div>
								<div class="form-group row">
									<label for="rest_id" class="form-control-label col-sm-3 text-sm-center" >Restaurant ID</label>
									<div class="col-sm-9">
										<input type="text" class="form-control" id="rest_id" name="rest_id" ng-model="rest_id" placeholder="Restaurant ID" required>
									</div>
								</div>
								<div class="form-group row">
									<label for="address_id" class="form-control-label col-sm-3 text-sm-center" >Address ID</label>
									<div class="col-sm-9">
										<input type="text" class="form-control" id="address_id" name="address_id" ng-model="address_id" placeholder="Address ID" required>
									</div>
								</div>
								<div class="form-group row">
									<div class="col-sm-offset-3 col-sm-10">
										<button type="button" class="btn btn-success" ng-disabled="brandInfo.brand.$invalid || brandInfo.brand.$invalid " ng-click="addBrand()" data-dismiss="modal"><i class="fa fa-plus-square"> Add Brand</i></button>
									</div>
								</div>
							</form>
							</div>
				        </div>
				      </div>
				    </div>
				  </div>
				 <!-- End of Adding Brand Form -->
				<!-- Update Brand Form -->
				<div class="modal fade" id="btnUpdate" role="dialog">
				    <div class="modal-dialog">
				      <div class="modal-content">
				        <div class="modal-header">
				          <button type="button" class="close" data-dismiss="modal">&times;</button>
				          <h4 class="modal-title">Update Brand Information</h4>
				        </div>
				        <div class="modal-body">
				          <div class="modal-body">
							<form name="brandInfo">
								<div class="form-group row">
									<label for="contact" class="form-control-label col-sm-3 text-sm-center">Restaurant Name</label>
									<div class="col-sm-9">
										<input type="text" class="form-control" id="rest_name" value="{{rest_name}}" ng-model="rest_name" required>
									</div>
								</div>
								<div class="form-group row">
									<label for="contact" class="form-control-label col-sm-3 text-sm-center">Contact Number</label>
									<div class="col-sm-9">
										<input type="text" class="form-control" id="contact" value="{{contact}}" ng-model="contact" required>
									</div>
								</div>
								<div class="form-group row">
									<label for="contact" class="form-control-label col-sm-3 text-sm-center">Street</label>
									<div class="col-sm-9">
										<input type="text" class="form-control" id="street" value="{{street}}" ng-model="street">
									</div>
								</div>
								<div class="form-group row">
									<label for="address_id" class="form-control-label col-sm-3 text-sm-center">District</label>
									<div class="col-sm-9">
										<input type="text" class="form-control" id="district" value="{{district}}" ng-model="district">
									</div>
								</div>
								<div class="form-group row">
									<label for="address_id" class="form-control-label col-sm-3 text-sm-center">Communce</label>
									<div class="col-sm-9">
										<input type="text" class="form-control" id="communce" value="{{communce}}" ng-model="communce">
									</div>
								</div>
								<div class="form-group row">
									<label for="address_id" class="form-control-label col-sm-3 text-sm-center">Province</label>
									<div class="col-sm-9">
										<input type="text" class="form-control" id="province" value="{{province}}" ng-model="province">
									</div>
								</div>
								<div class="form-group row">
									<div class="col-sm-offset-3 col-sm-10">
										<button type="button" class="btn btn-success" ng-disabled="brandInfo.brand.$invalid || brandInfo.brand.$invalid " ng-click="updateBrand()" data-dismiss="modal"><i class="fa fa-pencil" aria-hidden="true"> Update</i></button>
									</div>
								</div>
							</form>
							</div>
				        </div>
				      </div>
				    </div>
				  </div>
				 <!-- End of Update Brand Form -->
</div>