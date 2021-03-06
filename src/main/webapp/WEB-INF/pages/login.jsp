<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>NHAM EY Welcome </title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/style.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/screen.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/scripts/sweetalert/sweetalert.css">
</head>
<body style=";background:#ffffff">

      <div class="container" style="margin-top:70px;background:#ffffff;">
      		<div class="logo"  style="width:200px;margin:0 auto;align:center;">
      			<a href="/home">
      			<img class="navbar-brand logo text-xs-center" src="${pageContext.request.contextPath}/resources/images/logo.png" align="center">
      			</a>
      		</div>
      		<div style="width:500px;margin:0 auto;">
	      		<form class="formlogin"  id="frmLogin">
	      			<fieldset>
		      			<h3 class="text-success text-xs-center">Welcome</h3>
		      			<div class="form-group">
		      				<label class="text-xs-left">Username</label>
		      				<input type="text" class="form-control form-control-succes" name="username" placeholder="enter your username">
		      			</div>
		      			<div class="form-group">
		      				<label class="text-xs-left">Password</label>
		      				<input type="password" class="form-control form-control-succes" name="password" placeholder="enter your password">
		      			</div>
		      			<div class="form-group">
		      				<button type="submit" class="btn btn-outline-success">Sing in</button>
		      			</div>
	      			</fieldset>
	      		</form>
      	</div>
      </div>
 
<script src="${pageContext.request.contextPath}/resources/scripts/jquery-2.1.4.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/scripts/sweetalert/sweetalert.min.js"></script> 
<script type="text/javascript">
        
        $(function() {
        	
        	$("#frmLogin").submit(function(e){
       		
	       		  e.preventDefault();
	       			
	       		  $.ajax({
	  	            url: "/login",
	  	            type: "POST",
	  	            data: $("#frmLogin").serialize(),
	  	            success: function(data) {
	  	            	if(data == "User account is locked"){
	  	            		alert(data);
	  	            	}else if(data == "User is disabled"){
	  	            		swal("LOGIN FAILED!", data, "error");
	  	            	}else if(data == "Bad credentials"){
	  	            		swal("LOGIN FAILED!", data, "error");
	  	            	}else{
	  	            		
	  	            		swal({   
	  	          			title: "LOGIN SUCCESSFULLY!",   
	  	          			text: "THANK YOU",   
	  	          			type: "success",   
	  	          			confirmButtonColor: "#007d3d",   
    						closeOnConfirm: false,   
	  	          			closeOnCancel: false }, 
	  	          			function(isConfirm){   
	  	          				if(isConfirm) {
	  	          					if(data == "/admin")
	  	          						window.location.href= data;
	  	          					else
	  	          						window.location.href= "/home";
	  	          				}else {     
	  	          					swal("Cancelled", "Your imaginary file is safe :)", "error");   
	  	          				} 
	  	          			});
	       		  
	  	            	}
	  	            },
	  	         	error: function(data){
	  	         		console.log(data);
	  	         	}
	       		  });
       		  
        	});
        	
        });
	      

        </script>
        
</body>
</html>