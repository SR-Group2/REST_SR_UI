

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
			swal("Successfully Inserted!", "You clicked the button!", "success");
		}, function(error){
			//console.log(error);
		});
		
	}
    /* ===================== Get Comment By Id ================== */
    $scope.getCommentById=function(comment_id){			
		$http.get('http://localhost:8080/rest/comment/'+comment_id).then(function(response){	
			$scope.comment_id= response.data.DATA.comment_id;
			$scope.comment=response.data.DATA.comment;
			console.log(response);
		});					
	}
    /* ==================== Update ======================= */
    $scope.updateComment=function(){
		data={
				comment_id:$scope.comment_id,
				comment:$scope.comment
			}
		//console.log(data);
		$http.put('http://localhost:8080/rest/comment',data).then(function(response){
			swal("Update Successfully!", "You clicked the button!", "success");
			$scope.getAllComment();
			//console.log(response);
		});
	}
    /* ================================= Delete Comment ========================= */
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
    /* ============================= Get All Restaurant in Combo Box ================ */
	$scope.getAllRestaurants = function () {
		$http.get('http://localhost:8080/rest/restaurant')
	    .then(function (response) {
	    	console.log(response);
	    	$scope.restaurants = response.data.DATA;
	    });
	}
	$scope.getAllRestaurants();
 });

/* ================================= Brand Controller by Phanit =======================================*/
app.controller('brandCtrl', function($scope, $http) {
	//$scope.brands = '';

	$scope.getAllBrand = function () {
	
    $http.get('http://localhost:8080/rest/brand')
    .then(function (response) {
    	$scope.brands = response.data.DATA;
    }),function () {
    	
    };

 }	
 $scope.getAllBrand();
 /* =============== Adding Brand =======================*/
// $scope.$watch('address_id', function(x){
//	alert(x); 
// });
// 
// $scope.$watch('rest_id', function(x){
//		alert(x); 
//	 });
//	 
 
 $scope.addBrand=function(e){
 	e.preventDefault();
 	//console.log($scope.brand_name);
	data={
			contact: $scope.contact,
			brand_name: $scope.brand_name,
			'address':{
				address_id: $scope.address_id
			},
			'rest':{
				rest_id: $scope.rest_id
			}
	};
	$http.post('http://localhost:8080/rest/brand', data)
	.then(function(response){
		//console.log(response);
		$scope.getAllBrand();
		//swal("Successfully Inserted!", "You clicked the button!", "success");
	}, function(error){
		console.log(error);
	});
	
}
/* ================== Get Address in Select option in Brand ====================== */
	 
	 $scope.getAllAddresses = function () {
			$http.get('http://localhost:8080/rest/address')
		    .then(function (response) {
		    	//console.log(response);
		    	$scope.addresses = response.data.DATA;
		    });
		}
		$scope.getAllAddresses();

/* ==================== Get Brand by ID ================== */
	$scope.getBrandById = function(brand_id){
		$http({
			url: 'http://localhost:8080/rest/brand/'+brand_id,
			method:'GET'
		}).then(function(response){
			console.log(response);
			$scope.brand = response.data.DATA;
			$scope.contact = response.data.DATA.contact;
			$scope.rest_name = response.data.DATA.rest.rest_name;
			$scope.brand_id = response.data.DATA.brand_id;
			$scope.rest_name = response.data.DATA.rest.rest_name;
			$scope.address_id = response.data.DATA.address.address_id;
			$scope.street = response.data.DATA.address.street;
			$scope.district = response.data.DATA.address.district;
			$scope.communce = response.data.DATA.address.communce;
			$scope.province = response.data.DATA.address.province;
			
		},function(){

		});
		
	}
/* ===================== Update Brand ===================== */
	$scope.updateBrand = function(){
		data={
				brand_id: $scope.brand_id,
				brand_name: $scope.brand_name,
				contact: $scope.contact,
				"rest":{
					rest_name: $scope.rest_name
				},
				"address":{
					street: $scope.street,
					district: $scope.district,
					communce: $scope.communce,
					province: $scope.province
				}
			}
		$http.put('http://localhost:8080/rest/brand',data).then(function(response){
			alert('success');
			//console.log(data);
			//console.log(response);
			
		});
	}
/* =========================== Delete Brand ========================= */
	$scope.deleteBrand = function(brand_id) {
		$http.delete('http://localhost:8080/rest/brand/' + brand_id)
		.then(function(response){
			$scope.getAllBrand();
		});	
	}
});

/*====================== Category Controller Pheara with Phanit========================================*/
app.controller("categoryCtrl", function($scope, $http){
	$scope.getAllCategory= function(){	
		$http.get('http://localhost:8080/rest/category').then(function(response){
			$scope.category= response.data.DATA;
		});
	}
	$scope.getAllCategory();
	
	$scope.addCategory=function(){
		data={
				'category_name': $scope.txtcategory_name
		}
		$http.post('http://localhost:8080/rest/category',data).then(function(response){
			swal("Successfully Inserted!", "You clicked the button!", "success");
			$scope.getAllCategory();
		});
	}
	
	$scope.deleteCategory = function (id){
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
					$http.delete('http://localhost:8080/rest/category/'+id).then(function(response){
						$scope.getAllCategory();
					});
					
					swal("Deleted!",
						"Your imaginary file has been deleted.",
						"success");   
				} else {     
					swal("Cancelled", "Your imaginary file is safe :)", "error");   
				} 
		});
	}
	$scope.getCategoryById= function(id){
		$http.get('http://localhost:8080/rest/category/'+id).then(function(response){
			$scope.category=response.data.DATA;
			$scope.category_id= response.data.DATA.category_id;
			$scope.category_name= response.data.DATA.category_name;
		});
	}
	$scope.updateCategory= function(){
		data={
				'category_id': $scope.category_id,
				'category_name': $scope.category_name
		}
		$http.put('http://localhost:8080/rest/category/',data).then(function(response){
			$scope.getAllCategory();
		});
	}
});

/*====================== Category Controller Pheara with Phanit ========================================*/

/* =========================== Menu or Restaurant Type Controller By Kong Sophanit ============================== */

app.controller("restypeCtrl", function($scope, $http){
	/*=========== Get All the Restaurant Types ===========*/
	/*$scope.getAllRestypes = function(){	
		$http.get('http://localhost:8080/rest/restype?page=1&limit=15').then(function(response){
			$scope.restypes = response.data.DATA;
		});
	}*/
	
	//================= GET ALL RESTAURANTS TYPE  WITH PAGINATION =====================
	var check = true;
	var restypes = [];
	var currentPage = 1;
	
	$scope.getAllRestypes = function (currentPage) {
	    $http.get('http://localhost:8080/rest/restype?limit=15&page='+currentPage)
	    .then(function (response) {
	    	$scope.restypes = response.data.DATA;
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
		    	$scope.getAllRestypes(currentPage);
		    }); 	
		};
					
	$scope.getAllRestypes(currentPage);
	
	/* ================ Insert Into Table  types =================== */
	
	$scope.addRestype = function(){
		data={	
				'restype_name': $scope.restype_name,
				'restype_name_kh': $scope.restype_name_kh,
				'restype_picture': $scope.restype_picture,
				'description': $scope.description
		}
		$http.post('http://localhost:8080/rest/restype', data).then(function(response){
			swal("Added Successfully!", "You clicked the button!", "success");
			$scope.getAllRestypes();
		});
	}
	
	/* ============== Delete Restaurant type ======================= */
	
	$scope.deleteRestype = function(restype_id) {
		$http.delete('http://localhost:8080/rest/restype/' + restype_id)
		.then(function(response){
			$scope.getAllRestypes();
		});	
	}
	
	/* ==================== Find Restaurant type By Id ==================== */
	
	$scope.getRestypeById = function(restype_id){
		$http.get('http://localhost:8080/rest/restype/'+restype_id).then(function(response){
			$scope.restype = response.data.DATA;
			$scope.restype_id = response.data.DATA.restype_id;
			$scope.restype_name = response.data.DATA.restype_name;
			$scope.restype_name_kh = response.data.DATA.restype_name_kh;
			$scope.restype_picture = response.data.DATA.restype_picture;
			$scope.description = response.data.DATA.description;
		});
	}
	/* ================== Update Restaurant Type =========================== */
	var frmData = new FormData();
	$scope.updateRestype = function(){
		data={
				'restype_id': $scope.restype_id,	
				'restype_name': $scope.restype_name,
				'restype_name_kh': $scope.restype_name_kh,
				'description': $scope.description
		}
		$http.put('http://localhost:8080/rest/restype/',data).then(function(response){
			$scope.getAllCategory();
		});
	}
});
