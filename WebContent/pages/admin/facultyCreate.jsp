<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="viewport"
	content="width=device-width,initial-scale=1,maximum-scale=1">
<link rel="stylesheet" type="text/css" href="<c:url value="/css/bootstrap.css"/>" />
<script type="text/javascript" src="<c:url value="/javascript/lib/jquery/jquery.js"/>"></script>
<script type="text/javascript" src="<c:url value="/javascript/lib/bootstrap/bootstrap.js"/>"></script>
<title>Faculty Creation</title>
</head>
<body>
<jsp:include page="navbar.jsp"></jsp:include>
<c:set var="context" value="${pageContext.request.contextPath}" />
<div class="container">
		<div class="row">
			<div class="col-md-4 col-md-offset-4">
				<div class="panel panel-default">
					<div class="panel-heading">
						<h3 class="panel-title">Faculty Registration</h3>
					</div>
					<div class="panel-body">
						<form action="${context}/admin/faculty/create" method="post">
							<fieldset>
								<div class="form-group">
									<input required id="username" class="form-control" placeholder="Username" name="username" type="text" autofocus value="${faculty.username}">
								</div>
								<div class="form-group">
									<input required id="password" class="form-control" placeholder="Password" name="password" type="password" value="${faculty.password}">
								</div>
								<div class="form-group">
									<input required id="confirmPassword" class="form-control" placeholder="Confirm Password" name="password" type="password" value="${faculty.password}">
								</div>
								<div class="form-group">
									<textarea class="form-control" placeholder="Decription" name="decription" value="${faculty.decription}"/>
								</div>
								<label id="errormsg" style="color: red; display: none;"></label>
								<input id="submitBtn" type="submit" class="btn btn-success btn-block" value="Register">
							</fieldset>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>