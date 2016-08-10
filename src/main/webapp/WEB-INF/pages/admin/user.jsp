<div ng-controller="mainCtrl">
				<div class="well">
					<button type="button" class="btn btn-success" data-toggle="modal" data-target="#addUser" ng-click="clearInput()">
					<i class="fa fa-plus-square-o"></i> Add New User</button>
				</div>
				<table class="table table-striped table-inverse">
					<thead class="thead-default">
						<tr>
							<th>ID</th>
							<th>First Name</th>
							<th>Last Name</th>
							<th>Username</th>
							<th>Email</th>
							<th>Password</th>
							<th>Date of Birth</th>
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
							<td>{{user.joined | date: "yyyy-MM-dd"}}</td>
							<td>{{user.ROLE.NAME}}</td>
							<td><button type="button" class="btn btn-success" data-toggle="modal" data-target="#btnUpdate" ng-click="getUserById(user.ID)"><i class="fa fa-pencil-square-o"></i>Update</button> <button type="button" class="btn btn-danger" ng-click="deleteUsers(user.ID);"><i class="fa fa-trash-o"></i>Delete</button></td>
							
						</tr>
					</tbody>
				
				</table>
				
		<!-- ================== Modal Add New User ================= -->
			<div class="modal fade" id="addUser" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
		  <div class="modal-dialog" role="document">
		    <div class="modal-content">
		      <div class="modal-header">
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
		        <h4 class="modal-title" id="myModalLabel">Operation</h4>
		      </div>
		      <div class="modal-body">
		        <form class="form-horizontal" name="frmPerson" id="frmUser">
					  <div class="form-group">
					    <label for="txtname" class="col-sm-2 control-label">First Name</label>
					    <div class="col-sm-10">
					      <input type="text" class="form-control" ng-model="txtfirstname" name="firstname" placeholder="" required>
					    </div>
					  </div>
					  <div class="form-group">
					    <label for="txtage" class="col-sm-2 control-label">Last Name</label>
					    <div class="col-sm-10">
					      <input type="text" class="form-control" ng-model="txtlastname" name="lastname" placeholder=""  required>
					    </div>
					  </div>
					  <div class="form-group">
					    <label for="txtage" class="col-sm-2 control-label">Username</label>
					    <div class="col-sm-10">
					      <input type="text" class="form-control" ng-model="txtusername" name="username" placeholder=""  required>
					    </div>
					  </div>
					  <div class="form-group">
					    <label for="txtage" class="col-sm-2 control-label">Email</label>
					    <div class="col-sm-10">
					      <input type="text" class="form-control" ng-model="txtemail" name="email" placeholder="" required>
					    </div>
					  </div>
					  <div class="form-group">
					    <label for="txtage" class="col-sm-2 control-label">Password</label>
					    <div class="col-sm-10">
					      <input type="password" class="form-control" ng-model="txtpassword" name="password" placeholder="" required>
					    </div>
					  </div>
					  <div class="form-group">
					    <label for="" class="col-sm-2 control-label">Date of Birth</label>
					    <div class="col-sm-10">
					      <input type="text" class="form-control" ng-model="txtdob"  name="dob" required>
					    </div>
					  </div>
					  
					  <div class="form-group">
					    <label for="" class="col-sm-2 control-label">Role</label>
					    <div class="col-sm-10">
					      <select class="form-control" ng-model="roles" ng-change="getRoleId(roles)">
					      		<option value="1" selected>ROLE_STANDARD_USER</option>
					      		<option value="2">ROLE_OWNER</option>
					      		<option value="3">ROLE_ADMIN</option>
					      </select>
					    </div>
					  </div>
					  
					  <div class="form-group">
					    <label for="" class="col-sm-2 control-label">Profile</label>
					    <div class="col-sm-10">
					      <input type="file" class="form-control"  ng-model="imgpicture"  name="picture" required>
					    </div>
					  </div>
					  
					  <div class="form-group">
					    <div class="col-sm-offset-2 col-sm-10">
					      <input type="button" class="btn btn-success" ng-click="addUser()" value="Submit" data-dismiss="modal"  >
					    </div>
					  </div>
				</form>
		      </div>
		    </div>
		  </div>
		</div>
		<!-- ================== End Modal Add New User ================= -->
		
		
				
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
					    <label for="" class="col-sm-2 control-label">Date of Birth</label>
					    <div class="col-sm-10">
					      <input type="text" class="form-control" value="{{dob}}" ng-model="dob"  name="updatedob" required>
					    </div>
					  </div>
					  
					   <div class="form-group">
					    <label for="" class="col-sm-2 control-label">Role</label>
					    <div class="col-sm-10">
					      <select>
					      		<option>ROLE_STANDARD_USER</option>
					      		<option>ROLE_OWNER</option>
					      		<option>ROLE_ADMIN</option>
					      </select>
					    </div>
					  </div>
					  
					  <div class="form-group">
					    <div class="col-sm-offset-2 col-sm-10">
					      <input type="button" class="btn btn-success" ng-click=""  value="Update" data-dismiss="modal" >
					    </div>
					  </div>
				</form>
				
		      </div>
		    </div>
		  </div>
		</div>
		<!-- ================== End Modal Update ================== -->		
				