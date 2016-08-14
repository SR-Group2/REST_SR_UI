<div ng-controller="restaurantCtrl">
<div class="col-md-12">	
	<div class="well">
		<h2 class="">RESTAURANT</h2>
	</div>
<div class="frmadd">
	<!-- =========== Panel ========== -->	
	<div class="card card-outline-secondary">
		<div class="card-header">
			<h3 class="card-title">RESTAURANT INFORMATION</h3>
		</div>
			<div class="panel-body">
				<fieldset>
					<div class="row">
						<div class="col-md-12">
						<form name="restaurantInfo">
							<div class="col-md-4">
								<div class="form-group">
									<label for="rest_name">Restaurant Name</label>
									<input type="text" class="form-control" name="rest_name" ng-model="rest_name" required>
								</div>
								<div class="form-group">
									<label for="restype_id">Restaurant Type</label>
									<input type="text" class="form-control" name="restype_id" ng-model="restype_id" required>
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
									<input type="text" class="form-control" name="open_close" ng-model="open_close" required>
								</div>
							</div> 
								<div class="col-md-4">
								<div class="form-group">
									<label for="first_name">Comment</label>
									<textarea type="text" class="form-control " ng-model="comment" name="comment" rows = "6"></textarea>
									<br>
									<a href="${pageContext.request.contextPath}/admin/restaurant" target="_self""><button type="button" class="btn btn-success" ng-disabled="commentInfo.first_name.$invalid || brandInfo.last_name.$invalid ||brandInfo.rest_name.$invalid || brandInfo.comment.$invalid" ng-click="addComment()">
										<i class="fa fa-pencil" aria-hidden="true"> List Restaurant</i></button></a>
								</div>
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