var app= angular.module('myapp',[]);
app.controller('profileCtrl',function($scope, $http){
	$scope.getAllFavReste = function(){
		$http.get('http://localhost:8080/rest/favourite-restaurant').then(function(response){
			$scope.favouriteRestaurants = response.data.DATA;	
			console.log(response);
		});
	}
	$scope.getAllFavReste();
	$scope.day=30;
	
});