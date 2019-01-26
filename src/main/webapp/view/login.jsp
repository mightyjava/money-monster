<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<title>Login</title>
<link rel="stylesheet" href="${path}/webjars/bootstrap/4.1.3/css/bootstrap.min.css">
<link rel="stylesheet" href="${path}/webjars/font-awesome/4.7.0/css/font-awesome.min.css">
<style type="text/css">
			body::before {
				background: url("https://mefminute.files.wordpress.com/2015/04/money1.jpg") no-repeat center center fixed;
				content: '';
			  	z-index: -1;
			  	width: 100%;
			  	height: 100%;
			  	position:absolute; 
			  	-webkit-background-size: cover;
			  	-moz-background-size: cover;
			  	-o-background-size: cover;
			 	background-size: cover;
			  	-webkit-filter: blur(10px);
			  	-moz-filter: blur(10px);
			  	-o-filter: blur(10px);
			  	-ms-filter: blur(10px);
			  	filter: blur(10px);
			}
			
			body {
				background-size: cover;
				display: flex;
				align-items: center;
				height: 100vh;
			}
		</style>
<div class="container col-lg-3 col-lg-offset-4">
	<div class="card">
		<div class="card-header">
			<strong><i class="fa fa-user"></i> Login</strong>
			<a href="#" class="btn btn-outline-secondary btn-sm pull-right">
				<i class="fa fa-user-plus"></i> <strong>Register</strong>
			</a>
		</div>
		<form method="POST" action="${path}/user/login" class="form-signin form-horizontal needs-validation" autocomplete="off" novalidate>
			<div class="card-body">
				<c:if test="${error ne null}">
					<div class="alert alert-danger alert-dismissible">
						<button type="button" class="close" data-dismiss="alert">&times;</button>
						<strong>${error}</strong>
					</div>
				</c:if>
				<c:if test="${message ne null}">
					<div class="alert alert-success alert-dismissible">
						<button type="button" class="close" data-dismiss="alert">&times;</button>
						<strong>${message}</strong>
					</div>
				</c:if>
				<div class="input-group mb-3">
					<div class="input-group-prepend">
						<span class="input-group-text">
							<i class="fa fa-user"></i>
						</span>
					</div>
					<input type="text" class="form-control" name="username" placeholder="Enter Username" required="true" autocomplete="off"/>
					<div class="valid-feedback">
				 		Looks good!
				 	</div>
				 	<div class="invalid-feedback">
          				Please Enter Username
        			</div>
				</div>
				<div class="input-group mb-3">
					<div class="input-group-prepend">
						<span class="input-group-text">
							<i class="fa fa-lock fa-lg"></i>
						</span>
					</div>
					<input type="password" class="form-control" name="password" placeholder="Enter Password" required="true" autocomplete="new-password"/>
					<div class="valid-feedback">
				   		Looks good!
					</div>
					<div class="invalid-feedback">
          				Please Enter Password
        			</div>
				</div>
				<div class="input-group mb-3" style="margin-bottom: 0px !important;">
					<div class="input-group-prepend">
						<span class="input-group-text">
							<input type="checkbox" name="remember-me" id="remember-me"/>
						</span>
					</div>
					<input type="text" class="form-control" value="Remember Me" disabled="disabled">
				</div>
			</div>
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
			<div class="card-footer" style="background: #fff;border-color: #f1f5fc;color: #777;">
				<label class="control-label pull-left"><a href="#">Forget Your Password?</a></label>
				<button type="submit" class="btn btn-sm btn-outline-secondary pull-right">
					<i class="fa fa-sign-in"></i> Login
				</button>
			</div>
		</form>
	</div>
</div>
<script type="text/javascript" src="${path}/webjars/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript" src="${path}/webjars/bootstrap/4.1.3/js/bootstrap.min.js"></script>
<script>
$(function() {
  	window.addEventListener('load', function() {
    	var forms = document.getElementsByClassName('needs-validation');
    	var validation = Array.prototype.filter.call(forms, function(form) {
      		form.addEventListener('submit', function(event) {
        		if (form.checkValidity() === false) {
          			event.preventDefault();
          			event.stopPropagation();
        		}
        		form.classList.add('was-validated');
      		}, false);
    	});
  	}, false);
  	
  	if (($(window).width() < 1024  ) && ($(window).height() < 768)) {
  		$(".container").removeClass("col-lg-3").addClass("col-sm-6");
  	}
});
</script>