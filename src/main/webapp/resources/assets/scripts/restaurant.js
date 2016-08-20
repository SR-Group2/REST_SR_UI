//var restApp= angular.module('restApp',['btorfs.multiselect']);
/*=========================== Restaurant Controller ===========================*/

 app.directive('myFilter', [function() {
    return {
        restrict: 'A',       
        link: function(scope, element) {
            // wait for the last item in the ng-repeat then call init
        	
            if(scope.$last) {
                initJqueryFiler('#gallery', scope.sample);
            }
        }
    };
    /**** Usable array ****/
    // => validatedFiles
    // => deletedImageName

}]);
 
app.controller('restCtrl', function($scope, $http) {
	$scope.trick = [{id:1},{id:2}];

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

//	for (var i = 0; i < 16 ; i++) {
//        $scope.restypes.push({restype_name: 'testing' + i, restype_id: i});
// 
//    }
	
	
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
    	
    	var frmData = new FormData();
    	
    	var rest_picture = angular.element('#rest_picture')[0].files;
    	for(var i=0; i<rest_picture.length; i++){
			frmData.append("restaurant", rest_picture[i]);
		}
    	
    	var menu_files = angular.element('#menu')[0].files;
		for(var i=0; i<menu_files.length; i++){
			frmData.append("menu", menu_files[i]);
		}
		
		frmData.append("rest_picture", menu_files);
		
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
        					swal("Cancelled", "Your imaginary file is safe :)", "error");   
        				} 
        			});
			
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
    	
   //================= UPDATE RESTAURANTS =====================

	 $scope.sample = [
        
     ];

     $scope.show = function(){
         console.log('File To Send', validatedFiles);
         console.log('Image Name to Delete', deletedImageName);
     }
    
    var rest_id = window.location.href.substring(window.location.href.lastIndexOf('/') + 1);
    $scope.getRestById = function(rest_id){
    	$http({
   			url: 'http://localhost:8080/rest/restaurant/'+rest_id,
   			method:'GET'
   		}).then(function(response){
   			$scope.restaurant = response.data.DATA;
   			$scope.rest_id = $scope.restaurant.rest_id;
   			$scope.rest_name = $scope.restaurant.rest_name;
   			$scope.restype_name = $scope.restaurant.restype_name;
   			$scope.contact = $scope.restaurant.contact;
   			$scope.about = $scope.restaurant.about;
   			$scope.street = $scope.restaurant.street;
   			$scope.restpictures = $scope.restaurant.restpictures;
   			$scope.categories = $scope.restaurant.categories;
   			
   			angular.forEach($scope.restaurant.categories, function(category, key){
   				
   				$scope.sample.push({
   	   				name: category.url,
   	   				type: "image/jpg",
   	   				size: '',
   	   				file: "http://localhost:9999"+category.url
   	   			});
   	   			
   	   			console.log(category);
   			});   	
   			
   		},function(){

   		});
    };
    $scope.getRestById(rest_id);
    
    $scope.updateRestaurant = function(e){
    	e.preventDefault();
		
    	$scope.user_id = parseInt($("#user_id").text());
    	data = {
    			"address": {"street": $scope.street, 
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
    	
    	for (var i=0; i<validatedFiles.length; i++){
    		frmData.append("menu_picture", validatedFiles[i]);
    	}
    	
    	frmData.append("delete_menu_picture", deletedImageName);
		frmData.append('json_data', JSON.stringify(data));
		
		$http({
			url:'http://localhost:9999/api/upload/test/update',
			method: 'POST',
			data: frmData,
			transformRequest: angular.identity,
            headers: {'Content-Type': undefined}
		}).then(function(response){
			//$scope.getAllRestaurants();
			console.log(response.data);
		}, function(error){
			console.log(error.data);

			alert('failed to upload data! Please Try again !!!!!');
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


