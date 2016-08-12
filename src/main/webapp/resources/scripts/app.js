var app= angular.module('app',[]);

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
							"dob": $('input[name=dob]').val(),
							"picture": "string",
							"username": $scope.txtusername,
							"password": $scope.txtpassword,
							"role": {
								"id": $scope.role_id
							  },
							 "email": $scope.txtemail
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
						$scope.roles=response.data.DATA.role.id;
						
						
					});
					
				}
				$scope.updateUser=function(){
					console.log($scope.id);
					data={
							'user_id':$scope.id,
							'first_name':$scope.firstName,
							'last_name':$scope.lastName,
							'username':$scope.username,
							'email': $scope.email,
							'password':$scope.password,
							'dob':$scope.dob,
							'role': {
								'id': $scope.role_id
							}
						}
					
					$http.put('http://localhost:8080/rest/user',data).then(function(response){
						swal("Update Successfully!", "You clicked the button!", "success");
						$scope.getAllUsers();
						console.log(reponse);
					});
				}
			});

/* ================================= Restaurant Controller by Phanit =======================================*/
app.controller('RestaurantCtrl',function($scope,$http){
		
		$scope.restaurants='';
		$scope.getRestaurants = function(){		
		$http.get('http://localhost:8080/rest/restaurant').then(function(response){
			$scope.restaurants=response.data.DATA;
		});
		}
		$scope.getRestaurants();
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
		
		$scope.deleteRestaurant=function(rest_id){
			$http.delete('http://localhost:8080/rest/restaurant/'+rest_id).then(function(response){
				$scope.getRestaurant();
			});
		}
		$scope.updateRestaurant = function(){
			console.log($scope);
			data={
					'rest_id':$scope.rest_id,
					'rest_name':$scope.rest_name,
					'contact':$scope.contact,
					'about':$scope.about,
					'open_close': $scope.open_close,
					'location':$scope.location,
					"restypes":{
						'restype':$scope.restye_name
					}
				}
			
			$http.put('http://localhost:8080/rest/restaurant',data).then(function(response){
				swal("Update Successfully!", "You clicked the button!", "success");
				$scope.getRestaurants();
				console.log(reponse);
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
 
 $scope.clearBrandForm = function(){
	
		contact: $scope.contact = '';
		rest_id: $scope.rest_id = '';
		rest_name: $scope.rest_name = '';
		street: $scope.street = '';
		district: $scope.district ='';
		communce: $scope.communce = '';
		province: $scope.province = '';
		address_id: $scope.address_id = '';
	 
 }
 
$scope.addBrand = function(){
	$http({
		url: 'http://localhost:8080/rest/brand',
		data:{
			contact: $scope.contact,
			"rest": {
				rest_id: $scope.rest_id,
				rest_name: $scope.rest_name
			},
			"address": {
				address_id: $scope.address_id,
				street: $scope.street,
				district: $scope.district,
				communce: $scope.communce,
				province: $scope.province
			},
		},
		method:'POST'
	}).then(function(response){
		 $scope.getAllBrand();
	},function(){

		});

	}
	$scope.getBrandById = function(brand_id){
		$http({
			url: 'http://localhost:8080/rest/brand/'+brand_id,
			method:'GET'
		}).then(function(response){
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
				},
			},
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