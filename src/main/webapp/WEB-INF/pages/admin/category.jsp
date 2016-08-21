<div ng-controller="categoryCtrl">
	<div class="col-md-12">
	<div class="card card-outline-secondary">
		
		<div class="card-header">
			  <button class="btn btn-success" data-toggle="modal" data-target="#btnAdd"  >Add New Category</button>
			  <div class="form-group pull-md-right col-md-5">
			    <div class="input-group ">
			      <input type="text" class="form-control" ng-model="search" id="search" placeholder="search......">
			      <div class="input-group-addon">Search</div>
			    </div>
			  </div>
		</div>
				<table class="table table-striped">
					<thead class="thead-inverse">
						<tr>
							<th>#</th>					
							<th>Menu Name</th>
							<th>Other</th>
							<th>Date Add</th>
							<th>Date Modify</th>
							<th>Picture</th>
							<th>Action</th>
						</tr>
					</thead>
					<tbody>
						<!-- <tr ng-repeat=" user in users | filter:search | limitTo: pageSize"> -->
						<tr dir-paginate="cat in category | filter:search|itemsPerPage:10">
							<td>{{$index+1}}</td>
							<td>{{cat.category_name}}</td>
							<td>{{cat.other}}</td>
							<td>{{cat.date_added | date: "yyyy-MM-dd"}}</td>
							<td>{{cat.date_modify | date: "yyyy-MM-dd"}}</td>
							<td>{{cat.picture}}</td>
							<td>
							<button type="button" class="btn btn-success btn-sm" data-toggle="modal" data-target="#btnUpdate" ng-click="getCategoryById(cat.category_id)">
							<i class="fa fa-pencil-square-o"></i>Update Category</button> <button type="button" class="btn btn-danger btn-sm" ng-click="deleteCategory(cat.category_id)">
							<i class="fa fa-trash-o"></i> Delete</button></td>
							
						</tr>
					</tbody>
				
				</table>
				<div class="text-md-center">
				<!-- <dir-pagination-controls
			       max-size="5"
			       direction-links="true"
			       boundary-links="true" >
			    </dir-pagination-controls> -->
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
</div>	
	<!-- ================== Modal Add New Category ================== -->		
		<div class="modal fade" id="btnAdd" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
		  <div class="modal-dialog" role="document">
		    <div class="modal-content">
		      <div class="modal-header">
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
		        <h4 class="modal-title" id="myModalLabel">Operation</h4>
		      </div>
		      <div class="modal-body">
		        <form class="form-horizontal" name="frmUpdate">
		        	
					  <div class="form-group">
					    <label for="" class="col-sm-3 control-label">Category Name</label>
					    <div class="col-sm-9">
					      <input type="text" class="form-control"  ng-model="txtcategory_name" name="category_name" required>
					    </div>
					  </div>
					  <div class="form-group">
					    <div class="col-sm-offset-3 col-sm-9">
					      <input type="button" class="btn btn-success" ng-click="addCategory()"  value="Add" data-dismiss="modal" >
					    </div>
					  </div>
					  
				</form>
				
		      </div>
		    </div>
		  </div>
		</div>
		<!-- ================== End Modal Add New Category ================== -->		
	
	
		<!-- ================== Modal Update ================== -->		
		<div class="modal fade" id="btnUpdate" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
		  <div class="modal-dialog" role="document">
		    <div class="modal-content">
		      <div class="modal-header">
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
		        <h4 class="modal-title" id="myModalLabel">Operation</h4>
		      </div>
		      <div class="modal-body">
		        <form class="form-horizontal" name="frmUpdate">
		        	
					  <div class="form-group">
					    <label for="" class="col-sm-3 control-label">Category Name</label>
					    <div class="col-sm-9">
					      <input type="text" class="form-control" value="{{category_name}}"  ng-model="category_name" name="updatecategory_name" required>
					    </div>
					  </div>
					  <div class="form-group">
					    <div class="col-sm-offset-3 col-sm-9">
					      <input type="button" class="btn btn-success" ng-click="updateCategory()"  value="Update" data-dismiss="modal" >
					    </div>
					  </div>
					  
				</form>
				
		      </div>
		    </div>
		  </div>
		</div>
		<!-- ================== End Modal Update ================== -->		
</div>