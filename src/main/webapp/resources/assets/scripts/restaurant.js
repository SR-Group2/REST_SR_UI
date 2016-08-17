//var restApp= angular.module('restApp',['btorfs.multiselect']);
/*=========================== Restaurant Controller ===========================*/

app.controller('restCtrl', function($scope, $http) {

	
	
	$scope.restypes = [];
	
//	 for (var i = 0; i < 16 ; i++) {
//		 $scope.restypes.push({restype_name: 'element' + i, restype_id: i});
//  
//      //console.log($scope.data_restypes[i].restype_name)
//	 }
	
	$scope.restypes = [
		     	          {restype_name: 'Khmer Food', restype_id: 1},
		     	          {restype_name: 'BBQ', restype_id: 2},
		     	          {restype_name: 'Thai Food', restype_id: 3},
		     	          {restype_name: 'Vegeterian', restype_id: 4},
		     	          {restype_name: 'Sea Food', restype_id: 5},
		     	          {restype_name: 'Soup', restype_id: 6},
		     	          {restype_name: 'Beer', restype_id: 7},
		     	          {restype_name: 'Coffee and Tea', restype_id: 8},
		     	          {restype_name: 'Noodle', restype_id: 9},
		     	          {restype_name: 'Japanese Food', restype_id: 10},
		     	          {restype_name: 'Korean Food', restype_id: 11},
		     	          {restype_name: 'Western Food', restype_id: 12},
		     	          {restype_name: 'Buffet', restype_id: 13},
		     	          {restype_name: 'Porridge', restype_id: 14},
		     	          {restype_name: 'Street Food', restype_id: 15}
		     	      ];

//	for (var i = 0; i < 16 ; i++) {
//        $scope.restypes.push({restype_name: 'testing' + i, restype_id: i});
// 
//    }
                
	 //================= Add RESTAURANTS =======================
	
	$scope.getCategoryRest = function () {
		
	    $http.get("http://localhost:8080/rest/restype?page=1&limit=20")
	    .then(function (response) {
	    
	    	$scope.data_restypes = response.data.DATA;
	    	//console.log($scope.data_restypes);
	    	
	    	

	    	
	    	var loop = $scope.data_restypes.length;
	    	console.log($scope.data_restypes.length);
	    	 for (var i = 0; i < 16 ; i++) {
	    		 $scope.restypes.push({name: 'element' + i, id: i});
  	    
  	        //console.log($scope.data_restypes[i].restype_name)
	    	 }
	    	 
	    	 //ms();
	    	
	    });
	}
	
	$scope.getMenuRest = function () {
	    $http.get("http://localhost:8080/rest/category")
	    .then(function (response) {
	    
	    	$scope.menus = response.data.DATA;
	    });
	}
	
	$scope.getCategoryRest();
	$scope.getMenuRest();
	 //=================END Add RESTAURANTS =====================
	
	//================= GET ALL RESTAURANTS =====================
	$scope.getAllRestaurants = function () {
	    $http.get('http://localhost:8080/rest/restaurant/category')
	    .then(function (response) {
	    	console.log(response);
	    	$scope.restaurants = response.data.DATA;
	    });
	}
    $scope.getAllRestaurants();
  //=================  ADD RESTAURANTS =====================
    $scope.addRestaurant = function(){
    	$http({
    		url: 'http://localhost:8080/rest/restaurant',
    		data:{
    			"rest":{
    				rest_name: $scope.rest_name
    			},
    			"restype":{
    				restype_name: $scope.restype_name
    			},
    			contact: $scope.contact,
    			about: $scope.about,
    			street: $scope.street,
    			communce: $scope.communce,
    			district: $scope.district,
    			province: $scope.province
    		},
    		method:'POST'
    	}).then(function(response){
    		 $scope.getAllRestaurants();
    	},function(){

    		});

    	}
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
   //================= UPDATE RESTAURANTS =====================
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
    
    $scope.deleteRestaurant = function(rest_id) {
		$http.delete('http://localhost:8080/rest/restaurant/' + rest_id)
		.then(function(response){
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


function ms(){
	!function(){"use strict";var a=angular.module("btorfs.multiselect",["btorfs.multiselect.templates"]);a.getRecursiveProperty=function(a,b){return b.split(".").reduce(function(a,b){return a?a[b]:null},a)},a.directive("multiselect",["$filter","$document","$log",function(b,c,d){return{restrict:"AE",scope:{options:"=",displayProp:"@",idProp:"@",searchLimit:"=?",selectionLimit:"=?",showSelectAll:"=?",showUnselectAll:"=?",showSearch:"=?",searchFilter:"=?",disabled:"=?ngDisabled",defaultText:"@"},require:"ngModel",templateUrl:"multiselect.html",link:function(b,e,f,g){b.selectionLimit=b.selectionLimit||0,b.searchLimit=b.searchLimit||25,b.defaultText=b.defaultText||"Select",b.searchFilter="",b.resolvedOptions=[],"function"!=typeof b.options&&(b.resolvedOptions=b.options),"undefined"!=typeof f.disabled&&(b.disabled=!0),b.toggleDropdown=function(){b.open=!b.open};var h=function(a){e[0].contains(a.target)||b.$apply(function(){b.open=!1})};c.on("click",h);var i=function(){g.$viewValue?(b.selectedOptions=b.resolvedOptions.filter(function(a){for(var c=b.getId(a),d=0;d<g.$viewValue.length;d++){var e=b.getId(g.$viewValue[d]);if(c===e)return!0}return!1}),b.unselectedOptions=b.resolvedOptions.filter(function(a){return b.selectedOptions.indexOf(a)<0})):(b.selectedOptions&&(b.selectedOptions=[]),b.unselectedOptions=b.resolvedOptions.slice())};g.$render=function(){i()},g.$viewChangeListeners.push(function(){i()}),g.$isEmpty=function(a){return a?0===a.length:!0};var j=b.$watch("selectedOptions",function(){g.$setViewValue(angular.copy(b.selectedOptions))},!0);b.$on("$destroy",function(){c.off("click",h),j&&j()}),b.getButtonText=function(){if(b.selectedOptions&&1===b.selectedOptions.length)return b.getDisplay(b.selectedOptions[0]);if(b.selectedOptions&&b.selectedOptions.length>1){var a;return a=angular.isDefined(b.selectedOptions)?b.selectedOptions.length:0,0===a?b.defaultText:a+" selected"}return b.defaultText},b.selectAll=function(){b.selectedOptions=b.resolvedOptions,b.unselectedOptions=[]},b.unselectAll=function(){b.selectedOptions=[],b.unselectedOptions=b.resolvedOptions},b.toggleItem=function(a){"undefined"==typeof b.selectedOptions&&(b.selectedOptions=[]);var c=b.selectedOptions.indexOf(a),d=-1!==c;if(d)b.unselectedOptions.push(b.selectedOptions[c]),b.selectedOptions.splice(c,1);else if(!d&&(0===b.selectionLimit||b.selectedOptions.length<b.selectionLimit)){var e=b.unselectedOptions.indexOf(a);b.unselectedOptions.splice(e,1),b.selectedOptions.push(a)}},b.getId=function(c){return angular.isString(c)?c:angular.isObject(c)?b.idProp?a.getRecursiveProperty(c,b.idProp):(d.error("Multiselect: when using objects as model, a idProp value is mandatory."),""):c},b.getDisplay=function(c){return angular.isString(c)?c:angular.isObject(c)?b.displayProp?a.getRecursiveProperty(c,b.displayProp):(d.error("Multiselect: when using objects as model, a displayProp value is mandatory."),""):c},b.isSelected=function(a){if(!b.selectedOptions)return!1;for(var c=b.getId(a),d=0;d<b.selectedOptions.length;d++){var e=b.selectedOptions[d];if(b.getId(e)===c)return!0}return!1},b.updateOptions=function(){"function"==typeof b.options&&b.options().then(function(a){b.resolvedOptions=a,i()})},b.search=function(){var a=0;return function(c){if(a>b.searchLimit)return!1;var d=b.getDisplay(c);if(d){var e=d.toLowerCase().indexOf(b.searchFilter.toLowerCase())>-1;return e&&a++,e}}}}}}])}(),angular.module("btorfs.multiselect.templates",["multiselect.html"]),angular.module("multiselect.html",[]).run(["$templateCache",function(a){a.put("multiselect.html",'<div class="btn-group" style="width: 100%">\n    <button type="button" class="form-control btn btn-default btn-block dropdown-toggle" ng-click="toggleDropdown()" ng-disabled="disabled">\n        {{getButtonText()}}&nbsp;<span class="caret"></span>\n    </button>\n    <ul class="dropdown-menu dropdown-menu-form"\n        ng-style="{display: open ? \'block\' : \'none\'}" style="width: 100%; overflow-x: auto">\n\n        <li ng-show="showSelectAll">\n            <a ng-click="selectAll()" href="">\n                <span class="glyphicon glyphicon-ok"></span> Select All\n            </a>\n        </li>\n        <li ng-show="showUnselectAll">\n            <a ng-click="unselectAll()" href="">\n                <span class="glyphicon glyphicon-remove"></span> Unselect All\n            </a>\n        </li>\n        <li ng-show="(showSelectAll || showUnselectAll)"\n            class="divider">\n        </li>\n\n        <li role="presentation" ng-repeat="option in selectedOptions" class="active">\n            <a class="item-selected" href="" ng-click="toggleItem(option); $event.stopPropagation()">\n                <span class="glyphicon glyphicon-remove"></span>\n                {{getDisplay(option)}}\n            </a>\n        </li>\n        <li ng-show="selectedOptions.length > 0" class="divider"></li>\n\n        <li ng-show="showSearch">\n            <div class="dropdown-header">\n                <input type="text" class="form-control input-sm" style="width: 100%;"\n                       ng-model="searchFilter" placeholder="Search..." ng-change="updateOptions()"/>\n            </div>\n        </li>\n\n        <li ng-show="showSearch" class="divider"></li>\n        <li role="presentation" ng-repeat="option in unselectedOptions | filter:search() | limitTo: searchLimit"\n            ng-if="!isSelected(option)"\n            ng-class="{disabled : selectionLimit && selectedOptions.length >= selectionLimit}">\n            <a class="item-unselected" href="" ng-click="toggleItem(option); $event.stopPropagation()">\n                {{getDisplay(option)}}\n            </a>\n        </li>\n\n        <li class="divider" ng-show="selectionLimit > 1"></li>\n        <li role="presentation" ng-show="selectionLimit > 1">\n            <a>{{selectedOptions.length || 0}} / {{selectionLimit}} selected</a>\n        </li>\n\n    </ul>\n</div>')}]);
}