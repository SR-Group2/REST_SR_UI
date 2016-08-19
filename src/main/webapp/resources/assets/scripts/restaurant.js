//var restApp= angular.module('restApp',['btorfs.multiselect']);
/*=========================== Restaurant Controller ===========================*/

app.controller('restCtrl', function($scope, $http) {

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
	
	//===================================== search restaurant =======================
	
	// constructs the suggestion engine
	var substringMatcher = function(strs) {
		return function findMatches(q, cb) {
			var matches, substringRegex;

			// an array that will be populated with substring matches
			matches = [];

			// regex used to determine if a string contains the substring `q`
			substrRegex = new RegExp(q, 'i');

			// iterate through the pool of strings and for any string that
			// contains the substring `q`, add it to the `matches` array
			$.each(strs, function(i, str) {
				if (substrRegex.test(str)) {
					matches.push(str);
				}
			});

			cb(matches);
		};
	};

	var states;

	var bestPictures = new Bloodhound(
		{
			datumTokenizer : Bloodhound.tokenizers.obj
					.whitespace('value'),
			queryTokenizer : Bloodhound.tokenizers.whitespace,
			remote : {
				url : "http://localhost:8080/rest/restaurant/search?keyword=%QUERY%"+ "&page=" + currentPage + "&limit=15",
				//url: 'http://yourhost_ip/foo_autocomplete?query=%QUERY',
				wildcard : '%QUERY%',
				filter : function(restaurants) {
					// Map the remote source JSON array to a JavaScript array
					return $.map(restaurants.DATA, function(restaurant) {
						return {
							value : restaurant.rest_name
						};
					});
				}
			}
		});

	$('#remote .typeahead').typeahead(null, {
		name : 'best-pictures',
		display : 'value',
		source : bestPictures
	});

	$('#keyword').on('typeahead:selected', function(){ 
		$("#getRest").empty();
		var keyword = $(this).val();
		check = true;
		$.ajax({ 
		    url:"${pageContext.request.contextPath}/rest/restaurant/search?keyword="+keyword+"&page="+currentPage+"&limit=15", 
		    type: 'GET',
		    beforeSend: function(xhr) {
                xhr.setRequestHeader("Accept", "application/json");
                xhr.setRequestHeader("Content-Type", "application/json");
            },
		    success: function(data) { 
		    	console.log(data);
		    	if (data.STATUS != false) {
					console.log(data);
					$("#getRest").empty();
					$("#rest_tmpl").tmpl(data.DATA).appendTo("#getRest");
					$('#getRest').css("cursor", "pointer");
					if (check) {
						restaurant.setPagination(
								data.PAGINATION.TOTAL_PAGES,
								currentPage);
						check = false;
					}
					$("#pagination").show()
				} else {
					$("#pagination").hide();
					$("#getRest").empty();
				}
		   
		    }
			});
	});
	
	//================= GET ALL RESTAURANTS  WITH PAGINATION =====================
	var check = true;
	
	$scope.getAllRestaurants = function (currentPage) {
	    $http.get('http://localhost:8080/rest/restaurant/category?limit=15&page='+currentPage)
	    .then(function (response) {
	    	console.log(response.data);
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
   			console.log(response);
   			
   		},function(){

   		});
    };
    $scope.getRestById(rest_id);
    
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


