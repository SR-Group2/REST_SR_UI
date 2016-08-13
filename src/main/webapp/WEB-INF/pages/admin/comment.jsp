<div ng-controller="commentCtrl">
<div class="col-md-12">
	<div class="well">
		<button type="button" class="btn btn-success" ng-click="clearCommentForm()" 
				data-toggle="modal" data-target="#btnAddComment">
		<i class="fa fa-plus-square-o" ></i> Add Comment</button>
	</div>
	<div class="card card-outline-secondary">
		<div class="card-header">
			<h3 class="card-title">Comment Information</h3>
		</div>
				<table class="table table-striped">
					<thead class="thead-inverse">
						<tr>
							<th>ID</th>
							<th>First Name</th>
							<th>Last Name</th>
							<th>Comment</th>
							<th>Action</th>
						</tr>
					</thead>
					<tbody>
						<tr ng-repeat="comment in comments">
							<td>{{$index+1}}</td>
							<td>{{comment.user.first_name}}</td>
							<td>{{comment.user.last_name}}</td>
							<td>{{comment.comment}}</td>
							<td><button type="button" class="btn btn-success" data-toggle="modal" data-target="#btnUpdate" ng-click="getCommentById(comment_id)">
							<i class="fa fa-pencil-square-o"></i> Edit</button> <button type="button" class="btn btn-danger" ng-click="deleteComment(comment_id)">
							<i class="fa fa-trash-o"></i> Delete</button></td>
							
						</tr>
					</tbody>
				
				</table>
		</div>	
</div>	
		<!-- Adding Brand Form -->
				  	<div class="modal fade" id="btnAddComment" role="dialog">
				    <div class="modal-dialog">
				      <div class="modal-content">
				        <div class="modal-header">
				          <button type="button" class="close" data-dismiss="modal">&times;</button>
				          <h4 class="modal-title">Add New Comment</h4>
				        </div>
				        <div class="modal-body">
				          <div class="modal-body">
							<form name="brandInfo">
								<div class="form-group row">
									<label for="contact" class="form-control-label col-sm-3 text-sm-center">Comment</label>
									<div class="col-sm-9">
										<input type="text" class="form-control" name="comment" ng-model="comment" required>
									</div>
								</div>
								<div class="form-group row">
									<div class="col-sm-offset-3 col-sm-10">
										<button type="button" class="btn btn-success btn-sm" ng-disabled="brandInfo.brand.$invalid || brandInfo.brand.$invalid " ng-click="addComment()" data-dismiss="modal"><i class="fa fa-pencil" aria-hidden="true"> Add Comment</i></button>
									</div>
								</div>
							</form>
							</div>
				        </div>
				      </div>
				    </div>
				  </div>
				 <!-- End of Adding Brand Form -->
		<!-- ================== Modal Update ================== -->		
		<div class="modal fade" id="btnUpdate" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
		  <div class="modal-dialog" role="document">
		    <div class="modal-content">
		      <div class="modal-header">
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
		        <h4 class="modal-title" id="myModalLabel">Comment</h4>
		      </div>
		      <div class="modal-body">
		        <form class="form-horizontal" name="frmUpdate">
		        	
					  <div class="form-group">
					    <label for="" class="col-sm-2 control-label">First Name</label>
					    <div class="col-sm-10">
					      <input type="text" class="form-control" value="{{first_name}}"  ng-model="first_name" name="first_name" required>
					    </div>
					  </div>
					  <div class="form-group">
					    <label for="" class="col-sm-2 control-label">Last Name</label>
					    <div class="col-sm-10">
					      <input type="text" class="form-control" value="{{last_name}}" ng-model="last_name"  name="last_name" required>
					    </div>
					  </div>
					  <div class="form-group">
					    <div class="col-sm-offset-2 col-sm-10">
					      <input type="button" class="btn btn-success" ng-click="updateComment()"  value="comment" data-dismiss="modal" >
					    </div>
					  </div>
				</form>
				
		      </div>
		    </div>
		  </div>
		</div>
		<!-- ================== End Modal Update ================== -->		
		