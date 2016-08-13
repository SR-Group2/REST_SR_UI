

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
