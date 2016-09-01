<div ng-controller="mainCtrl">
	<div class="col-md-12">	
		<div class="frmadd">
			<!-- =========== Panel ========== -->	
			<div class="card card-outline-secondary">
			<div class="card-header">
			<h3 class="card-title">Register</h3>
			</div>
			<div class="panel-body">
				
					<div class="row">
						<div class="col-md-12">
							<form id="frmUser" name="frmAddUser">
								<fieldset>
									<div class="col-sm-4">
										<div class="form-group">
											<label for="txtusername">First Name</label>
											<input type="text" class="form-control " ng-model="txtfirstname" name="firstname"  ng-required="true">
										</div>
										<div class="form-group">
											<label for="txtusername">Last Name</label>
											<input type="text" class="form-control " ng-model="txtlastname" name="lastname" ng-required="true">
										</div>
											
										<div class="form-group">
										 <label for="txtusername">Username</label>
										    <input type="text" class="form-control " ng-model="txtusername" name="username" ng-required="true" >
										  </div>
										  <div class="form-group">
										    <label for="txtfirstname">Email</label>
										    <input type="email" class="form-control" ng-model="txtemail"  name="email" ng-required="true">
										  </div>
										  <div class="form-group">  
										    <label for="txtfirstname">Password</label>
										    <input type="password" class="form-control" ng-model="txtpassword" name="password" ng-required="true">
										  </div>
									  </div> <!-- End column -->
									  								<div class='col-sm-4'>
									 <div class="form-group">
									 	<label for="" class="">Date of Birth</label>
										<div class="input-group">
												<input type="text" class="form-control datepicker" data-format="yyyy-mm-dd" placeholder="Year-Month-Day" ng-model="txtdob" name="dob">				
												<div class="input-group-addon">
													<a href="#"><i class="entypo-calendar"></i></a>
												</div>
										</div>
									</div>
						 
									<div class="form-group">
										      <label for="" class="">Gender</label>
										      <div class="form-inline">
										      	<input type="radio" class="form-control"  ng-model="txtgender"  name="gender" value="Male" ng-required="true"> Male
										      	<input type="radio" class="form-control"  ng-model="txtgender"  name="gender" value="Female" ng-required="true"> Female
											</div>
									</div>
									
									<div class="form-group">
										    <label for="" class="">Role</label>
										    <div class="">
										      <select class="form-control" ng-model="roles" name="roles" ng-required="true">
													<option value="" style="display:none">-- Select --</option>
										      		<option value="1">ROLE_STANDARD_USER</option>
										      		<option value="2">ROLE_OWNER</option>
										      		<option value="3">ROLE_ADMIN</option>
										      </select>
										      
										    </div>
								    </div>
									<div class="form-group">
										<input type="button" class="btn btn-success btn-block" ng-click="addUser()" value="Save"  ng-disabled="frmAddUser.$invalid">
										  <%-- <a href="${pageContext.request.contextPath}/admin/user" target="_self" class="btn btn-success">View User</a> --%>
									</div>
									
	 							</div><!-- End column -->
								<div class="col-md-3">																										
									<div class="fileinput fileinput-new" data-provides="fileinput"><input type="hidden">
										<div class="fileinput-new thumbnail" style="width: 200px; height: 150px;" data-trigger="fileinput">
											<img src="${pageContext.request.contextPath}/resources/assets/images/profile-icon.png" alt="">
										</div>
										<div class="fileinput-preview fileinput-exists thumbnail" style="max-width: 200px; max-height: 150px; line-height: 6px;"></div>
										<div>
											<span class="btn btn-white btn-file">
												<span class="fileinput-new">Select image</span>
												<span class="fileinput-exists">Change</span>
												<input id="file" type="file" name="..." accept="image/*">
											</span>
											<a href="#" class="btn btn-orange fileinput-exists" data-dismiss="fileinput">Remove</a>
										</div>
									</div>
									
									
								</div>
								</fieldset>
							
							</form>
		
									<%-- <div class="fileinput fileinput-new" data-provides="fileinput"><input type="hidden">
										<div class="fileinput-new thumbnail" style="width: 150px; height: 150px;" data-trigger="fileinput">
											<img src="${pageContext.request.contextPath}/resources/assets/images/profile-icon.png" alt="...">
										</div>  --%>
									
										<!-- =================    restaurant picture ======================= -->			
										 <!-- <div id="content" myfilter>
									        <input type="file" name="files[]" id="userGallery">
										 </div>
										<div class="fileinput-preview fileinput-exists thumbnail" style="max-width: 200px; max-height: 150px; line-height: 6px;"></div> -->
										<!-- <div>
											<span class="btn btn-white btn-file">
												<span class="fileinput-new">Select image</span>
												<span class="fileinput-exists">Change</span>
												<input type="file" name="..." accept="image/*">
											</span>
											<a href="#" class="btn btn-orange fileinput-exists" data-dismiss="fileinput">Remove</a>
										</div> -->
									<!-- </div> -->
								</div>																	
					    </div>
							
					</div>				
			</div>
			</div>
		<!-- =========== End Panel ========== -->	
		</div><!-- End Form add -->
</div><!-- End Controller -->