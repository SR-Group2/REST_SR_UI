<div ng-controller = "restypeCtrl">
		<div class="card-header">
		<a href = "${pageContext.request.contextPath}/admin/addRestype"><button class = "btn btn-success">Add New Restaurant Type</button></a>
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
					<th>Restaurant Type Name In English</th>
					<th>Restaurant Type Name In Khmer</th>
					<th>Restaurant Pictures</th>
					<th>Description</th>
					<th>Date Added</th>
					<th>Date Modified</th>
					<th>Actions</th>
				</tr>
			</thead>
			
			<tbody>
			
				<tr ng-repeat ="restype in restypes">
					<td>{{restype.restype_name}}</td>
					<td>{{restype.restype_name_kh}}</td>
					<td>{{restype.restype_picture}}</td>
					<td>{{restype.description}}</td>
					<td>{{restype.date_added}}</td>
					<td>{{restype.date_modify}}</td>
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
		<ul class="pagination"> <li><a href="#"><i class="entypo-left-open-mini">
					</i></a></li> <li class="active"><a href="#">1</a></li> <li><a href="#">2</a></li>
					 <li><a href="#">3</a></li> 
					 <li><a href="#">4</a></li> 
					 <li><a href="#">5</a></li> 
					 <li><a href="#">6</a></li> 
					 <li><a href="#"><i class="entypo-right-open-mini"></i></a></li> 
				 </ul>
	</div>
</div>	 
				 