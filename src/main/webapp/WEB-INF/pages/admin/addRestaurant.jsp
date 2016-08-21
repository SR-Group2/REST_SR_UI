<section class="add_restaurant"  ng-controller="restAddCtrl">
	<h2>Add Restaurant</h2>
	<br />
	<form name="frmAddRest" id="frmAddRest">
	<div class="row">
		<div class="col-md-12">
			
			<div class="panel panel-primary" data-collapsed="0">
			
				<div class="panel-heading">
					<div class="panel-title">
						Fill Restaurant Information
					</div>
					<div class="panel-options">
						<a href="#sample-modal" data-toggle="modal" data-target="#sample-modal-dialog-1" class="bg"><i class="entypo-cog"></i></a>
						<a href="#" data-rel="collapse"><i class="entypo-down-open"></i></a>
						<a href="#" data-rel="reload"><i class="entypo-arrows-ccw"></i></a>
						<a href="#" data-rel="close"><i class="entypo-cancel"></i></a>
					</div>
				</div>
				<div class="panel-body">
					<!--  ======== Form Add Restaurant ============= -->
				
					<div class="col-md-5">
						<div class="form-group">
							<label for="rest_name">Restaurant Name</label>
							<input type="text" class="form-control" name="rest_name" ng-model="rest_name" required>
						</div>
						<div class="form-group">
							<label for="rest_name">Restaurant Name Khmer</label>
							<input type="text" class="form-control" name="rest_name_kh" ng-model="rest_name_kh" required>
						</div>
						<div class="form-group">
							<label for="restype_id">Restaurant Category(Allow only 3 Categories)</label>
				        	<!-- <pre>Model value: {{data_Restypes}}</pre> -->
       						<multiselect ng-model="data_Restypes" options="dataRestypes" 
		       						display-prop="restype_name" id-prop="restype_id"
		                     		selection-limit="3">
		                     </multiselect>
						 </div>
						<div class="form-group">
							<label for="rest_name">Restaurant Picture</label>
							<input type="file" class="form-control file2 btn btn-primary"
							  multiple="1" data-label="<i class='glyphicon glyphicon-circle-arrow-up'></i> 
							 &nbsp;Browse Files" style="left: -8.75px; top: -1.5px;"  name="rest_picture" id="rest_picture" required>
						</div> 
						 <div class="form-group">
							<label for="rest_name">Restaurant Menu</label>
							<input type="file" class="form-control file2 btn btn-orange"
							 multiple="1" data-label="<i class='glyphicon glyphicon-circle-arrow-up'></i> 
							 &nbsp;Browse Files" style="left: -8.75px; top: -1.5px;"  name="menu" id="menu" required>
						</div> 
						<!-- =================   image thumbnail  ======================= -->
						
						<div class="form-group">
							<label for="contact">Contact</label>
							<input type="text" class="form-control" name="contact" ng-model="contact" required>
						</div>
						<div class="form-group">
							<label for="about">About</label>
							<input type="text" class="form-control" name="about" ng-model="about" required>
						</div>
						<div class="form-group row">
							<div class="col-md-12">
								<label for="open_close">Open - Close</label>
							</div>
							<div class="col-md-6">
								<input type="text" name="open" class="form-control" ng-model="open" placeholder="10:30 AM"/>
							</div>
							
							<div class="col-md-6">
								<input type="text" name="close" class="form-control" ng-model="close" placeholder="12:30 PM"/>
							</div>
		
						</div>
					</div> 
					<div class="col-md-5">
						<div class="form-group">
							<label for="open_close">City / Province</label>
							<select name="province" ng-model="province" class="form-control" 
							ng-change="getDistrict(province)" required>
								<option selected>------ Select Province ------</option>
								<option ng-repeat="province in provinces" 
									value="{{province.ID}}">{{province.NAME}}</option>
							</select>
						</div>
						<div class="form-group">
							<label for="district">District / Khan</label>
							<select class="form-control" name="district" ng-model="district" 
								ng-change="getCommune(district)" required>
								<option selected>------ Select District ------</option>
								<option ng-repeat="district in districts" 
									value="{{district.ID}}">{{district.NAME}}</option>
							</select>
						</div>
						<div class="form-group">
							<label for="commune">Commune / Sangkat</label>
							<select class="form-control" name="communce" ng-model="communce" 
								ng-change="getVillage(communce)" required>
								<option selected>------ Select Commune ------</option>
								<option ng-repeat="commune in communes" 
									value="{{commune.ID}}">{{commune.NAME}}</option>
							</select>
						</div>
						<div class="form-group">
							<label for="village">Village / Krom</label>
							<select class="form-control" name="village" ng-model="village">
								<option selected >------ Select Village ------</option>
								<option ng-repeat="village in villages" value="{{village.ID}}">{{village.NAME}}</option>
							</select>
						</div>
						<div class="form-group">
							<div class="form-group">
							<label for="street_number">Street Number</label>
							<input type="text" class="form-control" name="street_number" ng-model="street_number" required>
						</div>
						
							<!-- <div class="form-group">
								<label for="location">Location</label>
								<input type="text" class="form-control" name="location" ng-model="location"" required>
							</div> -->
							
							<a href="${pageContext.request.contextPath}/admin/restaurant" target="_self"">
							<button type="button" class="btn btn-blue btn-block"
							 ng-disabled="commentInfo.first_name.$invalid || brandInfo.last_name.$invalid || 
							 brandInfo.rest_name.$invalid || brandInfo.comment.$invalid"
							  ng-click="addRestaurant($event)" data-dismiss="modal">
								<i class="fa fa-floppy-o"> Add Restaurant</i></button></a>
						</div>
					   </div> 
					
				</div><!-- ==============  end Panel ===================== -->
			</div>
		</div><!-- ==============  end col-md-12 ===================== -->
	</div><!-- ==============  end row ===================== -->
</form>
</section>
	
	
	
	
	