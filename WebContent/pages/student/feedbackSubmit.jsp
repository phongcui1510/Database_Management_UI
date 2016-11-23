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
<title>Submit Feedback</title>
</head>
<body>
<c:set var="context" value="${pageContext.request.contextPath}" />
<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="#">Feedback Management System</a>
    </div>
    <ul class="nav navbar-nav">
      <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">Feedback<span class="caret"></span></a>
        <ul class="dropdown-menu">
          <li><a href="${context}/admin/user/list">All Feedback</a></li>
          <li><a href="${context}/student/feedback/create">Send Feedback</a></li>
        </ul>
      </li>
      <li><a href="#">Contact Us</a></li>
    </ul>
    <ul class="nav navbar-nav" style="float: right">
    	<li ><a href="${context}/logout">Logout</a></li>
    </ul>
    <p style="float: right; color: #9d9d9d; padding: 10px 15px 10px 15px">Login as ${currentUser.firstName} ${currentUser.lastName}</p>
  </div>
</nav>
<div class="container">
		<div class="row">
			<div class="col-md-4 col-md-offset-4">
				<div class="panel panel-default">
					<div class="panel-heading">
						<h3 class="panel-title">Submit Feedback</h3>
					</div>
					<div class="panel-body">
						<form action="${action}" method="post">
							<fieldset>
								<div class="form-group">
									<input required id="title" class="form-control" placeholder="Title" name="title" type="text" autofocus>
								</div>
								<div class="form-group">
									<textarea style="resize: vertical;" required id="description" class="form-control" placeholder="Description" name="description" type="text"></textarea>
								</div>
								<c:if test="${not empty msg}">
									<label id="msg" style="color: green;">${msg}</label>
								</c:if>
								<input id="submitBtn" type="submit" class="btn btn-success btn-block" value="Submit">
							</fieldset>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>