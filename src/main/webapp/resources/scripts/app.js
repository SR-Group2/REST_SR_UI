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
				$scope.getDay=function(day){
					$scope.bday=parseInt(day);
				}
				$scope.getMonth=function(month){
					$scope.bmonth=parseInt(month);
				}
				$scope.getYear=function(year){
					$scope.byear=parseInt(year);
				}
//				$scope.getDOB= function(){
//					$scope.dob= $scope.bday+'-'+$scope.bmonth+'-'+ $scope.byear;
//				}
				$scope.addUser=function(){
					data={
							"first_name": $scope.txtfirstname,
							"last_name": $scope.txtlastname,
							"dob": $scope.dob,
							"picture": "string",
							"USERNAME": $scope.txtusername,
							"PASSWORD": $scope.txtpassword,
							"ROLE": {
								"ID": $scope.role_id
							  },
							 "EMAIl": $scope.txtemail
							};
					console.log(data);
					$http.post('http://localhost:8080/rest/user', data).then(function(response){
						alert('success');
						$scope.getAllUsers();
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
						$scope.roles=response.data.DATA.ROLE.ID;
						console.log(response);
						alert($scope.roles);
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
							'ROLE': {
								    'ID': $scope.role_id
								  }
						}
					console.log(data);
					alert("success");
					$http.put('http://localhost:8080/rest/user',data).then(function(response){					 
						$scope.getAllUsers();
					});
				}
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
			console.log(data);
			$http.post('http://localhost:8080/rest/restaurant', data).then(function(response){
				alert('success');
			});
		}
		
		$scope.deleteRestaurant=function(id){
			$http.delete('http://localhost:8080/rest/restaurant/'+id).then(function(response){
				$scope.getRestaurant();
			});
		}
});