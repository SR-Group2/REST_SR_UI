<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Home</title>
</head>
<body>
<h1>Home</h1>



<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script type="text/javascript">
        
        $(function() {
        	
       		user = {}; 	
        	
       		user.get = function(){
       			$.ajax({ 
    			    url: "http://localhost:8080/rest/user/get", 
    			    type: 'GET', 
    			    beforeSend: function(xhr) {
                        xhr.setRequestHeader("Accept", "application/json");
                        xhr.setRequestHeader("Content-Type", "application/json");
                    },
    			    success: function(data) { 
    					console.log(data);  
    					
    			    },
    			    error:function(data,status,er) { 
    			        console.log("error: "+data+" status: "+status+" er:"+er);
    			    }
    			});
       		};
       		
       		user.updateUser = function(){
       			frmData = {
       				  "first_name": "string",
       				  "last_name": "string",
       				  "salt": "string",
       				  "dob": "2016-08-09T04:53:52.641Z",
       				  "joined": "2016-08-09T04:53:52.641Z",
       				  "picture": "string",
       				  "username": "string",
       				  "password": "string",
       				  "role": {
       				    "id": 0,
       				    "key": "string",
       				    "name": "string"
       				  },
       				  "email": "string",
       				  "role_name": "string",
       				  "roles": [
       				    {
       				      "id": 0,
       				      "key": "string",
       				      "name": "string"
       				    }
       				  ]
       				};
       			
          		$.ajax({ 
      			    url: "http://localhost:8080/rest/user", 
      			    type: 'PUT', 
      			    beforeSend: function(xhr) {
                          xhr.setRequestHeader("Accept", "application/json");
                          xhr.setRequestHeader("Content-Type", "application/json");
                      },
                      data: JSON.stringify(frmData), 
      			    success: function(data) { 
      					console.log(data);
      			    },
      			    error:function(data,status,er) { 
      			        console.log("error: "+data+" status: "+status+" er:"+er);
      			    }
      			});
       		}
        	
        	user.addUser = function(){
        		frmData = {
        				  "first_name": "a",
        				  "last_name": "a",
        				  "picture": "a",
        				  "USERNAME": "a",
        				  "PASSWORD": "a",
        				  "ROLE": {
        				    "ID": 3
        				  },
        				  "EMAIl": "a"

        				};
        		$.ajax({ 
    			    url: "http://localhost:8080/rest/user", 
    			    type: 'POST', 
    			    beforeSend: function(xhr) {
                        xhr.setRequestHeader("Accept", "application/json");
                        xhr.setRequestHeader("Content-Type", "application/json");
                    },
                    data: JSON.stringify(frmData), 
    			    success: function(data) { 
    					console.log(data);
    			    },
    			    error:function(data,status,er) { 
    			        console.log("error: "+data+" status: "+status+" er:"+er);
    			    }
    			});
        	}
        
        	
        	// user.get();
        	user.addUser();
        //user.updateUser();
        	
        });
        </script>
        
 </body>
</html>