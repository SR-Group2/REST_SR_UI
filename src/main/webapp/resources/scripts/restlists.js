var currentPage = 1;
var keyword ="";
/*================= Get Category ===================*/
var app = angular.module("app",[]);
app.controller("mainCtrl", function($scope,$http){
	$scope.getRestype = function () {
    	$http.get("/rest/restype?keyword="+ keyword+"&page="+ currentPage+ "&limit=20")
	    	.then(function (response) {
	    	$scope.categories = response.data.DATA;
	    	console.log($scope.categories);
	    });
	}
	$scope.getRestype();
})


function detailRest(id){
	
	window.location.href = "/detail_rest/"+id;
}
	
$(function(){//==================START BLOCK JQUERY =================

var id = window.location.href.substring(window.location.href.lastIndexOf('/') + 1);
var q = id.split("=");


/* =======================  Load Data With Pagination ================== */
restaurant = {};
currentPage = 1;
var check = true;
var limit = 12;
restaurant.getRest = function(currentPage, id) {
	
	$.ajax({
		url : "/rest/restaurant/list/"+id+"?page="+currentPage+"&limit="+limit,
	type : 'GET',
	beforeSend : function(xhr) {
		xhr.setRequestHeader("Accept",
				"application/json");
		xhr.setRequestHeader("Content-Type",
				"application/json");
	},
	success : function(data) {
		$("#pagination").hide();
		if (data.STATUS != false) {
			console.log("getRest", data);
			//=========== protect list path_name ===========
			for(var i=0;i<data.DATA.length;i++){
				if(data.DATA[i].restpictures[0] == null){
					console.log("null");
					data.DATA[i].restpictures[0] = {
							path_name: "/resources/upload/restaurant/thumnail_rest.jpg"
					}
				}
			}
			//=========== end protect list path_name ===========
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
};

restaurant.setPagination = function(totalPage, currentPage) {
	
	$('#pagination').bootpag({
	total : totalPage,
	page : currentPage,
	maxVisible : 10,
	leaps : true,
	firstLastUse : true,
	first : '←',
	last : '→',
	wrapClass : 'pagination',
	activeClass : 'active',
	disabledClass : 'disabled',
	nextClass : 'next',
	prevClass : 'prev',
	lastClass : 'last',
	firstClass : 'first'
}).on("page", function(event, currentPage) {
	
	restaurant.getRest(currentPage,id);
	check = false;
});

	$('#pagination .bootpag li').addClass("page-item");
	$('#pagination .bootpag li a').addClass("page-link");

};

/* ======================= search from home page ================== */
searchRestByQuery(q[1]);

/* ================= Run First Load With Click Id ==================*/
restaurant.getRest(currentPage, id);

/* =======================   Load Data According to typehead select  With Pagination ================== */
function searchRestByQuery(keywords){
	$.ajax({ 
	    url:"/rest/restaurant/search?keyword="+keywords+"&page="+currentPage+"&limit=12", 
    type: 'GET',
    beforeSend: function(xhr) {
        xhr.setRequestHeader("Accept", "application/json");
        xhr.setRequestHeader("Content-Type", "application/json");
    },
    success: function(data) { 
    	  
    	console.log(data);
    	if (data.STATUS != false) {
			console.log("select by type of restype ",data);
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
			check = false; 
		} else {
				$("#pagination").hide();
				$("#getRest").empty();
			}
	   
	    }
	});
}
$("#fa-btnsearch").on("click", function(){
	var keywords = $("#keyword").val();
	searchRestByQuery(keywords);
	$("#getRest").css("height", "550px");
});

$('#keyword').on('typeahead:selected', function(){ 

var keyword = $(this).val();
check = true;
$.ajax({ 
    url:"$/rest/restaurant/search?keyword="+keyword+"&page="+currentPage+"&limit=12", 
    type: 'GET',
    beforeSend: function(xhr) {
        xhr.setRequestHeader("Accept", "application/json");
        xhr.setRequestHeader("Content-Type", "application/json");
    },
    success: function(data) { 
    	console.log(data);
    	if (data.STATUS != false) {
			console.log(data);
			//=========== protect list path_name ===========
			for(var i=0;i<data.DATA.length;i++){
				if(data.DATA[i].restpictures[0] == null){
					console.log("null");
					data.DATA[i].restpictures[0] = {
							path_name: "/resources/upload/restaurant/thumnail_rest.jpg"
					}
				}
			}
			//=========== end protect list path_name ===========
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
//==================== search filter by restype =========
$("#searchRest").on("click change",function(){
	$("#getRest").css("height", "100%");
	var filterRestype = $("#filterRestype").val();
	restaurant.getRest(currentPage, filterRestype);
});


// ==================== Get Restaurant Type ============================

var substringMatcher = function(strs) {
	  return function findMatches(q, cb) {
	    var matches, substringRegex;
	    matches = [];
	    substrRegex = new RegExp(q, 'i');

    $.each(strs, function(i, str) {
      if (substrRegex.test(str)) {
        matches.push(str);
      }
    });

    cb(matches);
  };
};

var states;

var bestPictures = new Bloodhound({
  datumTokenizer: Bloodhound.tokenizers.obj.whitespace('value'),
  queryTokenizer: Bloodhound.tokenizers.whitespace,
  remote: {
        url: "/rest/restaurant/search?keyword=%QUERY%"+"&page="+currentPage+"&limit=12",
        wildcard: '%QUERY%',
        filter: function (restaurants) {
            return $.map(restaurants.DATA, function (restaurant) {
                return {
                        value: restaurant.rest_name
                };
            });
        }
    }
});

$('#remote .typeahead').typeahead(null, {
  	name: 'best-pictures',
  	display: 'value',
  	source: bestPictures
});
	
//==================== LOGIN  ===================
		
$('#login').on('hidden.bs.modal',function(e) {
	console.log($("#frmLogin").serialize());
	$.ajax({
		url : "${pageContext.request.contextPath}/login",
		type : "POST",
		data : $("#frmLogin").serialize(),
		success : function(data) {
			if (data == "User account is locked") {
				alert(data);
			} else if (data == "User is disabled") {
				alert(data);
			} else if (data == "Bad credentials") {
				alert(data);
			} else {
				swal("Welcome To Nham Ey", "You clicked the button!", "success")
				window.location.href = "${pageContext.request.contextPath}/"
						+ data;
			}
		},
		error : function(data) {
			console.log(data);
		}
	});
});//================== EDD LOGIN POP UP
				
});//==================START BLOCK JQUERY =================