<div ng-controller="ownerCtrl">
	<div id="table-1_wrapper" class="dataTables_wrapper form-inline">
		<div class="row">
			
			<div class="col-xs-12 col-left">
			
			<h4>Choose Owner Restaurant</h4>
			
				<div class="dataTables_length" id="table-1_length">

					  <div class="form-group pull-md-right col-md-5">
					    <div class="input-group ">
					      <input type="text" class="form-control" ng-model="search" id="search" placeholder="search......">
					      <div class="input-group-addon btn-blue">Search</div>
					    </div>
					  </div>
			  
				</div>
			</div>

		</div>

		
		<table class="table table-bordered datatable" id="table-1">
			<thead>
				<tr>
					        <th data-hide="phone">ID</th>
						
							<th>Full Name</th>
							<th>Username</th>
							<th>Email</th>
						
							<th>Gender</th>	
							
							<th>Action</th>
				</tr>
			</thead>

			<tbody>
			
				<!-- <tr ng-repeat=" user in users | filter:search | limitTo: pageSize"> -->
						<tr class="odd gradeX" dir-paginate="user in users|filter:search|itemsPerPage:10 | orderBy">
							<td>{{$index+1}}</td>
							<td>{{user.first_name}}  {{user.last_name}}</td>
							<td>{{user.username}}</td>
							<td>{{user.email}}</td>
						<!-- 	<td>{{user.dob | date: "yyyy-MM-dd"}}</td> -->
							<td>{{user.gender}}</td>
							<!-- <td>{{user.joined | date: "yyyy-MM-dd"}}</td> -->
							<td>
							<button type="button" class="btn btn-primary btn-sm" onclick="jQuery('#modal').modal('show');"
							ng-click="linkToAddRest(user.user_id)">
							<i class="fa fa-cutlery"></i> Add Restaurant</button>
							<button type="button" class="btn btn-info btn-sm" onclick="jQuery('#modal').modal('show');" ng-click="getUserById(user.user_id)">
							<i class="fa fa-hdd-o"></i> Status</button>
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
				<!-- <div class="text-md-center">-->
				<!-- ================= Pagination ===================== -->
				<!--  <ul class="pagination"> <li><a href="#"><i class="entypo-left-open-mini">
					</i></a></li> <li><a href="#">1</a></li> <li class="active"><a href="#">2</a></li>
					 <li><a href="#">3</a></li> 
					 <li><a href="#">4</a></li> 
					 <li><a href="#">5</a></li> 
					 <li><a href="#">6</a></li> 
					 <li><a href="#"><i class="entypo-right-open-mini"></i></a></li> 
				 </ul>
			  -->
		</div>
		
		
		
		<script type="text/javascript">
		var responsiveHelper;
		var breakpointDefinition = {
		    tablet: 1024,
		    phone : 480
		};
		var tableContainer;
		
			jQuery(document).ready(function($)
			{
				tableContainer = $("#table-1");
				
				tableContainer.dataTable({
					"sPaginationType": "bootstrap",
					"aLengthMenu": [[10, 25, 50, -1], [10, 25, 50, "All"]],
					"bStateSave": true,
					
		
				    // Responsive Settings
				    bAutoWidth     : false,
				    fnPreDrawCallback: function () {
				        // Initialize the responsive datatables helper once.
				        if (!responsiveHelper) {
				            responsiveHelper = new ResponsiveDatatablesHelper(tableContainer, breakpointDefinition);
				        }
				    },
				    fnRowCallback  : function (nRow, aData, iDisplayIndex, iDisplayIndexFull) {
				        responsiveHelper.createExpandIcon(nRow);
				    },
				    fnDrawCallback : function (oSettings) {
				        responsiveHelper.respond();
				    }
				});
				
				$(".dataTables_wrapper select").select2({
					minimumResultsForSearch: -1
				});
			});
		</script>
		
	

		
		
	
		
		
		