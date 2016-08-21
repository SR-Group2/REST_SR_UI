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
							<label for="rest_name">Restaurant Picture</label>
							<input type="file" class="form-control file2 btn btn-primary"
							  multiple="1" data-label="<i class='glyphicon glyphicon-circle-arrow-up'></i> 
							 &nbsp;Browse Files" style="left: -8.75px; top: -1.5px;"  name="rest_picture" id="rest_picture" required>
						</div> -
						<div class="form-group">
							<label for="restype_id">Restaurant Category(Allow only 3 Categories)</label>
				        	<!-- <pre>Model value: {{data_Restypes}}</pre> -->
       						<multiselect ng-model="data_Restypes" options="dataRestypes" 
		       						display-prop="restype_name" id-prop="restype_id"
		                     		selection-limit="3">
		                     </multiselect>
						 </div>
						 <div class="form-group">
							<label for="rest_name">Restaurant Menu</label>
							<input type="file" class="form-control file2 btn btn-orange"
							 multiple="1" data-label="<i class='glyphicon glyphicon-circle-arrow-up'></i> 
							 &nbsp;Browse Files" style="left: -8.75px; top: -1.5px;"  name="menu" id="menu" required>
						</div>
		
						<!-- =================   image thumbnail  ======================= -->
						 <div id="content">
						 	<label for="rest_name">Restaurant Menu</label>
					        <span ng-repeat="s in sample" style="display:none">&nbsp;</span>
					        <input type="file" name="files[]" id="gallery" multiple="multiple">
						 </div>
						<div class="form-group">
							<label for="contact">Contact</label>
							<input type="text" class="form-control" name="contact" ng-model="contact" required>
						</div>
						<div class="form-group">
							<label for="about">About</label>
							<input type="text" class="form-control" name="about" ng-model="about" required>
						</div>
						<div class="form-group">
							<label for="open_close">Open - Close</label>
							<!-- <select class="form-control">
									<option>6:00 AM - 8:00 PM</option>
									<option>6:00 AM - 8:00 PM</option>
									<option>6:00 AM - 8:00 PM</option>
								</select> -->
							<input type="text" name="open_close" class="form-control" ng-model="open_close" placeholder="6:00 AM - 8:00 PM"/>
						</div>
					</div> 
					<div class="col-md-5">
						<div class="form-group">
							<div class="form-group">
							<label for="open_close">Street Number</label>
							<input type="text" class="form-control" name="street" ng-model="street" required>
							</div>
							<div class="form-group">
								<label for="open_close">Commune / Sangkat</label>
								<input type="text" class="form-control" name="communce" ng-model="communce" required>
							</div>
							<div class="form-group">
								<label for="open_close">District / Khan</label>
								<input type="text" class="form-control" name="district" ng-model="district" required>
							</div>
							<div class="form-group">
								<label for="open_close">City / Province</label>
								<input type="text" class="form-control" name="province" ng-model="province" required>
							</div>
							<div class="form-group">
								<label for="location">Location</label>
								<input type="text" class="form-control" name="location" ng-model="location"" required>
							</div>
							<br>
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
	
	
	
	
	