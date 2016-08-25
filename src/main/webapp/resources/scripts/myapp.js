var app= angular.module('app',[]);
app.controller('mainCtrl',function($scope, $http,$filter){
	$scope.user_id = parseInt($("#user_id").text());
	
	$scope.getAllStandardUser = function(){
		$http.get('/rest/user/'+$scope.user_id).then(function(response){
			$scope.user_id= response.data.DATA.user_id;
			$scope.first_name= response.data.DATA.first_name;
			$scope.last_name=response.data.DATA.last_name;
			$scope.username=response.data.DATA.username;
			$scope.email=response.data.DATA.email;
			$scope.dob =  $filter('date')(response.data.DATA.dob, 'yyyy-MM-dd');
			$scope.gender= response.data.DATA.gender;
			$scope.picture= response.data.DATA.picture;
			console.log(response);
		});	
	}
	
	$scope.getAllStandardUser();
	
	$scope.getAllFavReste = function(){
		
		$http.get('/rest/favourite-restaurant/get-fav-rest-by-user-id/'+$scope.user_id).then(function(response){
			$scope.favouriteRestaurants = response.data.DATA;	
		/*	$scope.user = $scope.favouriteRestaurants[0].user;*/
			console.log(response);
		});
	}
	$scope.getAllFavReste();
	
	

// ========================= Update User ==============================
	var id = window.location.href.substring(window.location.href.lastIndexOf('/') + 1);

	$scope.getUserById=function(id){
		window.location.href= "http://localhost:8080/editeprofile/"+id;
	}
	
	$scope.userDetail=function(id){
	
		$http.get('http://localhost:8080/rest/user/'+id).then(function(response){
			$scope.id= response.data.DATA.user_id;
			$scope.firstName= response.data.DATA.first_name;
			$scope.lastName=response.data.DATA.last_name;
			$scope.username=response.data.DATA.username;
			$scope.email=response.data.DATA.email;
			$scope.password=response.data.DATA.password;
			$scope.dob =  $filter('date')(response.data.DATA.dob, 'yyyy-MM-dd');
			$scope.gender= response.data.DATA.gender;
			$scope.picture = response.data.DATA.picture;
		});	
	}
	
	$scope.userDetail(id);
	
	$scope.updateUser=function(){
	
		var frmData = new FormData();
		
		data={
				'user_id':id,
				'first_name':$scope.first_name,
				'last_name':$scope.last_name,
				'username': $scope.username,
				'password': $scope.password,
				'email': $scope.email,
				'dob': $('input[name="date"]').val(),
				'gender':$scope.gender,
				'role': {
					'id': 1
				}
			}
		
		var picture = angular.element('#file')[0].files;
		for(var i=0; i<picture.length; i++){
			frmData.append("picture", picture[i]);
		}
		
		frmData.append('json_data', JSON.stringify(data));

		$http({
			url:'http://localhost:9999/api/upload/user/update',
			method: 'POST',
			data: frmData,
			transformRequest: angular.identity,
            headers: {'Content-Type': undefined}
		}).then(function(response){
			console.log(response.data);
			swal({   
        			title: "Update SUCCESSFULLY!",   
        			text: "THANK YOU",   
        			type: "success",   
        			confirmButtonColor: "#007d3d",   
        			closeOnConfirm: false,   
        			closeOnCancel: false }, 
        			function(isConfirm){   
        				if(isConfirm) {     				
        					window.location.href="/home";
        				}else {     
        					swal("Cancelled", "Your imaginary file is safe !", "error");   
        				} 
        			});
			
		}, function(error){
			console.log(error.data);
			alert('failed to upload data! Please Try again !!!!!');
		});
		
		
	}// end update suer 	
	
	
	
});
app.controller('signUpCtrl', function($scope,$http){
	$scope.getAllUsers=function(){
		$http.get('/rest/user').then(function(response){
			$scope.users=response.data.DATA;
		});
	}
	$scope.getAllUsers();
	
	/*$scope.addUser=function(){
		data={
				"first_name": $scope.txtfirstname,
				"last_name": $scope.txtlastname,
				"username": $scope.txtusername,
				 "email": $scope.txtemail,
				"password": $scope.txtpassword,
				"dob": $('input[name=date]').val(),
				'gender': $scope.txtgender
				};
		console.log(data);
		return;
		$http.post('/rest/user/sign-up', data).then(function(response){
			swal("Successfully Registered!", "You clicked the button!", "success");
			window.location.href= "http://localhost:8080/login";
		});
	}*/
	

	$scope.addUser = function(){
		

		var frmData = new FormData();
		
		data={
			"first_name": $scope.txtfirstname,
			"last_name": $scope.txtlastname,
			"username": $scope.txtusername,
			"email": $scope.txtemail,
			"password": $scope.txtpassword,
			"dob": $('input[name=dob]').val(),
			'gender': $scope.txtgender,
			"role": {
				"id": $scope.roles
			  }
				
		};
		//============= Cache File from user profile to server 
		var picture = angular.element('#file')[0].files;
		for(var i=0; i<picture.length; i++){
			frmData.append("picture", picture[i]);
		}
		
		frmData.append('json_data', JSON.stringify(data));
		
		
		$http({
			url:'http://localhost:9999/api/upload/signup',
			method: 'POST',
			data: frmData,
			transformRequest: angular.identity,
	        headers: {'Content-Type': undefined}
		}).then(function(response){
			console.log(response.data);
			swal({   
	    			title: "SIGN UP SUCCESSFULLY!",   
	    			text: "THANK YOU",   
	    			type: "success",   
	    			confirmButtonColor: "#007d3d",   
	    			closeOnConfirm: false,   
	    			closeOnCancel: false }, 
	    			function(isConfirm){   
	    				if(isConfirm) {     				
	    					window.location.href="/home";
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





