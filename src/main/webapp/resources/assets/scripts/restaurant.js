//var restApp= angular.module('restApp',['btorfs.multiselect']);
/*=========================== Restaurant Controller ===========================*/

app.controller('restCtrl', function($scope, $http) {

	//================= DATA STATIC RESTYPE	 =======================
	
	$scope.restypes = [];
	
	$scope.dataRestypes = [
		{restype_name: 'Khmer Food', restype_id: 1},
		{restype_name: 'BBQ', restype_id: 2},
		{restype_name: 'Thai Food', restype_id: 3},
		{restype_name: 'Vegeterian', restype_id: 4},
		{restype_name: 'Sea Food', restype_id: 5},
		{restype_name: 'Japanese Food', restype_id: 6},
		{restype_name: 'Soup', restype_id: 7},
		{restype_name: 'Beer', restype_id: 8},
		{restype_name: 'Coffee and Tea', restype_id: 9},
		{restype_name: 'Noodle', restype_id: 10},
		{restype_name: 'Chinese Food', restype_id: 11},
		{restype_name: 'Korean Food', restype_id: 12},
		{restype_name: 'Western Food', restype_id: 13},
		{restype_name: 'Buffet', restype_id: 114},
		{restype_name: 'Porridge', restype_id: 15},
		{restype_name: 'Street Food', restype_id: 16}
      ];

//	for (var i = 0; i < 16 ; i++) {
//        $scope.restypes.push({restype_name: 'testing' + i, restype_id: i});
// 
//    }
	
	//================= GET ALL RESTAURANTS =====================
	$scope.getAllRestaurants = function () {
	    $http.get('http://localhost:8080/rest/restaurant/category')
	    .then(function (response) {
	    	console.log(response);
	    	$scope.restaurants = response.data.DATA;
	    });
	}
    $scope.getAllRestaurants();
    
                
	 //================= Add RESTAURANTS =======================
	
	$scope.getCategoryRest = function () {
		
	    $http.get("http://localhost:8080/rest/restype?page=1&limit=20")
	    .then(function (response) {
	    
	    	$scope.data_restypes = response.data.DATA;

	    	
	    	var loop = $scope.data_restypes.length;
	    	console.log($scope.data_restypes.length);
	    	 for (var i = 0; i < 16 ; i++) {
	    		 $scope.restypes.push({name: 'element' + i, id: i});
	
	    	 }
	    });
	}
	
	$scope.getMenuRest = function () {
	    $http.get("http://localhost:8080/rest/category")
	    .then(function (response) {
	    
	    	$scope.menus = response.data.DATA;
	    });
	}
	
//	$scope.getCategoryRest();
//	$scope.getMenuRest();
	 //=================END Add RESTAURANTS =====================
	
	
  //=================  ADD RESTAURANTS =====================
    $scope.addRestaurant = function(e){
    	
    	e.preventDefault();
    	$scope.user_id = parseInt($("#user_id").text());
    	data = {
			  "address": {"street": $scope.street, 
				  "district": $scope.district,
				  "communce": $scope.communce, 
				  "province": $scope.province},
				  "rest_name_kh": $scope.rest_name_kh,
				  "rest_name": $scope.rest_name,
				  "location": $scope.location,
				  "about": $scope.about,
				  "contact": $scope.contact,
				  "user_id": $scope.user_id,
				  "open_close":$scope.open_close,
				 "restypes_id": $scope.data_Restypes
			};
    	
    	var menu_files = angular.element('#menu')[0].files;
		var frmData = new FormData();
		for(var i=0; i<menu_files.length; i++){
			frmData.append("menu", menu_files[i]);
		}
		frmData.append('json_data', JSON.stringify(data));
		
		$http({
			url:'http://localhost:9999/api/upload/test',
			method: 'POST',
			data: frmData,
			transformRequest: angular.identity,
            headers: {'Content-Type': undefined}
		}).then(function(response){
			console.log(response.data);
		}, function(error){
			console.log(error.data);
			alert('failed to upload data! Please Try again !!!!!');
		});
    }
    //$scope.addRestaurant();
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
    
    /*
    data = {
			  "address": {"street": "22222", "district": "22222","communce": "22222", "province": "22222"},
				  "rest_name_kh": "22222",
				  "rest_name": "22222",
				  "location": "22222",
				  "about": "22222",
				  "contact": "22222",
				  "user_id": 42,
				  "open_close": "22222",
				  "categories": [
				    {
				      "category_name": "1",
				      "other": "string",
				      "picture": "string",
				      "category_name_kh": "string"
				    },{
				      "category_name": "2",
				      "other": "string",
				      "picture": "string",
				      "category_name_kh": "string"
				    },
				{
				      "category_name": "3",
				      "other": "string",
				      "picture": "string",
				      "category_name_kh": "string"
				    },{
				      "category_name": "4",
				      "other": "string",
				      "picture": "string",
				      "category_name_kh": "string"
				    }
				  ],
				 "restypes_id": [
				    {
				      "restype_id": 4
				    },{
				      "restype_id": 5
				    },{
				      "restype_id": 6
				    }
				  ]
			};
			
			*/

    
 });


