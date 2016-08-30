//==================== Fancy Book Action ===================
		$(document).ready(function() {
			$(".fancybox").fancybox({
				 helpers:  {
			        thumbs : {
			            width: 50,
			            height: 50
			        }
			    }
			});
		});
	//==================== Get Restaurant Information ===================
		var id = window.location.href.substring(window.location.href.lastIndexOf('/') + 1);
	  		console.log(id);

	  		app.directive('menulist', [function() {
	            return {
	                restrict: 'A',       
	                link: function(scope, element) {
	                    // wait for the last item in the ng-repeat then call init
	                    if(scope.$last){
	                    	if(scope.$root.checkBooklet){
	                    		$('#menus').booklet();
	                    	}
	                    	scope.$root.checkBooklet = true;
	                    }
	                }
	            };
	        }]);	
		

	  	app.controller("mainCtrl", function($http, $scope, $rootScope){
	  	
	  		$rootScope.checkBooklet = false;
	
	  		var id = window.location.href.substring(window.location.href.lastIndexOf('/') + 1);
	  		console.log(id);
	  		//============================ LOAD DATA OF CATEGORY ===========================
	  		$scope.getCategory = function(){
	  		
	  			$http.get("/rest/category/catrest/"+id)
				.then(function(rsp){
				
					$scope.menus = rsp.data.DATA;
					
				});
	  		} 
		 	
			$scope.getCategory();
			
	  		$scope.getRestDetail = function(){
	  			
	  			$http.get("/rest/restaurant/"+id)
	  			.then(function(rsp){
	  				console.log(rsp);
	  				$scope.rest = rsp.data.DATA;
	  				$scope.rest_name = $scope.rest.rest_name;
	  				$scope.about = $scope.rest.about;
	  				$scope.contact = $scope.rest.contact;
	  				$scope.location = $scope.rest.location;
	  				$scope.owner_name = $scope.rest.user.username;
	  				$scope.rest_id = $scope.rest.rest_id;
	  				$scope.address = $scope.rest.address;
	  				$scope.latitude = $scope.rest.latitude;
	  				$scope.longitude = $scope.rest.longitude;
	  				$scope.coords = $scope.latitude +','+ $scope.longitude;
	  				$scope.getCategoryByRestID($scope.rest_id);
	  				
	  				
	  				//=========== Check usersession is login or not=============
	  				if("${session_isLogin}" == "true"){
	  					//alert("${session_isLogin}" + " " + "${session_userID}");
	  					$scope.isExist($scope.rest.rest_id, "${session_userID}");
	  				
	  				}

	  				
	  			});
	  		}
	  		
	  		$scope.getRestDetail();
	  		
	  		//==================== Get Category From Restaurant ID ===================
			$scope.getCategoryByRestID = function(rest_id){	
	  			$http.get("/rest/category/catrest/"+rest_id)
	  			.then(function(rsp){
	  				$scope.menus = rsp.data.DATA;
	  				console.log($scope.menus);
	  			});
	  		}

			//==================== Get comment ===================
				//http://localhost:8080/rest/comment/restaurant/3
			$scope.getComment = function(rest_id){
				$http.get("/rest/comment/restaurant/"+rest_id)
	  			.then(function(rsp){
	  				if(rsp.data.DATA !=null){
	  					$scope.comments = rsp.data.DATA;
	  					$scope.checkcomment = true;
	  					console.log("comment",rsp);	
	  				}else{
	  					$scope.checkcomment = false;
	  				}
	  		
	  			});
			}
			
			$scope.getComment(id);
			//==================== add comment ===================
			$scope.addComment = function(){
				var user_id = parseInt($("#user_id").text());
				var rest_id = parseInt(id);
				data = {
						  "comment":$scope.comment_text,
						  "user": {
						    "user_id": user_id
						  },
						  "rest": {
						    "rest_id": rest_id
						    }
						};

				if($scope.comment_text = ""){
					console.log(data);
				}
			$http.post("/rest/comment/", data)
	  			.then(function(rsp){
	  				$scope.getComment(id);
	  				$scope.comment_text = "";
	  				
	  			});
			}
			
	/*========================Add Favorite Restaurant ======================*/	
			
			$scope.addFavRest= function(rest_id){
				
				if("${session_isLogin}" == "false"){
					location.href="/login";
					return;
				}

			//$("#btnfav").text("Saved");
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
				
				$("#btnfav").text("Saved");
				$("#btnfav").attr('disabled', 'disabled');
			});
			
		} 
			
			
		/*======================= Check Restaurant is Exist or not ===================*/
		$scope.isExist=function(rest_id,user_id){
				$http.get('/rest/favourite-restaurant/is-fav-existed/'+user_id+'/'+rest_id).then(function(response){	
					if(response.data.STATUS == false){						
						$("#btnfav").text("Saved");
						$("#btnfav").attr('disabled', 'disabled');
					}else{
						$("#btnfav").text("save Favorite");
						
					}
					
				});
			}
	  	});
	
	