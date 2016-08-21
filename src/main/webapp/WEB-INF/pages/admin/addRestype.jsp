<section class="add_restaurant"  ng-controller="restypeCtrl">
	<h2>Add Restaurant Type	</h2>
	<br />
	<form name="frmAddRest" id="frmAddRest">
	<div class="row">
		<div class="col-md-12">
			
			<div class="panel panel-primary" data-collapsed="0">
			
				<div class="panel-heading">
					<div class="panel-title">
						Fill Restaurant Type
					</div>
					
					<div class="panel-options">
						<a href="#sample-modal" data-toggle="modal" data-target="#sample-modal-dialog-1" class="bg"><i class="entypo-cog"></i></a>
						<a href="#" data-rel="collapse"><i class="entypo-down-open"></i></a>
						<a href="#" data-rel="reload"><i class="entypo-arrows-ccw"></i></a>
						<a href="#" data-rel="close"><i class="entypo-cancel"></i></a>
					</div>
				</div>
				<div class="panel-body">
					<!--  ======== Form Add Restaurant Type ============= -->
				
					<div class="col-md-5">
						<div class="form-group">
							<label for="rest_name">Restaurant Type Name</label>
							<input type="text" class="form-control" name="restype_name" ng-model="restype_name" placeholder="Ex. Khmer Food, BBQ,..." required>
						</div>
						<div class="form-group">
							<label for="rest_name">Restaurant Type Name In Khmer</label>
							<input type="text" class="form-control" name="restype_name_kh" ng-model="restype_name_kh" placeholder="Ex........." required>
						</div>
						<div class="form-group">
							<label for="about">Description</label>
							<input type="text" class="form-control" name="description" ng-model="description" placeholder="Ex. Khmer Food is very Tasty..." required>
						</div>	
					</div> 
					<div class="col-md-5">
					
						<div class="form-group">
							<label for="rest_name">Restaurant Menu Picture</label>
							<input type="file" class="form-control file2 btn btn-orange"
							 multiple="1" data-label="<i class='glyphicon glyphicon-circle-arrow-up'></i> 
							 &nbsp;Browse Files" style="left: -8.75px; top: -1.5px;"  name="restype_picture" id="menu" ng-model = "restype_picture" required>
						</div>
							<br>
							<a href="${pageContext.request.contextPath}/admin/menu" target="_self">
							<button type="button" class="btn btn-blue btn-block" ng-click="addRestype()">
								<i class="fa fa-floppy-o"> Adding</i></button></a>
						</div>
					   </div> 
					
				</div><!-- ==============  end Panel ===================== -->
			</div>
		</div><!-- ==============  end col-md-12 ===================== -->
	</div><!-- ==============  end row ===================== -->
</form>
</section>