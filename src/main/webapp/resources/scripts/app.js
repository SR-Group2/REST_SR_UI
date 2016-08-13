var app= angular.module('app',['angularUtils.directives.dirPagination']);
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
				
				$scope.getRoleId = function(roles){
					$scope.role_id = parseInt(roles);
				}
				$scope.getDay=function(day){
					$scope.bday=parseInt(day);
				}
				$scope.getMonth=function(month){
					$scope.bmonth=parseInt(month);
				}
				$scope.getYear=function(year){
					$scope.byear=parseInt(year);
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
								"id": $scope.role_id
							  }
							
							};
					console.log(data);
					$http.post('http://localhost:8080/rest/user', data).then(function(response){
						$scope.getAllUsers();
						swal("Successfully Inserted!", "You clicked the button!", "success")
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
						$scope.roles=response.data.DATA.role.id;	
						console.log(response);
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
								'id': $scope.role_id
							}
						}
					console.log(data);
					$http.put('http://localhost:8080/rest/user',data).then(function(response){
						swal("Update Successfully!", "You clicked the button!", "success");
						$scope.getAllUsers();
					});
				}
/*=========================== Pagination ====================================*/
		
				
				
				
				
/*=========================== End Pagination ====================================*/		
		
});

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


/* ================================= Brand Controller by Phanit =======================================*/
app.controller('brandCtrl', function($scope, $http) {
	$scope.brands = '';

	$scope.getAllBrand = function () {
	
    $http.get('http://localhost:8080/rest/brand')
    .then(function (response) {
    	$scope.brands = response.data.DATA;
    }),function () {
    	
    };

 }	
 $scope.getAllBrand();
 
$scope.addBrand = function(){
	$http({
		url: 'http://localhost:8080/rest/brand',
		data:{
			contact: $scope.contact,
			"rest": {
				rest_id: $scope.rest_id
			},
			"address": {
				address_id: $scope.address_id
			},
		},
		method:'POST'
	}).then(function(response){
		$scope.getAllBrand();
		contact: $scope.contact = '';
		rest_id: $scope.rest_id = '';
		address_id: $scope.address_id = '';
	},function(){

		});

	}
	$scope.getBrandById = function(brand_id){
		$http({
			url: 'http://localhost:8080/rest/brand/'+brand_id,
			method:'GET'
		}).then(function(response){
			console.log(response);
			$scope.brand = response.data.DATA;
			$scope.contact = response.data.DATA.contact;
			$scope.rest_name = response.data.DATA.rest.rest_name;
			$scope.brand_id = response.data.DATA.brand_id;
			$scope.rest_name = response.data.DATA.rest.rest_name;
			$scope.address_id = response.data.DATA.address.address_id;
			$scope.street = response.data.DATA.address.street;
			$scope.district = response.data.DATA.address.district;
			$scope.communce = response.data.DATA.address.communce;
			$scope.province = response.data.DATA.address.province;
			
		},function(){

		});
		
	}
	$scope.updateBrand = function(){
		data={
				brand_id: $scope.brand_id,
				contact: $scope.contact,
				"rest":{
					rest_name: $scope.rest_name
				},
				"address":{
					street: $scope.street,
					district: $scope.district,
					communce: $scope.communce,
					province: $scope.province
				}
			}
		$http.put('http://localhost:8080/rest/brand',data).then(function(response){
			alert('success');
			console.log(data);
			console.log(response);
			
		});
//		$http({
//			url: 'http://localhost:8080/rest/brand',
//			data:{
//				brand_id: $scope.brand_id,
//				contact: $scope.contact,
//				"rest":{
//					rest_name: $scope.rest_name,
//				},
//				"address":{
//					street: $scope.street,
//					district: $scope.district,
//					communce: $scope.communce,
//					province: $scope.province,
//				},
//			},
//			method:'PUT'
//		}).then(function(response){
//			$scope.getAllBrand();
//			$scope.rest_name = '';
//			$scope.street = '';
//			$scope.district = '';
//			$scope.communce = '';
//			$scope.province = '';
//		},function () {
//			
//		});
	}
	$scope.deleteBrand = function(brand_id) {
		$http.delete('http://localhost:8080/rest/brand/' + brand_id)
		.then(function(response){
			$scope.getAllBrand();
		});	
	}
});


/* ================================ Comment Controller ================================ */

app.controller('commentCtrl', function($scope, $http) {
	$scope.comments = '';

	$scope.getAllComment = function () {
	
    $http.get('http://localhost:8080/rest/comment')
    .then(function (response) {
    	
    	$scope.comments = response.data.DATA;
    	console.log($scope.comments);
    });
    
	}
    
    $scope.getAllComment();
    
    $scope.getCommentById = function(comment_id){
   		$http({
   			url: 'http://localhost:8080/rest/comment/'+ comment_id,
   			method:'GET'
   		}).then(function(response){
   			$scope.comment = response.data.DATA;
   			$scope.first_name = response.data.DATA.user.first_name;
   			$scope.last_name = response.data.DATA.user.last_name;
   			$scope.comment = response.data.DATA.comment;
   			
   		},function(){

   		});
   		
   	}
    
    $scope.addComment = function(){
    	$http({
    		url: 'http://localhost:8080/rest/comment',
    		data:{
    			comment: $scope.comment
    		},
    		method:'POST'
    	}).then(function(response){
    		 $scope.getAllComment();
    	},function(){

    		});

    	}
 });





