<div ng-controller="mainCtrl">
	<div id="table-1_wrapper" class="dataTables_wrapper form-inline">
		<div class="row">
			<div class="col-xs-12 col-left">
				<div class="dataTables_length" id="table-1_length">
					<a class="btn btn-primary btn-icon" href="${pageContext.request.contextPath}/admin/adduser">Add New <i class="entypo-user-add"></i></a>
			  
			  <div class="form-group pull-md-right col-md-5">
			    <div class="input-group ">
			      <input type="text" class="form-control" ng-model="search" id="search" placeholder="search......">
			      <div class="input-group-addon btn-blue">Search</div>
			    </div>
			  </div>
			  

				</div>
			</div>

		</div>

		
		<table class="table table-bordered datatable" id="table-1">
			<thead>
				<tr>
					        <th data-hide="phone">ID</th>
						
							<th>Full Name</th>
							<th>Username</th>
							<th>Email</th>
						
							<th>Gender</th>
						
							<th>Role</th>
							
							<th>Action</th>
				</tr>
			</thead>

			<tbody>
			
				<!-- <tr ng-repeat=" user in users | filter:search | limitTo: pageSize"> -->
						<tr class="odd gradeX" dir-paginate="user in users|filter:search|itemsPerPage:10 | orderBy">
							<td>{{$index+1}}</td>
							<td>{{user.first_name}}  {{user.last_name}}</td>
							<td>{{user.username}}</td>
							<td>{{user.email}}</td>
						<!-- 	<td>{{user.dob | date: "yyyy-MM-dd"}}</td> -->
							<td>{{user.gender}}</td>
							<!-- <td>{{user.joined | date: "yyyy-MM-dd"}}</td> -->
							<td>{{user.role.name}}</td>
							<td>
							<button type="button" class="btn btn-blue btn-sm" onclick="jQuery('#showDetails').modal('show');" ng-click="getUserById(user.user_id)">
							<i class="fa fa-info"></i> Info</button>
							<button type="button" class="btn btn-success btn-sm" onclick="jQuery('#modal').modal('show');" ng-click="getUserById(user.user_id)">
							<i class="fa fa-pencil-square-o"></i> Edit</button> <button type="button" class="btn btn-danger btn-sm" ng-click="deleteUsers(user.user_id);">
							<i class="fa fa-trash-o"></i> Delete</button></td>					
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
				<!-- <div class="text-md-center">-->
				<!-- ================= Pagination ===================== -->
				<!--  <ul class="pagination"> <li><a href="#"><i class="entypo-left-open-mini">
					</i></a></li> <li><a href="#">1</a></li> <li class="active"><a href="#">2</a></li>
					 <li><a href="#">3</a></li> 
					 <li><a href="#">4</a></li> 
					 <li><a href="#">5</a></li> 
					 <li><a href="#">6</a></li> 
					 <li><a href="#"><i class="entypo-right-open-mini"></i></a></li> 
				 </ul>
			  -->
		</div>
		
		
		
		<script type="text/javascript">
		var responsiveHelper;
		var breakpointDefinition = {
		    tablet: 1024,
		    phone : 480
		};
		var tableContainer;
		
			jQuery(document).ready(function($)
			{
				tableContainer = $("#table-1");
				
				tableContainer.dataTable({
					"sPaginationType": "bootstrap",
					"aLengthMenu": [[10, 25, 50, -1], [10, 25, 50, "All"]],
					"bStateSave": true,
					
		
				    // Responsive Settings
				    bAutoWidth     : false,
				    fnPreDrawCallback: function () {
				        // Initialize the responsive datatables helper once.
				        if (!responsiveHelper) {
				            responsiveHelper = new ResponsiveDatatablesHelper(tableContainer, breakpointDefinition);
				        }
				    },
				    fnRowCallback  : function (nRow, aData, iDisplayIndex, iDisplayIndexFull) {
				        responsiveHelper.createExpandIcon(nRow);
				    },
				    fnDrawCallback : function (oSettings) {
				        responsiveHelper.respond();
				    }
				});
				
				$(".dataTables_wrapper select").select2({
					minimumResultsForSearch: -1
				});
			});
		</script>
		
		<br />

		<!-- <!-- ================== Modal Update ================== -->		
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
							<input type='text' class="form-control" value="{{dob}}" ng-model="dob" name="updateDob"  placeholder="Year-Month-Day"/>
								<span class="input-group-addon">
								<span class="glyphicon glyphicon-calendar"></span>
								</span>
						</div>
					    </div>
					  </div>
					  
					   <div class="form-group">
						 	<label class="col-sm-2 control-label">Date of Birth</label>
						 	<div class="col-sm-10">
							<div class="input-group">
									<input type="text" class="form-control datepicker" data-format="yyyy-mm-dd" placeholder="Year-Month-Day" value={{dob}} ng-model="dob" name="updateDob">				
									<div class="input-group-addon">
										<a href="#"><i class="entypo-calendar"></i></a>
									</div>
							</div>
							</div>
						</div>
					  
					  <div class="form-group form-inline">
					    <label for="" class="col-sm-2 control-label">Gender</label>
					    <div class="col-sm-10">
					      <input type="radio" class="form-control"   ng-model="gender"  name="updateGender" value="Male" ng-change="getGender(gender)"  required>Male
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
	<!--	================== End Modal Update ==================	 -->	
		
	
	<div class="modal fade" id="modal">
		<div class="modal-dialog" style="width: 60%;">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
					<h4 class="modal-title">Update User</h4>
				</div>
				<div class="modal-body">	
				
				<div class="panel-body">
		 			<div class="row">
		 				<form class="form-horizontal">
						<div class="col-sm-7">
						
						  <div class="form-group col-sm-12">
							<label for="username" class="col-sm-3 control-label">First Name</label>
							<div class="col-sm-9">
								<div class="input-group minimal">
									<input type="text" class="form-control" value="{{first_name}}"  ng-model="first_name" name="first_name" required>
									<span class="input-group-addon"></span>
								</div>
							</div>
						 </div>
							
						<div class="form-group col-sm-12">
							<label for="" class="col-sm-3 control-label">Last Name</label>
							<div class="col-sm-9">
								<div class="input-group minimal">
									<input type="text" class="form-control" value="{{last_name}}" ng-model="last_name"  name="last_name" required>
									<span class="input-group-addon"></span>
								</div>
							</div>
						 </div>
						
						<!-- ==============  username ================ -->
						<div class="form-group col-sm-12">
							<label for="username" class="col-sm-3 control-label">Username</label>
							<div class="col-sm-9">
								<div class="input-group minimal">
									<input type="text" class="form-control"  value="{{username}}" ng-model="username"  
										name="username" required placeholder="Username">
									<span class="input-group-addon"><i class="entypo-user"></i></span>
								</div>
								
							</div>
							
						</div>
						<!-- ==============  email ================ -->
						 <div class="form-group col-sm-12">
							<label for="username" class="col-sm-3 control-label">Email</label>
							<div class="col-sm-9">
								<div class="input-group minimal">
									<input type="email" class="form-control" value="{{email}}" ng-model="email"  name="email" required placeholder="Email" >
									<span class="input-group-addon"><i class="entypo-mail"></i></span>
								</div>
								
							</div>
							
						</div>
						<!-- ==============  end minimal ================ -->
						<div class="form-group col-sm-12">
							<label for="password" class="col-sm-3 control-label">Password</label>
							<div class="col-sm-9">
								<div class="input-group minimal">
									 <input type="password" class="form-control" value="{{password}}" ng-model="password"  name="password" required>
									<span class="input-group-addon"></span>
								</div>
							</div>
						 </div>
						 <div class="form-group col-sm-12">
							<label class="col-sm-3 control-label">Date of Birth</label>
							<div class="col-sm-9">
								<div class="input-group minimal">
									<input type="text" class="form-control datepicker" data-format="yyyy-mm-dd" 
									placeholder="Year-Month-Day" value={{dob}} ng-model="dob" name="dob">	
									<span class="input-group-addon"><i class="entypo-calendar"></i></span>
								</div>
							</div>
						 </div>
						 <div class="form-group">
							<label class="col-sm-3 control-label">Gender</label>
							<div class="col-sm-5">
								<div class="radio radio-replace">
									<input type="radio" class="form-control" id="male" ng-model="gender" selected  checked="checked"  name="gender" value="Male" ng-change="getGender(gender)"  required>
									<label for="male">Male</label>
								</div>
								<div class="radio radio-replace">
									<input type="radio" class="form-control"  id="female" ng-model="gender"  name="gender" value="Female" ng-change="getGender(gender)" required>
									<label for="female">Female</label>
								</div>
								
							</div>
						</div>
						

					   <div class="form-group col-md-12">
					    	<label for="" class="col-sm-3 control-label">Role</label>
					    	 <div class="col-sm-9">
						      <select ng-model="roles" class="form-control">
						      		<option value="1">ROLE_STANDARD_USER</option>
						      		<option value="2">ROLE_OWNER</option>
						      		<option value="3">ROLE_ADMIN</option>
						      </select>
					    	</div>
					  </div>
						<div class="modal-footer">
							<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
							<button type="button" class="btn btn-info" ng-click="updateUser()">Save changes</button>
						</div>
						
					</div><!-- end container 12 -->
					<div class="col-sm-5">
						<div class="fileinput fileinput-new" data-provides="fileinput"><input type="hidden">
							<div class="fileinput-new thumbnail" style="width: 200px; height: 150px;" data-trigger="fileinput">
								<img src="http://localhost:9999{{picture}}" alt="">
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
					</form>
				</div>
			</div>
		</div>
	</div>
	</div>
</div>
		
		
		<!-- ================== Modal Update ================== -->		
		<div class="modal fade" id="showDetails" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
		  <div class="modal-dialog" role="document">
		    <div class="modal-content">
		      <div class="modal-header">
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
		        <h4 class="modal-title" id="myModalLabel">User Detail</h4>
		      </div>
		      <div class="modal-body">
		        <table class="table">
		        	
					 <tr>
					    <th>First Name</th>
					    <td>{{first_name}}</td>
					</tr>
					 
					  <tr>
					    <th>Last Name</th>
					    <td>{{last_name}}</td>
					</tr>
					
					<tr>
					    <th>Username</th>
					    <td>{{username}}</td>
					</tr>
					
					<tr>
					    <th>Email</th>
					    <td>{{email}}</td>
					</tr>
					
					<!-- <tr>
					    <th>Password</th>
					    <td>{{password}}</td>
					</tr> -->
					
					<tr>
					    <th>Date of Birth</th>
					    <td>{{dob}}</td>
					</tr>
					
					<tr>
					    <th>Gender</th>
					    <td>{{gender}}</td>
					</tr>
					
					<tr>
					    <th>Role</th>
					    <td>{{role.name}}</td>
					</tr>
					
				</table>
					
		      </div>
		    </div>
		  </div>
		</div>
		<!-- ================== End Modal Update ================== -->	
		
		