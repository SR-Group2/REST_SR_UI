var app= angular.module('app',['angularUtils.directives.dirPagination','btorfs.multiselect']);

//================================ User Controler Pheara =======================================
app.controller('mainCtrl', function( $scope, $http, $filter){
	
				$scope.getAllUsers=function(){
					$http.get('http://localhost:8080/rest/user').then(function(response){
						$scope.users=response.data.DATA;
					});
				}
				$scope.getAllUsers();
				$scope.clearInput = function(){
					
					$('#frmUser')[0].reset();
				}		
				
				$scope.getGender=function(gender){
					$scope.gender=gender;
				}
				$scope.addUser=function(){
					data={
							"first_name": $scope.txtfirstname,
							"last_name": $scope.txtlastname,
							"username": $scope.txtusername,
							 "email": $scope.txtemail,
							"password": $scope.txtpassword,
							"dob": $('input[name=dob]').val(),
							'gender': $scope.txtgender,
							"picture": "string",
							"role": {
								"id": $scope.roles
							  }
							
							};
					$http.post('http://localhost:8080/rest/user', data).then(function(response){
						$scope.getAllUsers();
						swal("Successfully Inserted!", "You clicked the button!", "success");
						$scope.clearInput();
						
					});
				}
				
				
				$scope.deleteUsers=function(id){	
					swal({   title: "Are you sure?",
						text: "You will not be able to recover this imaginary file!",
						type: "warning",
						showCancelButton: true,
						confirmButtonColor: "#DD6B55",
						confirmButtonText: "Yes, delete it!",
						cancelButtonText: "No, cancel",
						closeOnConfirm: false,
						closeOnCancel: false },
						function(isConfirm){
							if (isConfirm) {   
								
								$http.delete('http://localhost:8080/rest/user/'+id).then(function(response){
									$scope.getAllUsers();
								});
								
								swal("Deleted!",
									"Your imaginary file has been deleted.",
									"success");   
							} else {     
								swal("Cancelled", "Your imaginary file is safe :)", "error");   
							} 
					});
	
				}
				$scope.getUserById=function(id){			
					$http.get('http://localhost:8080/rest/user/'+id).then(function(response){
						
						$scope.id= response.data.DATA.user_id;
						$scope.firstName= response.data.DATA.first_name;
						$scope.lastName=response.data.DATA.last_name;
						$scope.username=response.data.DATA.username;
						$scope.email=response.data.DATA.email;
						$scope.password=response.data.DATA.password;
						$scope.dob =  $filter('date')(response.data.DATA.dob, 'yyyy-MM-dd');
						$scope.gender= response.data.DATA.gender;
						$scope.roles=response.data.DATA.role.id + '';
					});					
				}
				$scope.updateUser=function(){
					data={
							'user_id':$scope.id,
							'first_name':$scope.firstName,
							'last_name':$scope.lastName,
							'username':$scope.username,
							'email': $scope.email,
							'password':$scope.password,
							'dob':$scope.dob,
							'gender':$scope.gender,
							'role': {
								'id': $scope.roles
							}
						}
					console.log(data);
					$http.put('http://localhost:8080/rest/user',data).then(function(response){
						swal("Update Successfully!", "You clicked the button!", "success");
						$scope.getAllUsers();
					});
				}	
		
});

//================================ End User Controoerl =======================================
//Resturan Controller
app.controller('RestaurantCtrl',function($scope,$http){
		
		$scope.restaurants='';
		$scope.getRestaurant=function(){		
		$http.get('http://localhost:8080/rest/restaurant').then(function(response){
			$scope.restaurants=response.data.DATA;
		});
		}
		$scope.getRestaurant();
		$scope.addRestaurant= function(){
			data={
					  "rest_name": $scope.txtrestname,
					  "contact": $scope.txtcontact,
					  "about": $scope.txtabout,
					  "open_close": $scope.txttime,
					  "location": $scope.txtlocation
			}
			$http.post('http://localhost:8080/rest/restaurant', data).then(function(response){
			});
		}
		
		$scope.deleteRestaurant=function(id){
			$http.delete('http://localhost:8080/rest/restaurant/'+id).then(function(response){
				$scope.getRestaurant();
			});
		}
});

/*====================== Category Controller Pheara ========================================*/
app.controller("categoryCtrl", function($scope, $http){
	$scope.getAllCategory= function(){	
		$http.get('http://localhost:8080/rest/category').then(function(response){
			$scope.category= response.data.DATA;
		});
	}
	$scope.getAllCategory();
	
	$scope.addCategory=function(){
		data={
				'category_name': $scope.txtcategory_name
		}
		$http.post('http://localhost:8080/rest/category',data).then(function(response){
			swal("Successfully Inserted!", "You clicked the button!", "success");
			$scope.getAllCategory();
		});
	}
	
	$scope.deleteCategory = function (id){
		swal({   title: "Are you sure?",
			text: "You will not be able to recover this imaginary file!",
			type: "warning",
			showCancelButton: true,
			confirmButtonColor: "#DD6B55",
			confirmButtonText: "Yes, delete it!",
			cancelButtonText: "No, cancel",
			closeOnConfirm: false,
			closeOnCancel: false },
			function(isConfirm){
				if (isConfirm) {   
					$http.delete('http://localhost:8080/rest/category/'+id).then(function(response){
						$scope.getAllCategory();
					});
					
					swal("Deleted!",
						"Your imaginary file has been deleted.",
						"success");   
				} else {     
					swal("Cancelled", "Your imaginary file is safe :)", "error");   
				} 
		});
	}
	$scope.getCategoryById= function(id){
		$http.get('http://localhost:8080/rest/category/'+id).then(function(response){
			$scope.category=response.data.DATA;
			$scope.category_id= response.data.DATA.category_id;
			$scope.category_name= response.data.DATA.category_name;
		});
	}
	$scope.updateCategory= function(){
		data={
				'category_id': $scope.category_id,
				'category_name': $scope.category_name
		}
		$http.put('http://localhost:8080/rest/category/',data).then(function(response){
			$scope.getAllCategory();
		});
	}
});

/*====================== Category Controller Pheara ========================================*/


/*====================== Vote Controller Pheara ===========================================*/
app.controller('voteCtrl',function($scope,$http){
	
		$scope.getVotes= function(){
			$http.get('http://localhost:8080/rest/vote').then(function(response){
				$scope.votes= response.data.DATA;
				console.log($scope.votes);
			});
		}
		$scope.getVotes();
		$scope.deleteVote= function(id){
			swal({   title: "Are you sure?",
				text: "You will not be able to recover this imaginary file!",
				type: "warning",
				showCancelButton: true,
				confirmButtonColor: "#DD6B55",
				confirmButtonText: "Yes, delete it!",
				cancelButtonText: "No, cancel",
				closeOnConfirm: false,
				closeOnCancel: false },
				function(isConfirm){
					if (isConfirm) {   
						$http.delete('http://localhost:8080/rest/vote/'+id).then(function(response){
							$scope.getVotes();
						});
						
						swal("Deleted!",
							"Your imaginary file has been deleted.",
							"success");   
					} else {     
						swal("Cancelled", "Your imaginary file is safe :)", "error");   
					} 
			});
		}
});
/*====================== Vote Controller Pheara ===========================================*/











