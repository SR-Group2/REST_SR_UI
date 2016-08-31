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
		

	  	
	
	