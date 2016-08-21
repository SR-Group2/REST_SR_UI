var app= angular.module('app',[]);
app.controller('mainCtrl',function($scope, $http,$filter){
	$scope.getAllFavReste = function(){
		$scope.user_id = parseInt($("#user_id").text());
		$http.get('rest/favourite-restaurant/get-fav-rest-by-user-id/'+$scope.user_id).then(function(response){
			$scope.favouriteRestaurants = response.data.DATA;	
			$scope.user = $scope.favouriteRestaurants[0].user;
			console.log($scope.favouriteRestaurants);
		});
	}
	$scope.getAllFavReste();

// ========================= Update User ==============================
	var id = window.location.href.substring(window.location.href.lastIndexOf('/') + 1);

	$scope.getUserById=function(id){
		window.location.href= "http://localhost:8080/editeprofile/"+id;
	}
	
	$scope.userDetail=function(id){
	
		$http.get('http://localhost:8080/rest/user/'+id).then(function(response){
			$scope.id= response.data.DATA.user_id;
			$scope.firstName= response.data.DATA.first_name;
			$scope.lastName=response.data.DATA.last_name;
			$scope.username=response.data.DATA.username;
			$scope.email=response.data.DATA.email;
			$scope.password=response.data.DATA.password;
			$scope.dob =  $filter('date')(response.data.DATA.dob, 'yyyy-MM-dd');
			$scope.gender= response.data.DATA.gender;
		});	
	}
	
	$scope.userDetail(id);
	
	$scope.updateUser=function(){
		data={
				'user_id':id,
				'first_name':$scope.firstName,
				'last_name':$scope.lastName,
				'username':$scope.username,
				'email': $scope.email,
				'password':$scope.password,
				'dob': $('input[name="date"]').val(),
				'gender':$scope.gender,
				'role': {
					'id': 1
				}
			}
		$http.put('http://localhost:8080/rest/user',data).then(function(response){
			swal("Update Successfully!", "You clicked the button!", "success");
			window.location.href= "http://localhost:8080/login";
		});
	}	
	
	
	
});
app.controller('signUpCtrl', function($scope,$http){
	$scope.getAllUsers=function(){
		$http.get('/rest/user').then(function(response){
			$scope.users=response.data.DATA;
		});
	}
	$scope.getAllUsers();
	
	$scope.addUser=function(){
		data={
				"first_name": $scope.txtfirstname,
				"last_name": $scope.txtlastname,
				"username": $scope.txtusername,
				 "email": $scope.txtemail,
				"password": $scope.txtpassword,
				"dob": $('input[name=date]').val(),
				'gender': $scope.txtgender,
				"picture": "string"
				};
		console.log(data);
		return;
		$http.post('/rest/user/sign-up', data).then(function(response){
			swal("Successfully Registered!", "You clicked the button!", "success");
			window.location.href= "http://localhost:8080/login";
		});
	}


});





