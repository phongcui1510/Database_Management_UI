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
<title>User Creation</title>
</head>
<body>
<c:set var="context" value="${pageContext.request.contextPath}" />
<c:if test="${not empty student}">
	<c:set var="action" value="${context}/admin/user/edit" />
</c:if>
<c:if test="${empty student}">
	<c:set var="action" value="${context}/admin/user/create" />
</c:if>
<jsp:include page="navbar.jsp"></jsp:include>
	<div class="container">
		<div class="row">
			<div class="col-md-4 col-md-offset-4">
				<div class="panel panel-default">
					<div class="panel-heading">
						<h3 class="panel-title">${title}</h3>
					</div>
					<div class="panel-body">
						<form action="${action}" method="post">
							<fieldset>
								<c:if test="${not empty user}">
									<div class="form-group">
										<input disabled="disabled" class="form-control" placeholder="Username" name="username" type="text" autofocus value="${user.id}">
									</div>
									<div class="form-group">
										<input disabled="disabled" class="form-control" placeholder="Username" name="username" type="text" autofocus value="${user.username}">
									</div>
									<div class="form-group">
										<input class="form-control" placeholder="Username" name="username" type="hidden" autofocus value="${user.username}">
									</div>
								</c:if>
								<c:if test="${empty user}">
									<div class="form-group">
										<input required id="username" class="form-control" placeholder="Username" name="username" type="text" autofocus value="${user.username}">
									</div>
								</c:if>
								<div class="form-group">
									<input required id="password" class="form-control" placeholder="Password" name="password" type="password" value="${user.password}">
								</div>
<%-- 								<c:if test="${empty student}"> --%>
									<div class="form-group">
										<input required id="confirmPassword" class="form-control" placeholder="Confirm Password" name="password" type="password" value="${user.password}">
									</div>
<%-- 								</c:if> --%>
								<div class="form-group">
									<input required class="form-control" placeholder="First Name" name="firstName" type="text" value="${user.address}">
								</div>
								<div class="form-group">
									<input required class="form-control" placeholder="Last Name" name="lastName" type="text" value="${user.address}">
								</div>
								<div class="form-group">
									<input required class="form-control" placeholder="Address" name="address" type="text" value="${user.address}">
								</div>
								<div class="form-group">
									<input required class="form-control" placeholder="Date Of Birth" name="dob" type="date" value="${user.dob}">
								</div>
								<div class="form-group">
									<input class="form-control" placeholder="Email" name="email" type="email" value="${user.email}">
								</div>
								<label id="errormsg" style="color: red; display: none;"></label>
								<c:if test="${not empty user}">
									<input id="submitBtn" type="submit" class="btn btn-success btn-block" value="Edit">
								</c:if>
								<c:if test="${empty user}">
									<input id="submitBtn" type="submit" class="btn btn-success btn-block" value="Register">
								</c:if>
							</fieldset>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		$(document).ready(function(){
			$("#submitBtn").click(function(){
				/* var username = $("#username").val();
				if (username == '') {
					$("#errormsg").html("Username cannot be empty");
					$("#errormsg").show();
				} */
				var pass = $("#password").val();
				var confirmPass = $("#confirmPassword").val();
				if (pass != confirmPass) {
					$("#errormsg").html("Confirm password does not match.");
					$("#errormsg").show();
					return false;
				} else {
					$("#errormsg").hide();
				}
			});
		});
	</script>
</body>
</html>