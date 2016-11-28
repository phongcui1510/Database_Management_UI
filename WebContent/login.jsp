<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="viewport"
	content="width=device-width,initial-scale=1,maximum-scale=1">
<title>Login Page</title>
<style type="text/css">
	.center {
		    margin: auto;
		    width: 250px;
		    padding: 10px;
		}
</style>
</head>
<body>
	<div class="center">
		<form action="login" method="post" style="width: 250px; text-align: center">
			<table>
				<tr>
					<td><label>Username</label></td>
					<td><input placeholder="Username" name="username" type="text" autofocus required/></td>
				</tr>
				<tr>
					<td><label>Password</label></td>
					<td><input placeholder="Password" name="password" type="password" required/></td>
				</tr>
			</table>
			<input type="submit" class="btn btn-success btn-block" value="Login" style="background-color: #ff9999; width: 100px; height: 30px">
		</form>
	</div>
</body>
</html>