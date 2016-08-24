app.directive('myFilter', [function() {
    return {
        restrict: 'A',       
        link: function(scope, element) {
            // wait for the last item in the ng-repeat then call init
            angular.element(document).ready(function() {
                
            });
        }
    };

}]);
	
 
//================= ADD RESTAURANT	 =====================
 app.controller('restAddCtrl', function($scope, $http, $rootScope){
	 
	 var currentPage = 1;
		$scope.dataRestypes = [];
		
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
	 //===================GET RESTAURANT RESTYPE ==============	 
	/*	$scope.getRestType=function(){
			$http.get('/rest/restype?limit=30&page=1').then(function(response){
				$scope.dataRestype =response.data.DATA;
				for (var i = 0; i < $scope.dataRestype.length; i++) {
		            $scope.loadRestype.push({
						restype_name:$scope.dataRestype[i].restype_name, 
						restype_id: $scope.dataRestype[i].restype_id
					});
				}
				
			});
		}
		
	$scope.getRestType();*/	
	 //===================GET RESTAURANT OWNER ==============
	 $scope.getRestOwner=function(){
			$http.get('/rest/user/owner').then(function(response){
				$scope.owners=response.data.DATA;
				console.log($scope.owners);
			});
		}
		
		
	 $scope.getRestOwner();
	 
	//================= BROACAST LOADING	 =======================
     angular.element(document).ready(function() {
    	 initJqueryFiler(['#restGallery', '#menuGallery'], [[],[]]);
     });
	 
	//================= DATA STATIC RESTYPE	 =======================
		
		//================= START LOCATION ADDRESS =====================
		
		
		//=================  GET CITIES / PROVINCE =====================
		$scope.getCities = function(){
			   $http.get('/rest/location/')
			   .then(function (response) {
				  $scope.provinces = response.data.DATA;
				  console.log($scope.provinces);
			   });
		}
		$scope.getCities();
		//=================  GET DISTRICT / KHAN =====================
		$scope.getDistrict = function(id){
			$http.get('/rest/location/district/'+id)
			   .then(function (response) {
				  $scope.districts = response.data.DATA;
				  console.log($scope.districts);
			   });
		}
		
		//=================  GET COMMUNE / SANGKAT =====================
		$scope.getCommune = function(id){
			
			$http.get('/rest/location/commune/'+id)
			   .then(function (response) {
				  $scope.communes = response.data.DATA;
				  console.log($scope.communes);
				 
			   });
		}
		//=================  GET VILLAGE / KROM =====================
		$scope.getVillage = function(id){
			$http.get('/rest/location/village/'+id)
			   .then(function (response) {
				  $scope.villages = response.data.DATA;
				 
			   });
		}
		//================= END LOCATION ADDRESS =====================
		 
		//=================  ADD RESTAURANTS =====================
	    $scope.addRestaurant = function(e){
	    	
	    	e.preventDefault();
	    	$scope.open_close = "From "+ $scope.open + " To " + $scope.close;
	    	
	    	/*$scope.user_id = parseInt($("#user_id").text());*/
	    	data = {
				  "address": {"street": $scope.street_number, 
					  "district": $("#district option:selected").text(),
					  "village": $("#village option:selected").text(),
					  "communce": $("#communce option:selected").text(), 
					  "province": $("#province option:selected").text()},
					  "rest_name_kh": $scope.rest_name_kh,
					  "rest_name": $scope.rest_name,
					  "location": $scope.location,
					  "about": $scope.about,
					  "contact": $scope.contact,
					  "user_id": $scope.user_id,
					  "open_close":$scope.open_close,
					 "restypes_id": $scope.data_Restypes
				};
	    	
	    	var frmData = new FormData();
	    	
	    	/*var rest_picture = angular.element('#rest_picture')[0].files;
	    	for(var i=0; i<rest_picture.length; i++){
				frmData.append("restaurant", rest_picture[i]);
			}
	    	
	    	var menu_files = angular.element('#menu')[0].files;
			for(var i=0; i<menu_files.length; i++){
				frmData.append("menu", menu_files[i]);
			}*/
	    	
	    	//===========send add restaurant picture to server
	    	for (var i=0; i<newFiles["restGallery"].length; i++){
	    		frmData.append("restaurant", newFiles["restGallery"][i]);
	    	}
	    	
	    	//===========send add menu picture to server
	    	for (var i=0; i<newFiles["menuGallery"].length; i++){
	    		frmData.append("menu", newFiles["menuGallery"][i]);
	    	}
			
			//frmData.append("rest_picture", menu_files);
			
			frmData.append('json_data', JSON.stringify(data));
			
			$http({
				url:'http://localhost:9999/api/upload/test',
				method: 'POST',
				data: frmData,
				transformRequest: angular.identity,
	            headers: {'Content-Type': undefined}
			}).then(function(response){
				console.log(response.data);
				swal({   
	        			title: "INSERTED SUCCESSFULLY!",   
	        			text: "THANK YOU",   
	        			type: "success",   
	        			confirmButtonColor: "#007d3d",   
	        			closeOnConfirm: false,   
	        			closeOnCancel: false }, 
	        			function(isConfirm){   
	        				if(isConfirm) {     				
	        					window.location.href="http://localhost:8080/admin/addRestaurant";
	        				}else {     
	        					swal("Cancelled", "Your imaginary file is safe !", "error");   
	        				} 
	        			});
				
			}, function(error){
				console.log(error.data);
				alert('failed to upload data! Please Try again !!!!!');
			});
	    }
		
 });
//================= UPDATE RESTAURANT	 =======================
 app.controller('restUpdateCtrl', function($scope, $http){
	 
	 
	 
	//================= START LOCATION ADDRESS =====================
		
		
		//=================  GET CITIES / PROVINCE =====================
		$scope.getCities = function(){
			   $http.get('/rest/location/')
			   .then(function (response) {
				  $scope.provinces = response.data.DATA;
				  console.log($scope.provinces);
			   });
		}
		$scope.getCities();
		//=================  GET DISTRICT / KHAN =====================
		$scope.getDistrict = function(id){
			$http.get('/rest/location/district/'+id)
			   .then(function (response) {
				  $scope.districts = response.data.DATA;
				  console.log($scope.districts);
			   });
		}
		
		//=================  GET COMMUNE / SANGKAT =====================
		$scope.getCommune = function(id){
			
			$http.get('/rest/location/commune/'+id)
			   .then(function (response) {
				  $scope.communes = response.data.DATA;
				  console.log($scope.communes);
				  
				 
			   });
		}
		//=================  GET VILLAGE / KROM =====================
		$scope.getVillage = function(id){
			$http.get('/rest/location/village/'+id)
			   .then(function (response) {
				  $scope.villages = response.data.DATA;
				 
			   });
		}
		//================= END LOCATION ADDRESS =====================

	 var currentPage = 1;
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
		
		
	 $scope.sample1 = [];
	 $scope.sample2 = [];

    
    var rest_id = window.location.href.substring(window.location.href.lastIndexOf('/') + 1);
    $scope.getRestById = function(rest_id){
    	$http({
   			url: '/rest/restaurant/'+rest_id,
   			method:'GET'
   		}).then(function(response){
   			$scope.restaurant = response.data.DATA;
   			$scope.rest_id = $scope.restaurant.rest_id;
   			$scope.rest_name = $scope.restaurant.rest_name;
   			$scope.rest_name_kh = $scope.restaurant.rest_name_kh;
   			$scope.restype_name = $scope.restaurant.restype_name;
   			$scope.contact = $scope.restaurant.contact;
   			$scope.open_close = $scope.restaurant.open_close;
   			$scope.about = $scope.restaurant.about;
   			
   			$scope.restpictures = $scope.restaurant.restpictures;
   			$scope.categories = $scope.restaurant.categories;
   			$scope.street_number = $scope.restaurant.address.street;
   			$scope.village = $scope.restaurant.address.village;
   			$scope.communce = $scope.restaurant.address.communce;
   			$scope.province = $scope.restaurant.address.province;
   			console.log($scope.restaurant);
   			
   			angular.forEach($scope.restaurant.restpictures, function(rest, key){
   				
   				$scope.sample1.push({
   	   				name: rest.path_name,
   	   				type: "image/jpg",
   	   				size: '',
   	   				file: "http://localhost:9999"+rest.path_name
   	   			});
   	   			
   			}); 
   			
   			angular.forEach($scope.restaurant.categories, function(category, key){
   				
   				$scope.sample2.push({
   	   				name: category.url,
   	   				type: "image/jpg",
   	   				size: '',
   	   				file: "http://localhost:9999"+category.url
   	   				
   	   			});
 
   			});

   			//========================= broadcast load first =======================
   			$scope.$broadcast('pirang');
   			
   		},function(){

   		});
    };
    $scope.getRestById(rest_id);
    
    $scope.updateRestaurant = function(e){
    	
    	e.preventDefault();
    	
    	$scope.user_id = parseInt($("#user_id").text());
    	data = {
    			"address": {"street": $scope.street_number, 
				  "district": $scope.district,
				  "communce": $scope.communce, 
				  "province": $scope.province},
				  "rest_id": rest_id,
				  "rest_name_kh": $scope.rest_name_kh,
				  "rest_name": $scope.rest_name,
				  "location": $scope.location,
				  "about": $scope.about,
				  "contact": $scope.contact,
				  "user_id": $scope.user_id,
				  "open_close":$scope.open_close
			};
    	
    	var frmData = new FormData();

    	//===========send add restaurant picture to server
    	for (var i=0; i<newFiles["restGallery"].length; i++){
    		frmData.append("addRestFile", newFiles["restGallery"][i]);
    	}
    	
    	//===========send add menu picture to server
    	for (var i=0; i<newFiles["menuGallery"].length; i++){
    		frmData.append("menu_picture", newFiles["menuGallery"][i]);
    	}
    	//===========delete restaurant picture from server
    	frmData.append("deletedImageRest", deletedImageNames["restGallery"]);
    	console.log('Rest', deletedImageNames["restGallery"].length);
    	
    	//===========delete menu picture from server
    	frmData.append("delete_menu_picture", deletedImageNames["menuGallery"]);
    	console.log('Menu', deletedImageNames["menuGallery"].length);
    	
		frmData.append('json_data', JSON.stringify(data));
		
		$http({
			url:'http://localhost:9999/api/upload/test/update',
			method: 'POST',
			data: frmData,
			transformRequest: angular.identity,
            headers: {'Content-Type': undefined}
		}).then(function(response){
			swal({   
    			title: "UPDATE SUCCESSFULLY!",   
    			text: "THANK YOU",   
    			type: "success",   
    			confirmButtonColor: "#007d3d",   
    			closeOnConfirm: false,   
    			closeOnCancel: false }, 
    			function(isConfirm){   
    				if(isConfirm) {     				
    					window.location.href="http://localhost:8080/admin/restaurant";
    				}else {     
    					swal("Cancelled", "Your imaginary file is safe !", "error");   
    				} 
    			});
			console.log(response.data);
		}, function(error){
			console.log(error.data);

			alert('failed to upload data! Please Try again !!!!!');
		});
	}
    //================= broadcast ===> wait data load and run script
    $scope.$on('pirang', function () {
		initJqueryFiler(['#restGallery', '#menuGallery'], [$scope.sample1, $scope.sample2]);
	});
    
 });
//=================GET RESTAURANT =======================
app.controller('restGetCtrl', function($scope, $http) {
	/*$scope.trick = [{id:1},{id:2}];*/

	//================= DATA STATIC RESTYPE	 =======================
	var currentPage = 1;
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
	

	//================= GET ALL RESTAURANTS  WITH PAGINATION =====================
	var check = true;
	
	$scope.getAllRestaurants = function (currentPage) {
	    $http.get('http://localhost:8080/rest/restaurant/category?limit=15&page='+currentPage)
	    .then(function (response) {
	    	
	    	console.log(currentPage);
	    	$scope.restaurants = response.data.DATA;
	    	console.log($scope.restaurants);
	    	if(check){
				setPagination(response.data.PAGINATION.TOTAL_PAGES,currentPage);
				check=false;
	    	}
	    }, function(){
       	 	alert('Error');
        });
	}
	    	
    setPagination = function(totalPage, currentPage){
	    	$('#pagination').bootpag({
		        total: totalPage,
		        page: currentPage,
		        maxVisible: 10,
		        leaps: true,
		        firstLastUse: true,
		        first: 'First',
		        last: 'Last',
		        wrapClass: 'pagination',
		        activeClass: 'active',
		        disabledClass: 'disabled',
		        nextClass: 'next',
		        prevClass: 'prev',
		        lastClass: 'last',
		        firstClass: 'first'
		    }).on("page", function(event, currentPage){
		    	check = false;
		    	getCurrentPage = currentPage;
		    	$scope.getAllRestaurants(currentPage);
		    }); 	
		};
					
		$scope.getAllRestaurants(currentPage);
	        
		 //================= TEST RESTAURANTS =======================
		
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
		
	//================= DELETE RESTAURANTS =====================
	    $scope.deleteRestaurant = function(rest_id, e){
	    	e.preventDefault();
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
						
						$http.delete('http://localhost:8080/rest/restaurant/'+rest_id).then(function(response){
							check = true;
							$scope.getAllRestaurants(1);
						});
						
						swal("Deleted!",
							"Your imaginary file has been deleted.",
							"success");   
					} else {     
						swal("Cancelled", "Your imaginary file is safe :)", "error");   
					} 
			});
	    	
	    }

/*	for (var i = 0; i < 16 ; i++) {
        $scope.restypes.push({restype_name: 'testing' + i, restype_id: i});
 
    }
*/	
	
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


