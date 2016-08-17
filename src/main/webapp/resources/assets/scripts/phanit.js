

/*=========================== Comment Controller ===========================*/

app.controller('commentCtrl', function($scope, $http) {
	//$scope.comments = '';

	$scope.getAllComment = function () {
	
    $http.get('http://localhost:8080/rest/comment/restaurant/3')
    .then(function (response) {
    	$scope.comments = response.data.DATA;
    });
    
	}
    $scope.getAllComment();
    
    //================= Adding Commend ==========================
    $scope.addComment=function(e){
    	e.preventDefault();
		data={
				'user':{
					user_id: 1//$scope.user_id
				},
				'rest':{
					rest_id: $scope.rest_id
				},
				comment:$scope.comment
		};
		
		
		
		$http.post('http://localhost:8080/rest/comment', data)
		.then(function(response){
			//console.log(response);
			$scope.getAllComment();
			//swal("Successfully Inserted!", "You clicked the button!", "success");
		}, function(error){
			//console.log(error);
		});
		
	}
    
    $scope.getCommentById=function(comment_id){			
		$http.get('http://localhost:8080/rest/comment/'+comment_id).then(function(response){	
			$scope.comment_id= response.data.DATA.comment_id;
			$scope.comment=response.data.DATA.comment;
			console.log(response);
		});					
	}
    
    $scope.updateComment=function(){
		data={
				comment_id:$scope.comment_id,
				comment:$scope.comment
			}
		console.log(data);
		$http.put('http://localhost:8080/rest/comment',data).then(function(response){
			swal("Update Successfully!", "You clicked the button!", "success");
			$scope.getAllComment();
			console.log(response);
		});
	}
    
    $scope.deleteComment=function(comment_id){	
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
					
					$http.delete('http://localhost:8080/rest/comment/'+comment_id).then(function(response){
						$scope.getAllComment();
					});
					
					swal("Deleted!",
						"Your imaginary file has been deleted.",
						"success");   
				} else {     
					swal("Cancelled", "Your imaginary file is safe :)", "error");   
				} 
		});

	}
    
	$scope.getAllRestaurants = function () {
		$http.get('http://localhost:8080/rest/restaurant')
	    .then(function (response) {
	    	console.log(response);
	    	$scope.restaurants = response.data.DATA;
	    });
	}
	$scope.getAllRestaurants();
    
//    $scope.clearCommentForm = function(){
//    	
//		comment: $scope.comment = '';
//		rest_name: $scope.rest_name = '';
//		first_name: $scope.first_name = '';
//		last_name: $scope.last_name = '';
//	 
//    }
 });
