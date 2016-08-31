<section class="add_restaurant"  ng-controller="restUpdateCtrl">
	<h2>Update Restaurant</h2>
	<br />
	<form name="frmUpdateRest" id="frmUpdateRest">
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
							<input type="text" class="form-control" name="rest_name" ng-model="rest_name"  ng-required="true">
						</div>
						<div class="form-group">
							<label for="rest_name">Restaurant Name Khmer</label>
							<input type="text" class="form-control" name="rest_name_kh" ng-model="rest_name_kh"  ng-required="true">
						</div>
						 
						<div class="form-group">
							<label for="restype_id">Restaurant Category(Allow only 3 Categories)</label>
				        	<!-- <pre>Model value: {{data_Restypes}}</pre> -->
       						<!-- <multiselect ng-model="data_Restypes" options="dataRestypes" 
		       						display-prop="restype_name" id-prop="restype_id"
		                     		selection-limit="3">
		                     </multiselect> -->
		                     <div ng-if="check">
								<multiselect ng-model="data_Restypes" options="options" selection-limit="3" ng-change="getVal(data_Restypes)"
								id-prop="restype_id" display-prop="restype_name"></multiselect>
							</div>
						 </div>
						  <!-- =================    restaurant picture ======================= -->			
						 <div id="content">
						 	<label for="rest_picture">Restaurant Picture</label>
					        <input type="file" name="files[]" id="restGallery" multiple="multiple"  ng-required="true">
						 </div>
		
						<!-- =================   image thumbnail  ======================= -->
						 <div id="content">
						 	<label for="rest_menu">Restaurant Menu</label>
					        <input type="file" name="files[]" id="menuGallery" multiple="multiple"  ng-required="true">
						 </div>
						
						<div class="form-group">
							<label for="contact">Contact</label>
							<input type="text" class="form-control" name="contact" ng-model="contact"  ng-required="true">
						</div>
						<div class="form-group">
							<label for="about">About</label>
							<input type="text" class="form-control" name="about" ng-model="about"  ng-required="true">
						</div>
						<div class="form-group">
							<label for="open_close">Open - Close</label>
							<input type="text" name="open_close" class="form-control" ng-model="open_close" placeholder="6:00 AM - 8:00 PM"  ng-required="true"/>
						</div>
					</div> 
					<div class="col-md-5">
						<div class="form-group">
							<label for="open_close">City / Province</label>
							<select name="province" ng-model="province" class="form-control" 
							ng-change="getDistrict(province)" id="province"  ng-required="true">
								<option>------ Select Province ------</option>
							
								<option ng-repeat="province in provinces" 
									value="{{province.ID}}">{{province.NAME}}</option>
							</select>
						</div>
						<div class="form-group">
							<label for="district">District / Khan</label>
							<select class="form-control" name="district" ng-model="district" 
								ng-change="getCommune(district)" id="district"  ng-required="true">
								<option selected>------ Select District ------</option>
								
								<option ng-repeat="district in districts" 
									value="{{district.ID}}">{{district.NAME}}</option>
							</select>
						</div>
						<div class="form-group">
							<label for="commune">Commune / Sangkat</label>
							<select class="form-control" name="communce" ng-model="communce" 
								ng-change="getVillage(communce)" id="communce"  ng-required="true">
								<option >------ Select Commune ------</option>
								
								<option ng-repeat="commune in communes" 
									value="{{commune.ID}}">{{commune.NAME}}</option>
							</select>
						</div>
						<div class="form-group">
							<label for="village">Village / Krom</label>
							<select class="form-control" name="village" ng-model="village" id="village"  ng-required="true">
								<option  >------ Select Village ------</option>
								
								<option ng-repeat="village in villages" value="{{village.ID}}">{{village.NAME}}</option>
							</select>
						</div>
						<div class="form-group">
							<div class="form-group">
							<label for="street_number">Street Number</label>
							<input type="text" class="form-control" value="{{street_number}}" name="street_number" ng-model="street_number" ng-required="true">
						</div>
							
							<%-- <a href="${pageContext.request.contextPath}/admin/restaurant" target="_self""> --%>
							<button type="button" class="btn btn-blue btn-block"
								ng-disabled="frmUpdateRest.$invalid" ng-click="updateRestaurant($event)">
								<i class="fa fa-floppy-o"> Save</i></button><!-- </a> -->
						</div>
					  </div> 
				
				</div><!-- ==============  end Panel ===================== -->
				
			</div>
		</div><!-- ==============  end col-md-12 ===================== -->
	</div><!-- ==============  end row ===================== -->
</form>
</section>
	
	
	
	
	