<!DOCTYPE html>
<html>
  <head>
    <meta name="viewport" content="initial-scale=1.0, user-scalable=no">
    <meta charset="utf-8">
    <title>Directions service</title>
    <style>
      html, body {
        height: 100%;
        margin: 0;
        padding: 0;
      }
      #map {
        height: 100%;
      }
      #floating-panel {
        position: absolute;
        top: 10px;
        left: 25%;
        z-index: 5;
        background-color: #fff;
        padding: 5px;
        border: 1px solid #999;
        text-align: center;
        font-family: 'Roboto','sans-serif';
        line-height: 30px;
        padding-left: 10px;
      }
    </style>
  </head>
  <body>
    <div id="floating-panel">
	    <select id="start">
	      <option selected value="11.5732615, 104.8765392">Your Location</option>
	    </select>
	    
	    <select id="end">
	      <option selected value="11.568673, 104.919539">Your Restaurant</option>
	    </select>
    </div>
    
    
    <div id="map"></div>
    
    
    <script src="${pageContext.request.contextPath}/resources/map/route_for_user.js"></script>
    <script async defer
    src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBwcO947dFk6IkMpQlHtrCUDjOiyfp19AI&callback=initMap">
    </script>
  </body>
</html>