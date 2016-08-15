<section class="add_restaurant" ng-controller="restCtrl">
	<h2>Add Restaurant</h2>
	<br />
	<div class="row">
		<div class="col-md-12">
			
			<div class="panel panel-primary" data-collapsed="0">
			
				<div class="panel-heading">
					<div class="panel-title">
						Fill Restaurant Information
					</div>
					
					<div class="panel-options">
						<a href="#sample-modal" data-toggle="modal" data-target="#sample-modal-dialog-1" class="bg"><i class="entypo-cog"></i></a>
						<a href="#" data-rel="collapse"><i class="entypo-down-open"></i></a>
						<a href="#" data-rel="reload"><i class="entypo-arrows-ccw"></i></a>
						<a href="#" data-rel="close"><i class="entypo-cancel"></i></a>
					</div>
				</div>
				<div class="panel-body">
					<!--  ======== Form Add Restaurant ============= -->
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
									<option ng-repeat="restype in restypes" 
										value="{{restype.restype_id}}">
										{{restype.restype_name}}
									</option>
								</select>
						</div>
						
						<div class="form-group">
								<label>Multi-Select List</label>
								
								<div class="col-sm-7">
									<select multiple="multiple" name="my-select[]" class="form-control multi-select">
										<option value="elem_1">elem 1</option>
										<option value="elem_2">elem 2</option>
										<option value="elem_3">elem 3</option>
										<option value="elem_4">elem 4</option>
										<option value="elem_5">elem 5</option>
										<option value="elem_6">elem 6</option>
										<option value="elem_7">elem 7</option>
										<option value="elem_8" selected>Selected element</option>
										<option value="elem_9" selected>Selected element 2</option>
									</select>
								</div>
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
							<a href="${pageContext.request.contextPath}/admin/restaurant" target="_self"">
							<button type="button" class="btn btn-primary" ng-disabled="commentInfo.first_name.$invalid || brandInfo.last_name.$invalid ||brandInfo.rest_name.$invalid || brandInfo.comment.$invalid" ng-click="addRestaurant()" data-dismiss="modal">
								<i class="fa fa-floppy-o"> Add Restaurant</i></button></a>
						</div>
					   </div> 
					</form>
				</div><!-- ==============  end Panel ===================== -->
			</div>
		</div><!-- ==============  end col-md-12 ===================== -->
	</div>
</section>