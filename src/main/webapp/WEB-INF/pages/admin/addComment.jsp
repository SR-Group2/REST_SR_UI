<div ng-controller="commentCtrl">
<div class="col-md-12">	
	<div class="well">
		<h2 class="">COMMENT</h2>
	</div>
<div class="frmadd">
	<!-- =========== Panel ========== -->	
	<div class="card card-outline-secondary">
		<div class="card-header">
			<h3 class="card-title">COMMENT INFORMATION</h3>
		</div>
			<div class="panel-body">
				<fieldset>
					<div class="row">
						<div class="col-md-12">
						<form name="commentInfo">
							<div class="col-md-4">
								<div class="form-group">
									<label for="first_name">First Name</label>
									<input type="text" class="form-control" name="first_name" ng-model="first_name" required>
								</div>
								<div class="form-group">
									<label for="last_name">Last Name</label>
									<input type="text" class="form-control" name="last_name" ng-model="last_name" required>
								</div>
									<div class="form-group">
									    <label for="rest_name">Restaurant Name</label>
									      <select class="form-control" name="rest_name" ng-model="rest_name" required>
									      		<option selected>--Select Restaurant Name--</option>
									      		<option value="1">ABC</option>
									      		<option value="2">ABC</option>
									      		<option value="3">ABC</option>
									      </select>
									    
									  </div>
								   </div> 
								<div class="col-md-4">
								<div class="form-group">
									<label for="first_name">Comment</label>
									<textarea type="text" class="form-control " ng-model="comment" name="comment" rows = "6"></textarea>
									<br>
									<a href="${pageContext.request.contextPath}/admin/comment" target="_self""><button type="button" class="btn btn-success" ng-disabled="commentInfo.first_name.$invalid || brandInfo.last_name.$invalid ||brandInfo.rest_name.$invalid || brandInfo.comment.$invalid" ng-click="addComment()" data-dismiss="modal">
										<i class="fa fa-pencil" aria-hidden="true"> Add Comment</i></button></a>
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