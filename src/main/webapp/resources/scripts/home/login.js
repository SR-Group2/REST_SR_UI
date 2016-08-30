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
					swal("Welcome To Nham Ey", "You clicked the button!", "success")
					window.location.href = "/"+ data;
			 }
		 },
			error : function(data) {
				console.log(data);
			}
	 });
});