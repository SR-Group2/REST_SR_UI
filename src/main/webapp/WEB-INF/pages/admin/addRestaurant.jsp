<div ng-controller="restaurantCtrl">
	<div ng-controller="categoryCtrl">
	<div class="col-md-12">	
		<div class="well">
			<h2 class="">RESTAURANT</h2>
		</div>
	<div class="frmadd">
		<!-- =========== Panel ========== -->	
		<div class="card card-outline-secondary">
			<div class="card-header">
				<h3 class="card-title">RESTAURANT INFORMATION</h3>
			</div>
				<div class="panel-body">
					<fieldset>
						<div class="row">
							<div class="col-md-12">
							<form name="restaurantInfo">
								<div class="col-md-4">
									<div class="form-group">
										<label for="rest_name">Restaurant Name</label>
										<input type="text" class="form-control" name="rest_name" ng-model="rest_name" required>
									</div>
									<div class="form-group">
										<label for="restype_id">Restaurant Type</label>
											<select class="form-control">
												<option>-- Restaurant Category-- </option>
												<option ng-repeat="cat in category">
													{{cat.category_name}}
												</option>
											</select>
									</div>
									<div class="form-group">
										<label for="contact">Contact</label>
										<input type="text" class="form-control" name="contact" ng-model="contact" required>
									</div>
									<div class="form-group">
										<label for="about">About</label>
										<input type="text" class="form-control" name="about" ng-model="about" required>
									</div>
									<div class="form-group">
										<label for="open_close">Open - Close</label>
										<select class="form-control">
												<option>6:00 AM - 8:00 PM</option>
												<option>6:00 AM - 8:00 PM</option>
												<option>6:00 AM - 8:00 PM</option>
											</select>
									</div>
								</div> 
									<div class="col-md-4">
									<div class="form-group">
										<div class="form-group">
										<label for="open_close">Street Number</label>
										<input type="text" class="form-control" name="street" ng-model="street" required>
										</div>
										<div class="form-group">
											<label for="open_close">Communce</label>
											<input type="text" class="form-control" name="communce" ng-model="commune" required>
										</div>
										<div class="form-group">
											<label for="open_close">District</label>
											<input type="text" class="form-control" name="district" ng-model="district" required>
										</div>
										<div class="form-group">
											<label for="open_close">City/Province</label>
											<input type="text" class="form-control" name="province" ng-model="province" required>
										</div>
										<br>
										<a href="${pageContext.request.contextPath}/admin/restaurant" target="_self""><button type="button" class="btn btn-success" ng-disabled="commentInfo.first_name.$invalid || brandInfo.last_name.$invalid ||brandInfo.rest_name.$invalid || brandInfo.comment.$invalid" ng-click="addRestaurant()" data-dismiss="modal">
											<i class="fa fa-pencil" aria-hidden="true"> Add Restaurant</i></button></a>
									</div>
									   </div> 
	 							</div>
							</form>
							</div>
							</div>
						</fieldset>
					</div>
			</div>
			
		<!-- =========== End Panel ========== -->	
		</div>
	</div>
</div>