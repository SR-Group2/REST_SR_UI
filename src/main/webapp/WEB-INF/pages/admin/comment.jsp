<div ng-controller="commentCtrl">
<div class="col-md-12">
	<div class="well">
		<a href="${pageContext.request.contextPath}/admin/addComment" target="_self""><button type="button" class="btn btn-green btn-icon icon-left">
		<i class="entypo-plus-circled"></i>Add Comment</button></a>
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
							<th>Restaurant Name</th>
							<th>Comment</th>
							<th>Action</th>
						</tr>
					</thead>
					<tbody>
						<tr ng-repeat="comment in comments">
							<td>{{$index+1}}</td>
							<td>{{comment.user.first_name}}</td>
							<td>{{comment.user.last_name}}</td>
							<td>{{comment.rest.rest_name}}</td>
							<td>{{comment.comment}}</td>
							<td><button type="button" class="btn btn-green btn-icon icon-left" data-toggle="modal" data-target="#btnUpdate" ng-click="getCommentById(comment.comment_id)">
							<i class="fa fa-pencil-square-o"></i> Edit</button> <button type="button" class="btn btn-red btn-icon icon-left" ng-click="deleteComment(comment.comment_id)">
							<i class="fa fa-trash-o"></i> Delete</button></td>
							
						</tr>
					</tbody>
				
				</table>
				<div class="col-md-6 pull-right text-right">
					<ul class="pagination">
						<li><a href="#">
							<i class="entypo-left-open-mini"></i>
						</a></li>
						<li class="active"><a href="#">1</a></li>
						<li><a href="#">2</a></li>
						<li><a href="#">3</a></li>
						<li><a href="#">
							<i class="entypo-right-open-mini"></i>
						</a></li>
					</ul>
				</div>
		</div>	
</div>	
		
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
					    <label for="comment" class="col-sm-2 control-label">Comment</label>
					    <div class="col-sm-10">
					      <input type="text" class="form-control" value="{{comment}}"  ng-model="comment" required>
					    </div>
					  </div>
					  <div class="form-group">
					    <div class="col-sm-offset-2 col-sm-10">
					      <input type="button" class="btn btn-green btn-icon" ng-click="updateComment()"  value="Update" data-dismiss="modal" >
					    </div>
					  </div>
				</form>
				
		      </div>
		    </div>
		  </div>
		</div>
		<!-- ================== End Modal Update ================== -->		
		