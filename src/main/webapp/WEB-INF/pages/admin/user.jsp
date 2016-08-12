<div ng-controller="mainCtrl">
<div class="col-md-12">
	<div class="card card-outline-secondary">
		<div class="card-header">
			<h3 class="card-title">User Information</h3>
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
							<th>Action</th>
						</tr>
					</thead>
					<tbody>
						<tr ng-repeat=" user in users | limitTo: 8">
							<td>{{user.ID}}</td>
							<td>{{user.first_name}}</td>
							<td>{{user.last_name}}</td>
							<td>{{user.USERNAME}}</td>
							<td>{{user.EMAIl}}</td>
							<td>{{user.PASSWORD}}</td>
							<td>{{user.dob | date: "yyyy-MM-dd"}}</td>
							<td>{{user.gender}}</td>
							<td>{{user.joined | date: "yyyy-MM-dd"}}</td>
							<td>{{user.ROLE.NAME}}</td>
							<td><button type="button" class="btn btn-success" data-toggle="modal" data-target="#btnUpdate" ng-click="getUserById(user.ID)"><i class="fa fa-pencil-square-o"></i></button> <button type="button" class="btn btn-danger" ng-click="deleteUsers(user.ID);"><i class="fa fa-trash-o"></i></button></td>
							
						</tr>
					</tbody>
				
				</table>
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
					  
					   <div class="form-group">
					    <label for="" class="col-sm-2 control-label">Role</label>
					    <div class="col-sm-10">
					      <select  value="{{roles}}" ng-model="roles" ng-change="getRoleId(roles)">
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
		