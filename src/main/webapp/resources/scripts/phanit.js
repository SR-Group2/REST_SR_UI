

/*=========================== Comment Controller ===========================*/

app.controller('commentCtrl', function($scope, $http) {
	$scope.comments = '';

	$scope.getAllComment = function () {
	
    $http.get('http://localhost:8080/rest/comment')
    .then(function (response) {
    	$scope.comments = response.data.DATA;
    });
    
	}
    $scope.getAllComment();
    
    $scope.addComment = function(){
    	$http({
    		url: 'http://localhost:8080/rest/comment',
    		data:{
    			"rest":{
    				rest_name: $scope.rest_name
    			},
    			"user":{
    				first_name: $scope.first_name,
    				last_name: $scope.last_name
    			},
    			comment: $scope.comment
    		},
    		method:'POST'
    	}).then(function(response){
    		 $scope.getAllComment();
    	},function(){

    		});

    	}
    
    $scope.getCommentById = function(comment_id){
   		$http({
   			url: 'http://localhost:8080/rest/comment/'+comment_id,
   			method:'GET'
   		}).then(function(response){
   			$scope.comment = response.data.DATA;
   			$scope.first_name = response.data.DATA.user.first_name;
   			$scope.last_name = response.data.DATA.user.last_name;
   			$scope.rest_name = response.data.DATA.rest.rest_name;
   			$scope.comments = response.data.DATA.comment;
   			
   		},function(){

   		});
   		
   	}
    
    $scope.deleteComment = function(comment_id) {
		$http.delete('http://localhost:8080/rest/comment/' + comment_id)
		.then(function(response){
			$scope.getAllComment();
		});	
	}
    
    $scope.clearCommentForm = function(){
    	
		comment: $scope.comment = '';
		rest_name: $scope.rest_name = '';
		first_name: $scope.first_name = '';
		last_name: $scope.last_name = '';
	 
    }
 });

/*=========================== Restaurant Controller ===========================*/

app.controller('restaurantCtrl', function($scope, $http) {
	$scope.restaurants = '';

	$scope.getAllRestaurants = function () {
	
    $http.get('http://localhost:8080/rest/restaurant')
    .then(function (response) {
    	$scope.restaurants = response.data.DATA;
    });
    
	}
    $scope.getAllRestaurants();
    
    $scope.addRestaurant = function(){
    	$http({
    		url: 'http://localhost:8080/rest/restaurant',
    		data:{
    			"rest":{
    				rest_name: $scope.rest_name
    			},
    			"restype":{
    				restype_name: $scope.restype_name
    			},
    			contact: $scope.contact,
    			about: $scope.about,
    			street: $scope.street,
    			communce: $scope.communce,
    			district: $scope.district,
    			province: $scope.province
    		},
    		method:'POST'
    	}).then(function(response){
    		 $scope.getAllRestaurants();
    	},function(){

    		});

    	}
    
    $scope.getRestaurantById = function(rest_id){
    	$http({
   			url: 'http://localhost:8080/rest/restaurant/'+rest_id,
   			method:'GET'
   		}).then(function(response){
   			$scope.restaurant = response.data.DATA;
   			$scope.rest_id = response.data.DATA.rest_id;
   			$scope.rest_name = response.data.DATA.rest_name;
   			$scope.restype_name = response.data.DATA.restype.restype_name;
   			$scope.contact = response.data.DATA.contact;
   			$scope.about = response.data.DATA.about;
   			$scope.street = response.data.DATA.address.street;
   			$scope.communce = response.data.DATA.address.communce;
   			$scope.district = response.data.DATA.address.district;
   			$scope.province = response.data.DATA.address.province;
   			
   		},function(){

   		});
   		
   	}
    
    $scope.updateRestaurant = function(){
		data={
				rest_id: $scope.rest_id,
				rest_name: $scope.rest_name,
				restypes: {
					restype_name: $scope.restype_name
				},
				contact:$scope.contact,
				about:$scope.about,
				addresses: {
					street: $scope.street,
					communce: $scope.communce,
					district: $scope.district,
					province: $scope.province
				}
			}
		$http.put('http://localhost:8080/rest/restaurant',data).then(function(response){
			$scope.getAllRestaurants();
		});
	}
    
    $scope.deleteRestaurant = function(rest_id) {
		$http.delete('http://localhost:8080/rest/restaurant/' + rest_id)
		.then(function(response){
			$scope.getAllRestaurants();
		});	
	}
    
    $scope.clearRestaurantForm = function(){
    	
		rest_name: $scope.rest_name = '';
		restype_name: $scope.restype_name = '';
    	contact: $scope.contact = '';
    	about: $scope.about = '';
		street: $scope.street = '';
    	communce: $scope.communce = '';
    	district: $scope.district = '';
    	province: $scope.province = '';
    }
 });