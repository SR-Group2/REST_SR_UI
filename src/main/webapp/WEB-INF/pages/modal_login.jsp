<div class="modal fade" id="login" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header text-xs-center">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<img id="myModalLabel" class="logo"
						src="${pageContext.request.contextPath}/resources/images/logo.png"></img>
				</div>
				<div class="modal-body">
					<form class="formlogin" id="frmLogin" method="POST">
						<fieldset>
							<h3 class="text-success text-xs-center">Welcome</h3>
							<div class="form-group">
								<label class="text-xs-left">Username</label> <input type="text"
									class="form-control form-control-succes" name="username"
									placeholder="enter your username">
							</div>
							<div class="form-group">
								<label class="text-xs-left">Password</label> <input
									type="password" class="form-control form-control-succes"
									name="password" placeholder="enter your password">
							</div>
							<div class="form-group">
								<button type="button" class="btn btn-outline-success"
									data-dismiss="modal">Sing in</button>
								-- or -- <a href="#"><img
									src="${pageContext.request.contextPath}/resources/images/facebooklogin.png"></a>
							</div>
						</fieldset>
					</form>
				</div>
			</div>
		</div>
	</div>