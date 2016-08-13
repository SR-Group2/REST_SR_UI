<div ng-controller="mainCtrl">
<div class="col-md-12">
	<div class="card card-outline-secondary">
		
		<div class="card-header">
			  <div>
			  	<h3 class="card-title">User Information</h3>
			  </div>
			  <div class="form-group pull-md-right col-md-5">
			    <div class="input-group ">
			      <input type="text" class="form-control" ng-model="search" id="search" placeholder="search......">
			      <div class="input-group-addon">Search</div>
			    </div>
			  </div>
		</div>
				<table class="table table-striped">
					<thead class="thead-inverse">
						<tr>
							<th>ID</th>
							<th>First Name</th>
							<th>Last Name</th>
							<th>Username</th>
							<th>Email</th>
							<th>Password</th>
							<th>Date of Birth</th>
							<th>Gender</th>
							<th>Joined</th>
							<th>Role</th>
							<th>Profile</th>
							<th>Action</th>
						</tr>
					</thead>
					<tbody>
						<!-- <tr ng-repeat=" user in users | filter:search | limitTo: pageSize"> -->
						<tr dir-paginate="user in users|filter:search|itemsPerPage:10">
							<td>{{$index+1}}</td>
							<td>{{user.first_name}}</td>
							<td>{{user.last_name}}</td>
							<td>{{user.username}}</td>
							<td>{{user.email}}</td>
							<td>{{user.password}}</td>
							<td>{{user.dob | date: "yyyy-MM-dd"}}</td>
							<td>{{user.gender}}</td>
							<td>{{user.joined | date: "yyyy-MM-dd"}}</td>
							<td>{{user.role.name}}</td>
							<td>{{user.picture}}</td>
							<td><button type="button" class="btn btn-success btn-sm" data-toggle="modal" data-target="#btnUpdate" ng-click="getUserById(user.user_id)">
							<i class="fa fa-pencil-square-o"></i></button> <button type="button" class="btn btn-danger btn-sm" ng-click="deleteUsers(user.user_id);">
							<i class="fa fa-trash-o"></i></button></td>
							
						</tr>
					</tbody>
				
				</table>
				<div class="text-md-center page">
				<dir-pagination-controls 
			       max-size="5"
			       direction-links="true"
			       boundary-links="true" >
			    </dir-pagination-controls>
			    </div>
				
		</div>	
</div>	
		<!-- ================== Modal Update ================== -->		
		<div class="modal fade" id="btnUpdate" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
		  <div class="modal-dialog" role="document">
		    <div class="modal-content">
		      <div class="modal-header">
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
		        <h4 class="modal-title" id="myModalLabel">Operation</h4>
		      </div>
		      <div class="modal-body">
		        <form class="form-horizontal" name="frmUpdate">
		        	
					  <div class="form-group">
					    <label for="" class="col-sm-2 control-label">First Name</label>
					    <div class="col-sm-10">
					      <input type="text" class="form-control" value="{{firstName}}"  ng-model="firstName" name="updateFirstname" required>
					    </div>
					  </div>
					 
					  
					  <div class="form-group">
					    <label for="" class="col-sm-2 control-label">Last Name</label>
					    <div class="col-sm-10">
					      <input type="text" class="form-control" value="{{lastName}}" ng-model="lastName"  name="updatelastname" required>
					    </div>
					  </div>
					  <div class="form-group">
					    <label for="" class="col-sm-2 control-label">Username</label>
					    <div class="col-sm-10">
					      <input type="text" class="form-control" value="{{username}}" ng-model="username"  name="updateUsername" required>
					    </div>
					  </div>
					  <div class="form-group">
					    <label for="" class="col-sm-2 control-label">Email</label>
					    <div class="col-sm-10">
					      <input type="text" class="form-control" value="{{email}}" ng-model="email"  name="updateEmail" required>
					    </div>
					  </div>
					  <div class="form-group">
					    <label for="" class="col-sm-2 control-label">Password</label>
					    <div class="col-sm-10">
					      <input type="password" class="form-control" value="{{password}}" ng-model="password"  name="updatePassword" required>
					    </div>
					  </div>
					  
					  <div class="form-group">
					    <label for="" class="col-sm-2 control-label">Date of Birth </label>
					    <div class="col-sm-10">
					       <div class='input-group date' id='datetimepicker1' >	                	 
							<input type='text' class="form-control" value="{{dob}}" ng-model="dob" name="dob"  placeholder="Year-Month-Day"/>
								<span class="input-group-addon">
								<span class="glyphicon glyphicon-calendar"></span>
								</span>
						</div>
					    </div>
					  </div>
					  <div class="form-group form-inline">
					    <label for="" class="col-sm-2 control-label">Gender</label>
					    <div class="col-sm-10">
					      <input type="radio" class="form-control"   ng-model="gender"  name="updateGender" value="Male" ng-change="getGender(gender)" required>Male
					       <input type="radio" class="form-control"  ng-model="gender"  name="updateGender" value="Female" ng-change="getGender(gender)" required>Female
					    </div>
					  </div>
					   <div class="form-group">
					    <label for="" class="col-sm-2 control-label">Role</label>
					    <div class="col-sm-10">
					      <select ng-model="roles">
					      		<option value="1">ROLE_STANDARD_USER</option>
					      		<option value="2">ROLE_OWNER</option>
					      		<option value="3">ROLE_ADMIN</option>
					      </select>
					    </div>
					  </div>
					  
					  <div class="form-group">
					    <div class="col-sm-offset-2 col-sm-10">
					      <input type="button" class="btn btn-success" ng-click="updateUser()"  value="Update" data-dismiss="modal" >
					    </div>
					  </div>
				</form>
				
		      </div>
		    </div>
		  </div>
		</div>
		<!-- ================== End Modal Update ================== -->		
		