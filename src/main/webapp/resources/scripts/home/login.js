$('#login').on('hidden.bs.modal',
function(e) {
	$.ajax({
		url : "/login",
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
				swal({
					  title: "LOGIN SUCCESSFULLY!",
					  type: "success",
					  showCancelButton: false,
					  closeOnConfirm: false,
					  showConfirmButton: false
				});
				
					//window.location.href = data;
				 	location.reload();
			 }
		 },
			error : function(data) {
				console.log(data);
			}
	 });
});