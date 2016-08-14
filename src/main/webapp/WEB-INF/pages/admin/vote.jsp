<div ng-controller="voteCtrl">
	<div class="col-md-12">
	<div class="card card-outline-secondary">
		
		<div class="card-header">
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
							<th>ID</th>
							<th>Number Vote</th>
							<th>Restaurant Name</th>
							<th>User Name</th>
							<th>Action</th>
						</tr>
					</thead>
					<tbody>
						<!-- <tr ng-repeat=" user in users | filter:search | limitTo: pageSize"> -->
						<tr dir-paginate="vote in votes | filter:search|itemsPerPage:10">
							<td>{{$index+1}}</td>
							<td>{{vote.vote_id}}</td>
							<td>{{vote.vote_number}}</td>
							<td>{{vote.rest.rest_name}}</td>
							<td>{{vote.user.first_name}} {{vote.user.last_name}}</td>
							<td><button type="button" class="btn btn-danger btn-sm" ng-click="deleteVote(vote.vote_id);">
							<i class="fa fa-trash-o"></i> Delete</button></td>
							
						</tr>
					</tbody>
				
				</table>
				<div class="text-md-center page">
				<dir-pagination-controls
			       max-size="5"
			       direction-links="true"
			       boundary-links="true" >
			    </dir-pagination-controls>
			    </div>	
		</div>	
</div>
</div>