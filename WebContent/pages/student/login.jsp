<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Student Login</title>
</head>
<body>
<c:set var="context" value="${pageContext.request.contextPath}" />
	<div class="container">
		<div class="row">
			<div class="col-md-4 col-md-offset-4">
				<div class="panel panel-default">
					<div class="panel-heading">
						<h3 class="panel-title">Login as Student</h3>
					</div>
					<div class="panel-body">
						<form action="${context}/student/login" method="post">
							<fieldset>
								<div class="form-group">
									<input class="form-control" placeholder="Username" name="username" type="text" autofocus>
								</div>
								<div class="form-group">
									<input class="form-control" placeholder="Password" name="password" type="password">
								</div>
								<!-- Change this to a button or input when using this as a form -->
								<c:if test="${errorMsg=='show'}">
									<label style="color: red">Username or password wrong</label>
								</c:if>
								<input type="submit" class="btn btn-success btn-block" value="Login">
<!-- 								<p>
									New Member? <a href="signUp.html" class="">Sign up</a>
								</p> -->
							</fieldset>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>