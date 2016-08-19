var app= angular.module('myApp',[]);
app.controller('profileCtrl',function($scope, $http){
	$scope.getAllFavReste = function(){
		$http.get('http://localhost:8080/rest/favourite-restaurant').then(function(response){
			$scope.favouriteRestaurants = response.data.DATA;	
			$scope.favtotal=response.data.DATA.total;
			console.log(response.data.DATA);
		});
	}
	$scope.getAllFavReste();
	
});
app.controller('signUpCtrl', function($scope,$http){
	$scope.getAllUsers=function(){
		$http.get('http://localhost:8080/rest/user').then(function(response){
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
		$http.post('http://localhost:8080/rest/user/sign-up', data).then(function(response){
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