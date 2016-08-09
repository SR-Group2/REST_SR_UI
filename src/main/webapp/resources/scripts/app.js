var app= angular.module('myApp',[]);

app.controller('mainCtrl', function( $scope, $http){
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
				
				$scope.addUser=function(){
					
					data={
							  "first_name": $scope.txtfirstname,
							  "last_name": $scope.txtlastname,
							  "dob": $scope.txtdob,
							  "picture": "string",
							  "USERNAME": $scope.txtusername,
							  "PASSWORD": $scope.txtpassword,
							  "ROLE": {
							    "ID": 3
							  },
							  "EMAIl": $scope.txtemail
							};
					console.log(data);
					$http.post('http://localhost:8080/rest/user', data).then(function(response){
						
						alert("success");
					});
				}
				
				$scope.deleteUsers=function(id){
					$http.delete('http://localhost:8080/rest/user/'+id).then(function(response){
						$scope.getAllUsers();
					});
				}
				$scope.getUserById=function(id){
					$http.get('http://localhost:8080/rest/user/'+id).then(function(response){
						//$scope.users=response.data.DATA;
						$scope.id= response.data.DATA.ID;
						$scope.firstName= response.data.DATA.first_name;
						$scope.lastName=response.data.DATA.last_name;
						$scope.username=response.data.DATA.USERNAME;
						$scope.email=response.data.DATA.EMAIl;
						$scope.password=response.data.DATA.PASSWORD;
						console.log(response);
					});
				}
				$scope.updateUser=function(){
					data={
							'ID':$scope.id,
							'first_name':$scope.firstName,
							'last_name':$scope.lastName,
							'USERNAME':$scope.username,
							'EMAIl': $scope.email,
							'PASSWORD':$scope.password
							}
					console.log(data);
//					$http.PUT('http://localhost:8080/rest/user',data).then(function(response){
//						 console.log(data);
//					});
				}
			});

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
					  "about": txtabout,
					  "open_close": txttime,
					  "location": txtlocation
			}
			console.log(data);
			$http.post('http://localhost:8080/rest/restaurant',data).then(function(response){
				alert('success');
			});
		}
		
		$scope.deleteRestaurant=function(id){
			$http.delete('http://localhost:8080/rest/restaurant/'+id).then(function(response){
				$scope.getRestaurant();
			});
		}
});