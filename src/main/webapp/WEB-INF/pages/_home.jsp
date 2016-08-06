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
   						  user_id : 5,
   						  first_name: "admin",
   						  last_name: "admin",
   						  dob: "1993-07-14",
     				 	  username :  "admin",
     				  	  password :  "admin",
     				  	  email : "admin@gmail.com",
     				  	  role : {
     				  		  role_id: 3
     				  	  }
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
        			  
   				 	  username :  "seyha",
   				  	  password :  "group2123456",
   				  	  email : "hiemseyha99@gmail.com",
   				  	  role : {
   				  		  role_id: 3
   				  	  }
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
        	//user.addUser();
        user.updateUser();
        	
        });
        </script>
        
 </body>
</html>