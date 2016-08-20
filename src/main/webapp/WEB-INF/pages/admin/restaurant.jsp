<div ng-controller="restCtrl">
<div class="col-md-12">
	<div class="card-header">
			 		
			   <a href="${pageContext.request.contextPath}/admin/addRestaurant">
				  	<button class="btn btn-primary btn-icon" >
				  		Add New <i class="fa fa-cutlery"></i>
				  	</button>
				 </a>
			  <div class="form-group pull-md-right col-md-5">
			    <div class="input-group ">
			      <input type="text" class="form-control" ng-model="q" id="q" placeholder="search......" />
			      <div class="input-group-addon btn-blue">Search</div>
			    </div>				  
			  </div>
		</div>
	<div class="card card-outline-secondary">
		<div class="card-header">
			<!-- <h3 class="card-title">Restaurant Information</h3> -->
		</div>
				<table class="table table-striped">
					<thead class="thead-inverse">
						<tr>
							<th>ID</th>
							<th>Restaurant Name</th>
							<!-- <th>Restaurant Type</th> -->
							<!-- <th>Menu</th> -->
							<th>Owner</th>
							<th>Contact</th>
							<!-- <th>About</th>
							<th>Open - Close</th> -->
							<!-- <th>Location</th>
							<th>Street</th>
							<th>Communce</th>
							<th>District</th> -->
							<th>Province</th>
							<th>Action</th>
						</tr>
					</thead>
					<tbody>
						<tr ng-repeat="restaurant in restaurants | filter:q">
							<td>{{$index+1}}</td>
							<td>{{restaurant.rest_name}}</td>
							<!-- <td>
								<select>
									<option>-- Restaurant Category-- </option>
									<option ng-repeat="rest_type in restaurant.restype">
										{{rest_type.restype_name}}
									</option>
								</select>
							</td> -->
							<!-- <td>
								<select>
									<option>-- Restaurant Menu-- </option>
									<option ng-repeat="category in restaurant.categories">
										{{category.url}}
									</option>
								</select>
							</td> -->
							<td ng-bind-template="{{restaurant.user.last_name}}  {{restaurant.user.first_name}}"></td>
							<td>{{restaurant.contact}}</td>
							<!-- <td>{{restaurant.about}}</td> -->
							<!-- <td>{{restaurant.open_close | date: "yyyy-MM-dd"}}</td>
							<td>{{restaurant.location}}</td>
							<td>{{restaurant.address.street}}</td>
							<td>{{restaurant.address.communce}}</td>
							<td>{{restaurant.address.district}}</td> -->
							<td>{{restaurant.address.province}}</td>
							<td>
								<button type="button" class="btn btn-blue btn-icon icon-left" ng-click="detailRestaurant(restaurant.rest_id)">
								<i class="entypo-info"></i> Details</button>
								<a href="${pageContext.request.contextPath}/admin/restaurant/{{restaurant.rest_id}}">
								<button type="button" class="btn btn-green btn-icon icon-left" >
								<i class="fa fa-pencil-square-o"></i> Edit</button></a>
							 	<button type="button" class="btn btn-red btn-icon icon-left" ng-click="deleteRestaurant(restaurant.rest_id, $event)">
								<i class="entypo-cancel"></i> Delete</button>
								</td>
							
						</tr>
					</tbody>
				
				</table>
				<!-- ================= Pagination ===================== -->
				<div id="pagination" class="pull-right">
												
				</div>
		</div>	
</div>	
		
		<!-- ================== Modal Update ================== -->		
		
		<div class="modal fade" id="btnUpdate" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
		  <div class="modal-dialog" role="document">
		    <div class="modal-content">
		      <div class="modal-header">
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
		        <h4 class="modal-title" id="myModalLabel">Restaurant</h4>
		      </div>
		      <div class="modal-body">
		        <form class="form-horizontal" name="frmUpdate">
					  <div class="form-group">
					    <label for="rest_name" class="col-sm-2 control-label">Restaurant Name</label>
					    <div class="col-sm-10">
					      <input type="text" class="form-control" value="{{rest_name}}"  ng-model="rest_name" name="rest_name" required>
					    </div>
					  </div>
					  <div class="form-group">
					    <label for="restype_name" class="col-sm-2 control-label">Restaurant Type</label>
					    <div class="col-sm-10">
					      <input type="text" class="form-control" value="{{restype_name}}"  ng-model="restype_name" name="restype_name" required>
					    </div>
					  </div>
					  <div class="form-group">
					    <label for="contact" class="col-sm-2 control-label">Contact</label>
					    <div class="col-sm-10">
					      <input type="text" class="form-control" value="{{contact}}"  ng-model="contact" name="contact" required>
					    </div>
					  </div>
					  <div class="form-group">
					    <label for="about" class="col-sm-2 control-label">About</label>
					    <div class="col-sm-10">
					      <input type="text" class="form-control" value="{{about}}"  ng-model="about" name="about" required>
					    </div>
					  </div>
					  <div class="form-group">
					    <label for="open_close" class="col-sm-2 control-label">Open - Close</label>
					    <div class="col-sm-10">
					      <input type="text" class="form-control" value="{{open_close}}"  ng-model="open_close" name="open_close" required>
					    </div>
					  </div>
					  <div class="form-group">
					    <label for="location" class="col-sm-2 control-label">Location</label>
					    <div class="col-sm-10">
					      <input type="text" class="form-control" value="{{location}}"  ng-model="location" name="location" required>
					    </div>
					  </div>
					  <div class="form-group">
					    <label for="street" class="col-sm-2 control-label">Street</label>
					    <div class="col-sm-10">
					      <input type="text" class="form-control" value="{{street}}"  ng-model="street" name="street" required>
					    </div>
					  </div>
					  <div class="form-group">
					    <label for="communce" class="col-sm-2 control-label">Communce</label>
					    <div class="col-sm-10">
					      <input type="text" class="form-control" value="{{communce}}"  ng-model="communce" name="communce" required>
					    </div>
					  </div>
					  <div class="form-group">
					    <label for="district" class="col-sm-2 control-label">District</label>
					    <div class="col-sm-10">
					      <input type="text" class="form-control" value="{{district}}"  ng-model="district" name="district" required>
					    </div>
					  </div>
					  <div class="form-group">
					    <label for="province" class="col-sm-2 control-label">Province</label>
					    <div class="col-sm-10">
					      <input type="text" class="form-control" value="{{province}}"  ng-model="province" name="province" required>
					    </div>
					  </div>
					  <div class="form-group">
					    <div class="col-sm-offset-2 col-sm-10">
					      <input type="button" class="btn btn-success" ng-click="updateComment()"  value="Update" data-dismiss="modal" >
					    </div>
					  </div>
				</form>
				
		      </div>
		    </div>
		  </div>
		</div>
		<!-- ================== End Modal Update ================== -->		
		