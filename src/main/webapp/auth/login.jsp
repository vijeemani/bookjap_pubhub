<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta charset="UTF-8" />
<jsp:include page="../headerfile/tags.jsp" />

<title>Login</title>
<style>
body {
	background-color: #f4511e;
	text-indent: 50px;
	margin-top:50px;
	align:center;
	font: 400 15px Lato, sans-serif;
	line-height: 1.8;
}

h3 {
	font-size: 24px;
	text-transform: uppercase;
	color: #303030;
	font-weight: 600;
	margin-bottom: 30px;
}

form {
	font-size: 19px;
	line-height: 1.375em;
	color: #303030;
	font-weight: 400;
	align:center;
}

input {
	margin-bottom: 50px;
	font-size: 19px;
	align: justify
}

.centered-form {
	margin-top: 60px;
}

.centered-form .panel {
	background: rgba(255, 255, 255, 0.8);
	box-shadow: rgba(0, 0, 0, 0.3) 10px 10px 10px;
}
</style>
</head>
<body >
	<div class="container">
		<div class="row centered-form">
			<div
				class="col-xs-12 col-sm-8 col-md-4 col-sm-offset-2 col-md-offset-4">
				<div class="panel panel-default">
					<div class="panel-heading">
						<h3 class="panel-title" align="center">
							Login in <br> <small>For already Registered</small>
						</h3>
					</div>
					
					<div class="panel-body">
					

						<form action="../users/validate" method="POST">
							<div class="input-group">
								<span class="input-group-addon"><i
									class="glyphicon glyphicon-user"></i></span> <input id="email"
									type="text" class="form-control" name="email"
									placeholder="Email">
							</div>
							<div class="input-group">
								<span class="input-group-addon"><i
									class="glyphicon glyphicon-lock"></i></span> <input id="password"
									type="password" class="form-control" name="password"
									placeholder="Password">
							</div>
							<br>
							<div class="input-group"><button type="submit" class="btn btn-primary">submit</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>