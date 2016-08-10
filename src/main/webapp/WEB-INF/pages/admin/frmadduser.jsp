<div ng-controller="mainCtrl">
	<div class="container" >
		<div class="row">
			<div class="well container bg-success">
				<h2 class="">Add New User</h2>
			</div>
			
			<form>
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
				  <div class="col-md-5">
					   <div class="form-group">
					    	<label for="" class="">Date of Birth</label>
					    	<input type="date" class="form-control" ng-model="txtdob" name="dob">
					    	<!--  
			  				<div class="row">
								  <div class="col-xs-3">
								    <select class="form-control" ng-model="day" ng-change="getDay(day)" name="day">
					      				<option selected>Day</option>
					      				<option value="1" ng-repeat="d in day">{{d.day}}</option>
					      				
					      			</select>
								  </div>
								  <div class="col-xs-3">
								     <select class="form-control" ng-model="month" ng-change="get(month)" name="month">
					      				<option selected>Month</option>
					      				<option value="1">1</option>
					      				<option value="2">2</option>
					      			 </select>
								  </div>
								  <div class="col-xs-4">
								     <select class="form-control" ng-model="year" ng-change="getYear(year)" name="year">
					      				<option selected >Year</option>
					      				<option value="1">1994</option>
					      				<option value="2">1995</option>
					      			</select>
								  </div>
							</div>
							-->
					    </div>
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
</div>