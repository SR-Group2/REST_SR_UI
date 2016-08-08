<div>
				<div class="well">
					<button type="button" class="btn btn-success" data-toggle="modal" data-target="#addUser">Add New User</button>
					
							<div class="modal fade" id="addUser" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
		  <div class="modal-dialog" role="document">
		    <div class="modal-content">
		      <div class="modal-header">
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
		        <h4 class="modal-title" id="myModalLabel">Operation</h4>
		      </div>
		      <div class="modal-body">
		        <form class="form-horizontal" name="frmPerson">
					  <div class="form-group">
					    <label for="txtname" class="col-sm-2 control-label">First Name</label>
					    <div class="col-sm-10">
					      <input type="text" class="form-control" ng-model="txtname" name="personName" placeholder="Ex: John Son" required>
					    </div>
					  </div>
					  <div class="form-group">
					    <label for="txtage" class="col-sm-2 control-label">Last Name</label>
					    <div class="col-sm-10">
					      <input type="text" class="form-control" ng-model="txtage" name="personAge" placeholder="Ex: 18" ng-pattern="/^\d+$/" required>
					    </div>
					  </div>
					  <div class="form-group">
					    <label for="txtage" class="col-sm-2 control-label">Username</label>
					    <div class="col-sm-10">
					      <input type="text" class="form-control" ng-model="txtage" name="personAge" placeholder="Ex: 18" ng-pattern="/^\d+$/" required>
					    </div>
					  </div>
					  <div class="form-group">
					    <label for="txtage" class="col-sm-2 control-label">Email</label>
					    <div class="col-sm-10">
					      <input type="text" class="form-control" ng-model="txtage" name="personAge" placeholder="Ex: 18" ng-pattern="/^\d+$/" required>
					    </div>
					  </div>
					  <div class="form-group">
					    <label for="txtage" class="col-sm-2 control-label">Password</label>
					    <div class="col-sm-10">
					      <input type="text" class="form-control" ng-model="txtage" name="personAge" placeholder="Ex: 18" ng-pattern="/^\d+$/" required>
					    </div>
					  </div>
					  <div class="form-group">
					    <div class="col-sm-offset-2 col-sm-10">
					      <input type="button" class="btn btn-success" ng-click="addPerson()" value="Submit" data-dismiss="modal" ng-disabled="frmPerson.personName.$invalid || frmPerson.personAge.$invalid" >
					    </div>
					  </div>
				</form>
		      </div>
		    </div>
		  </div>
		</div>
					
					
				</div>
				<table class="table">
					<thead>
						<tr>
							<th>ID</th>
							<th>First Name</th>
							<th>Last Name</th>
							<th>Username</th>
							<th>Email</th>
							<th>Password</th>
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
							<td><button type="button" class="btn btn-warning" data-toggle="modal" data-target="#btnUpdate" ng-click="getUserById(user.ID)"><i class="fa fa-pencil-square-o"></i>Update</button> <button type="button" class="btn btn-danger" ng-click="deleteUsers(user.ID);"><i class="fa fa-trash-o"></i>Delete</button></td>
							
						</tr>
					</tbody>
				
				</table>
				
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
					    <label for="txtname" class="col-sm-2 control-label">First Name</label>
					    <div class="col-sm-10">
					      <input type="text" class="form-control" value="{{firstName}}"  ng-model="firstName" name="updateName" required>
					    </div>
					  </div>
					  <div class="form-group">
					    <label for="txtage" class="col-sm-2 control-label">Last Name</label>
					    <div class="col-sm-10">
					      <input type="text" class="form-control" value="{{lastName}}" ng-model="lastName" ng-pattern="/^\d[2]+$/" name="updateAge" required>
					    </div>
					  </div>
					  <div class="form-group">
					    <label for="txtage" class="col-sm-2 control-label">Username</label>
					    <div class="col-sm-10">
					      <input type="text" class="form-control" value="{{username}}" ng-model="username" ng-pattern="/^\d[2]+$/" name="updateAge" required>
					    </div>
					  </div>
					  					  <div class="form-group">
					    <label for="txtage" class="col-sm-2 control-label">Email</label>
					    <div class="col-sm-10">
					      <input type="text" class="form-control" value="{{email}}" ng-model="email" ng-pattern="/^\d[2]+$/" name="updateAge" required>
					    </div>
					  </div>
					  					  <div class="form-group">
					    <label for="txtage" class="col-sm-2 control-label">Password</label>
					    <div class="col-sm-10">
					      <input type="text" class="form-control" value="{{password}}" ng-model="password" ng-pattern="/^\d[2]+$/" name="updateAge" required>
					    </div>
					  </div>
					  
					  <div class="form-group">
					    <div class="col-sm-offset-2 col-sm-10">
					      <input type="button" class="btn btn-success" ng-click="updatePerson()" ng-disabled="frmUpdate.updateName.$invalid || frmUpdate.updateAge.$invalid " value="Update" data-dismiss="modal" >
					    </div>
					  </div>
				</form>
		      </div>
		    </div>
		  </div>
		</div>
				