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
</head>
<body style=";background:#ffffff">

      <div class="container" style="margin-top:70px;background:#ffffff;">
      		<div class="logo"  style="width:500px;margin:0 auto;align:center;">
      			<img class="navbar-brand img-fluid logo text-xs-center" src="${pageContext.request.contextPath}/resources/images/logo.png">
      		</div>
      		<div style="width:500px;margin:0 auto;">
	      		<form class="formlogin"  action="login" id="frmLogin" method="POST">
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
<script type="text/javascript">
        
        $(function() {
        	
        	$("#frmLogin").submit(function(e){
       		
       		  e.preventDefault();
       			
       		  $.ajax({
  	            url: "${pageContext.request.contextPath}/login",
  	            type: "POST",
  	            data: $("#frmLogin").serialize(),
//   	            beforeSend: function (xhr) {
//   	                xhr.setRequestHeader("X-Ajax-call", "true");
//   	            },
  	            success: function(data) {
  	            	if(data == "User account is locked"){
  	            		alert(data);
  	            	}else if(data == "User is disabled"){
  	            		alert(data);
  	            	}else if(data == "Bad credentials"){
  	            		alert(data);
  	            	}else{
  	            		alert(data);
  	            		location.href = "${pageContext.request.contextPath}/"+data;
  	            	}
  	            	
  	            },
  	         	error: function(data){
  	         		console.log(data);
  				}
  	        });
       			
       		});
	      

        </script>
        
</body>
</html>