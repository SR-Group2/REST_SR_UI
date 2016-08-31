<div ng-controller="commentCtrl">
<div ng-controller="restCtrl">
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
		<fieldset>
			<div class="panel-body">
				
					<div class="row">
						<div class="col-md-12">
						<form name="commentInfo">
							<div class="col-md-4">
									<div class="form-group">
									    <label for="rest_name">Restaurant Name</label>
									      <select class="form-control" name="rest_name" ng-model="$parent.rest_id" required 
									      ng-options="restaurant.rest_id as restaurant.rest_name for restaurant in restaurants">
											<option value="">--- Select Restaurant ---</option>
									      </select>
									    
									  </div>
								   </div> 
								<div class="col-md-4">
								<div class="form-group">
									<label for="first_name">Comment</label>
									<textarea class="form-control " ng-model="$parent.comment" name="comment" rows = "6"></textarea>
									<br>
									<a href="${pageContext.request.contextPath}/admin/comment" target="_self">
									<button type="button" class="btn btn-green" ng-disabled="commentInfo.first_name.$invalid || brandInfo.last_name.$invalid ||brandInfo.rest_name.$invalid || brandInfo.comment.$invalid" ng-click="addComment($event)" data-dismiss="modal">
										<i class="fa fa-plus" aria-hidden="true"> Add Comment</i></button>
										<button type="button" class="btn btn-green" data-dismiss="modal">
										<i class="fa fa-eye" aria-hidden="true"> View Comment</i></button></a>
								</div>
							</div>
						</form>	 
 						</div>
						</div>
						</div>
					</fieldset>
				</div>
		</div>
		
	<!-- =========== End Panel ========== -->	
	</div>
	</div>
</div>