  function initMap() {
	  	
    	  
    	  //=================== LOAD FIRST MAP POISTION ====================
          var directionsService = new google.maps.DirectionsService;
          var directionsDisplay = new google.maps.DirectionsRenderer;
          var map = new google.maps.Map(document.getElementById('map'), {
                center: {lat: -34.397, lng: 150.644},
                zoom: 15,
                disableDefaultUI: false,
			    scrollwheel: false,
			    draggable: true,
			    mapTypeId: google.maps.MapTypeId.ROADMAP,
			    zoomControlOptions: {
			      position: google.maps.ControlPosition.LEFT_BOTTOM,
			      style: google.maps.ZoomControlStyle.DEFAULT
			    },
			    panControlOptions: {
			      position: google.maps.ControlPosition.LEFT_BOTTOM
			    }
           });
          directionsDisplay.setMap(map);
          
          
          var geoOptions = {
		     timeout: 10 * 1000
		  }
    	 
    	  //=================== GET  USER LOCATION ====================
          if (navigator.geolocation) {
            navigator.geolocation.getCurrentPosition(function(position) {
             var pos = {
                lat: position.coords.latitude,
                lng: position.coords.longitude
              };
             console.log("user location",pos);
              infoWindow.setPosition(pos);
              infoWindow.setContent('Your Location');
              map.setCenter(pos);
              
              //=================== CALL FUNCTION TO SHOW DIRECTION ====================
              
      	      calculateAndDisplayRoute(directionsService, directionsDisplay, pos);
      	    
            }, function() {
              handleLocationError(true, infoWindow, map.getCenter());
            },geoOptions);
          } else {
            // Browser doesn't support Geolocation
            handleLocationError(false, infoWindow, map.getCenter());
          }
          
         //=================== END USER LOCATION ====================
          
       
	
       /*  var onChangeHandler = function() {
          calculateAndDisplayRoute(directionsService, directionsDisplay);
        }; */
       
	        
       /*  document.getElementById('start').addEventListener('load', onChangeHandler);
        document.getElementById('end').addEventListener('load', onChangeHandler); */
        
        
        var infoWindow = new google.maps.InfoWindow({map: map});

          
	   } //=================== END INIT MAP ====================
	
	 //=================== DIRECTION FUNCTION ====================
      function calculateAndDisplayRoute(directionsService, directionsDisplay, pos) {
		console.log("origin", pos);
        directionsService.route({
        
         /*  origin: document.getElementById('start').value, */
          origin:""+pos.lat+","+pos.lng+"",
          //origin: {lat:pos.lat, lng:pos.lng},
          destination: document.getElementById('end').value,
          travelMode: 'DRIVING'
        }, function(response, status) {
          if (status === 'OK') {
            directionsDisplay.setDirections(response);
          } else {
            window.alert('Directions request failed due to ' + status);
          }
        });    
	            
      }
    //=================== HANDLE ERROR FUNCTION  ====================
      function handleLocationError(browserHasGeolocation, infoWindow, pos) {
          infoWindow.setPosition(pos);
          infoWindow.setContent(browserHasGeolocation ?
                                'Error: The Geolocation service failed.' :
                                'Error: Your browser doesn\'t support geolocation.');
      }