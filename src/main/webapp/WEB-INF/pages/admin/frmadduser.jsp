<div ng-controller="mainCtrl">
<div class="col-md-12">	
	<div class="well">
		<h2 class="">Register</h2>
	</div>
	<!-- =========== Panel ========== -->	
	<div class="card card-outline-primary">
		<div class="card-header">
			<h3 class="card-title">USER INFORMATION</h3>
		</div>
			<div class="panel-body">
				<fieldset>
					<div class="row">
						<div class="col-md-11">
						<form id="frmUser">
						<div class="col-md-5">
							<div class="form-group">
								<label for="txtusername">First Name</label>
								<input type="text" class="form-control " ng-model="txtfirstname" name="firstname" >
							</div>
							<div class="form-group">
								<label for="txtusername">Last Name</label>
								<input type="text" class="form-control " ng-model="txtlastname" name="lastname" >
							</div>
								
										<div class="form-group">
										 <label for="txtusername">Username</label>
										    <input type="text" class="form-control " ng-model="txtusername" name="username" >
										  </div>
										  <div class="form-group">
										    <label for="txtfirstname">Email</label>
										    <input type="email" class="form-control" ng-model="txtemail"  name="email">
										  </div>
									  <div class="form-group">  
									    <label for="txtfirstname">Password</label>
									    <input type="password" class="form-control" ng-model="txtpassword" name="password">
									  </div>
								  </div>
								  <div class='col-sm-5'>
								            <div class="form-group">
								            	<label for="" class="">Date of Birth</label>
								                <div class='input-group date' id='datetimepicker1' > 
								                    <input type='text' class="form-control" ng-model="txtdob" name="dob"  placeholder="Year-Month-Day"/>
								                    <span class="input-group-addon">
								                        <span class="glyphicon glyphicon-calendar"></span>
								                    </span>
								                </div>
								            </div>
								        </div>
								        <script type="text/javascript">
								            
								        </script>
								  
								  <div class="col-md-5">
									   <div class="form-group">
									    <label for="" class="">Role</label>
									    <div class="">
									      <select class="form-control" ng-model="roles" ng-change="getRoleId(roles)" name="roles">
									      		<option value="1" selected>ROLE_STANDARD_USER</option>
									      		<option value="2">ROLE_OWNER</option>
									      		<option value="3">ROLE_ADMIN</option>
									      </select>
									    </div>
									   </div>
									   <div class="form-group">
									    <label for="txtfirstname">Profile</label>
									    <input type="file" class="form-control" ng-model="picture" name="picture">
									  </div>
									   <div class="form-group">
									     <input type="button" class="btn btn-success" ng-click="addUser()" value="Submit">
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