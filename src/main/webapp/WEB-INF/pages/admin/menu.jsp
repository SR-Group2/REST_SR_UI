<div ng-controller = "restypeCtrl">
		<div class="card-header">
		<a href = "${pageContext.request.contextPath}/admin/addRestype">
			<button class = "btn btn-success"><i class="fa fa-plus"></i> Add </button></a>
			  <div class="form-group pull-md-right col-md-5">
			    <div class="input-group ">
			      <input type="text" class="form-control" ng-model="search" id="search" placeholder="search......">
			      <div class="input-group-addon">Search</div>
			    </div>
			  </div>
		</div>
		<h3>Restaurants' Types</h3>
		<div>
		<table class="table table-bordered table-striped datatable">
			<thead>
				<tr>
					<th>ID</th>
					<th>Category KH</th>
					<th>Category EN</th>
					<th>Pictures</th>
					<th>Description</th>
					<th>Actions</th>
				</tr>
			</thead>
			
			<tbody>
				<tr ng-repeat ="restype in restypes | filter:search">
					<td>{{$index+1}}</td>
					<td>{{restype.restype_name_kh}}</td>
					<td>{{restype.restype_name}}</td>
					<td><img src="http://localhost:9999{{restype.restype_picture}}"/></td>
					<td>{{restype.description}}</td>
					<td>
						<a href="#" class="btn btn-default btn-sm btn-icon icon-left">
							<i class="entypo-pencil"></i>
							Edit
						</a>
						
						<button type="button" class="btn btn-red btn-icon icon-left" ng-click="deleteRestype(restype.restype_id)">
								<i class="entypo-cancel"></i>Delete</button>
					</td>
				</tr>
				</tbody>
				</table>
				
		<!-- ================= Pagination ===================== -->
				<div id="pagination" class="pull-right">
												
				</div>
	</div>
</div>	 
				 