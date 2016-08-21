 var myApp = angular.module('myApp', []);
   
 
//================= ADD RESTAURANT	 =====================
 myApp.controller('restAddCtrl', function($scope, $http){
	  
	  $scope.sample1 = [
	                    {
	                        id  : 10,
	                        name: "1",
	                        type: "image/jpg",
	                        size: '',
	                        file: "http://www.gettyimages.com/gi-resources/images/Homepage/Hero/US/MAR2016/prestige-587705839_full.jpg"
	                    },
	                    {
	                        id  : 20,
	                        name: "2",
	                        size: '',
	                        type: "image/jpg",
	                        file: "https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcQt3XVxyI5sLL8f1_vPQkAxGRBIfYa6e4lESTqVQk3j_JN_O0M6LA"
	                    }
	                ];

	                $scope.sample2 = [
	                    {
	                        id  : 30,
	                        name: "3",
	                        type: "image/jpg",
	                        size: '',
	                        file: "https://3.bp.blogspot.com/-W__wiaHUjwI/Vt3Grd8df0I/AAAAAAAAA78/7xqUNj8ujtY/s1600/image02.png"
	                    },
	                    {
	                        id  : 40,
	                        name: "4",
	                        size: '',
	                        type: "image/jpg",
	                        file: "https://i.kinja-img.com/gawker-media/image/upload/s--BVBooEGz--/c_scale,fl_progressive,q_80,w_800/vjamorotezzukhdvpccc.jpg"
	                    }
	                ];

	                $scope.show = function(){
	                    console.log('Rest File', newFiles['restGallery']);
	                    console.log('Rest Deleted Image', deletedImageNames['restGallery']);

	                    console.log('Menu File', newFiles['menuGallery']);
	                    console.log('Menu Deleted', deletedImageNames['menuGallery']);
	                }
	           

 			myApp.directive('myFilter', [function() {
	                return {
	                    restrict: 'A',       
	                    link: function(scope, element) {
	                        // wait for the last item in the ng-repeat then call init
	                        angular.element(document).ready(function() {
	                            initJqueryFiler(['#restGallery', '#menuGallery'], [scope.sample1, scope.sample2]);
	                        });
	                       
	                    }
	                };
 			}
	                
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