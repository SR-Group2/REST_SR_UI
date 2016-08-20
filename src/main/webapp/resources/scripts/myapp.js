var app= angular.module('app',[]);
app.controller('mainCtrl',function($scope, $http){
	$scope.getAllFavReste = function(){
		$scope.user_id = parseInt($("#user_id").text());
		$http.get('rest/favourite-restaurant/get-fav-rest-by-user-id/'+$scope.user_id).then(function(response){
			$scope.favouriteRestaurants = response.data.DATA;	
			$scope.user = $scope.favouriteRestaurants[0].user;
		});
	}
	$scope.getAllFavReste();

	$scope.addFavRest= function(rest_id){
			$("#btnfav").text("Saved");
			$scope.user_id = parseInt($('#user_id').text());
		
			data={
					'user':{
						'user_id':$scope.user_id
					},
					'rest':{
						'rest_id':rest_id
					}	
			}
			$http.post('/rest/favourite-restaurant',data).then(function(response){
				alert('successfully added');
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
				"dob": $('input[name=dob]').val(),
				'gender': $scope.txtgender,
				"picture": "string",
				};
		$http.post('/rest/user/sign-up', data).then(function(response){
			$scope.getAllUsers();
			swal("Successfully Registered!", "You clicked the button!", "success");
			window.location.href= "http://localhost:8080/login";
		});
	}
	
});

app.directive('wjValidationError', function () {
	  return {
	    require: 'ngModel',
	    link: function (scope, elm, attrs, ctl) {
	      scope.$watch(attrs['wjValidationError'], function (errorMsg) {
	        elm[0].setCustomValidity(errorMsg);
	        ctl.$setValidity('wjValidationError', errorMsg ? false : true);
	      });
	    }
	  };
	});