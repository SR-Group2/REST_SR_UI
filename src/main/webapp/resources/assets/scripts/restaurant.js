
/*=========================== Restaurant Controller ===========================*/

app.controller('restCtrl', function($scope, $http) {
	$scope.restaurants = '';
	
	 //================= Add RESTAURANTS =======================
	
	$scope.getCategoryRest = function () {
	    $http.get("http://localhost:8080/rest/restype?page=1&limit=20")
	    .then(function (response) {
	    	$scope.restypes = response.data.DATA;
	    });
	}
	
	$scope.getCategoryRest();
	
	 //=================END Add RESTAURANTS =====================
	
	//================= GET ALL RESTAURANTS =====================
//	$scope.getAllRestaurants = function () {
//	    $http.get('http://localhost:8080/rest/restaurant/category')
//	    .then(function (response) {
//	    	console.log(response);
//	    	$scope.restaurants = response.data.DATA;
//	    });
//	}
//    $scope.getAllRestaurants();
  //=================  ADD RESTAURANTS =====================
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
  //================= GET  RESTAURANT BY ID =====================
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
   //================= UPDATE RESTAURANTS =====================
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
  //================= CLEAR DATA WHEN LOAD FORM ADD =====================
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
