<div ng-controller="RestaurantCtrl">

				<div class="well">
					<button type="button" class="btn btn-success" data-toggle="modal" data-target="#addRestaurant" ng-click="clearInput()">
					<i class="fa fa-plus-square-o"></i> Add New Restaurant</button>
				</div>
				<table class="table table-striped">
					<thead class="thead-default">
						<tr>
							<th>ID</th>
							<th>RestName</th>
							<th>RestType</th>
							<th>Contact</th>
							<th>About</th>
							<th>Open/Close</th>
							<th>Location</th>
							<th>Action</th>
							
						</tr>
					</thead>
					<tbody>
						<tr ng-repeat=" rest in restaurants | limitTo: 8">
							<td>{{rest.rest_id}}</td>
							<td>{{rest.rest_name}}</td>
							<td>{{rest.restypes}}</td>
							<td>{{rest.contact}}</td>
							<td>{{rest.about}}</td>
							<td>{{rest.open_close}}</td>
							<td>{{rest.location}}</td>
							<td>
								<button type="button" class="btn btn-success" data-toggle="modal" data-target="#btnUpdate" ng-click=""><i class="fa fa-pencil-square-o"></i>Update</button> 
								<button type="button" class="btn btn-danger" ng-click="deleteRestaurant(rest.rest_id)"><i class="fa fa-trash-o"></i>Delete</button>
							</td>
							
						</tr>
					</tbody>
				
				</table>
				
				<!-- ================== Modal Add Restaurant ================= -->
			<div class="modal fade" id="addRestaurant" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
		  <div class="modal-dialog" role="document">
		    <div class="modal-content">
		      <div class="modal-header">
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
		        <h4 class="modal-title" id="myModalLabel">Operation</h4>
		      </div>
		      <div class="modal-body">
		        <form class="form-horizontal" name="frmRestaurant" id="frmUser">
					  <div class="form-group">
					    <label for="txtname" class="col-sm-2 control-label">Restaurant Name</label>
					    <div class="col-sm-10">
					      <input type="text" class="form-control" ng-model="txtrestname" name="restname" placeholder="" required>
					    </div>
					  </div>
					  
					  <div class="form-group">
					    <label for="" class="col-sm-2 control-label">Rest Type</label>
					    <div class="col-sm-10">
					      <select class="form-control" ng-model="restype" ng-change="getType(restype)">
					      		<option value="1" selected>Fast Food</option>
					      		<option value="2">Khmer Food</option>
					      		<option value="3">Thai food</option>
					      </select>
					    </div>
					  </div>
					  
					  <div class="form-group">
					    <label for="txtage" class="col-sm-2 control-label">Contact</label>
					    <div class="col-sm-10">
					      <input type="text" class="form-control" ng-model="txtcontact" name="contact" placeholder=""  required>
					    </div>
					  </div>
					  <div class="form-group">
					    <label for="txtage" class="col-sm-2 control-label">About</label>
					    <div class="col-sm-10">
					       <textarea class="form-control" id="message-text" ng-model="txtabout"></textarea>
					    </div>
					  </div>
					   <div class="form-group">
					    <label for="" class="col-sm-2 control-label">Open/Close</label>
					    <div class="col-sm-10">
					      <select class="form-control" ng-model="time" ng-change="getTime(time)">
					      		<option value="1" selected>6:00AM-5:00PM</option>
					      		<option value="2">6:00AM-5:00PM</option>
					      		<option value="3">6:00AM-5:00PM</option>
					      </select>
					    </div>
					  </div>
					  
					  <div class="form-group">
					    <div class="col-sm-offset-2 col-sm-10">
					      <input type="button" class="btn btn-success" ng-click="addRestaurant()" value="Submit" data-dismiss="modal"  >
					    </div>
					  </div>
				</form>
		      </div>
		    </div>
		  </div>
		</div>
		<!-- ================== End Modal Add  Restaurant ================= -->
				
				
				
				
</div>