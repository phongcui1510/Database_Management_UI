<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="viewport"
	content="width=device-width,initial-scale=1,maximum-scale=1">
<link rel="stylesheet" type="text/css" href="<c:url value="/css/bootstrap.css"/>" />
<script type="text/javascript" src="<c:url value="/javascript/lib/jquery/jquery.js"/>"></script>
<script type="text/javascript" src="<c:url value="/javascript/lib/bootstrap/bootstrap.js"/>"></script>
<title>Admin Home Page</title>
</head>
<body>
<c:set var="context" value="${pageContext.request.contextPath}" />
	<%-- <nav class="navbar navbar-inverse">
	  <div class="container-fluid">
	    <div class="navbar-header">
	      <a class="navbar-brand" href="#">Feedback Management System</a>
	    </div>
	    <ul class="nav navbar-nav">
	      <li class="active"><a href="#">Home</a></li>
	      <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">Student<span class="caret"></span></a>
	        <ul class="dropdown-menu">
	          <li><a href="${context}/admin/user/list">All Student</a></li>
	          <li><a href="${context}/admin/user/create">Create Student</a></li>
	        </ul>
	      </li>
	      <li><a href="#">Faculty</a></li>
	    </ul>
	  </div>
	</nav> --%>
	<jsp:include page="navbar.jsp"></jsp:include>
	<div class="container">
		<table class="table table-condensed">
			<thead>
				<tr>
					<th>ID</th>
					<th>Username</th>
					<th>Date Of Birth</th>
					<th>Email</th>
					<th>Action</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${students}" var="student">
					<tr>
						<td>${student.id}</td>
						<td>${student.username}</td>
						<td>${student.dob}</td>
						<td>${student.email}</td>
						<td><a href="${context}/admin/user/edit?username=${student.username}">Edit</a></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</body>
</html>