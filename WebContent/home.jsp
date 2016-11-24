<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="viewport"
	content="width=device-width,initial-scale=1,maximum-scale=1">
<link rel="stylesheet" type="text/css"
	href="<c:url value="/css/bootstrap.css"/>" />
<script type="text/javascript"
	src="<c:url value="/javascript/lib/jquery/jquery.js"/>"></script>
<script type="text/javascript"
	src="<c:url value="/javascript/lib/bootstrap/bootstrap.js"/>"></script>
<title>Home</title>
<style type="text/css">
	table {
	  border-collapse:collapse;
	  font:normal normal 11px Verdana,Arial,Sans-Serif;
	  color:#6F0A0A;
	}
	
	table tr {
	  background:#FFE5E5;
	}
	
	table th,
	table td {
	  vertical-align:top;
	  padding:5px 10px;
	  border:1px solid #fff;
	}
	
	table tr:nth-child(even) {
	  background:#f5f5f5;
	}
	
	table th {
	  background:#A00F0F;
	  color:#fff;
	  font-weight:bold;
	}
</style>
</head>
<body>
	<%-- <div class="container">
		<div class="row">
			<div class="col-md-4 col-md-offset-4">
				<div class="panel panel-default">
					<div class="panel-heading">
						<h3 class="panel-title">Vehicle Selling Management</h3>
					</div>
					<div class="panel-body">
						<form action="${pageContext.request.contextPath}/execute"
							method="post">
							<fieldset>
								<div class="form-group">
									<textarea required class="form-control"
										placeholder="Place your query here" name="sql" type="text"
										value="${sql}"></textarea>
								</div>
								<input id="submitBtn" type="submit"
									class="btn btn-success btn-block" value="Execute">
							</fieldset>
						</form>
					</div>
				</div>
			</div>
			<table>
				<thead>
					<tr>
						<c:forEach items="${rs.header}" var="h">
							<td>${h }</td>
						</c:forEach>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${rs.data }" var="row">
						<tr>
							<c:forEach items="${rs.header}" var="h">
								<td>${row[h]}</td>
							</c:forEach>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div> --%>
	<div style="margin: 20px">
		<form action="${pageContext.request.contextPath}/execute" method="post">
			<div>
				<textarea required placeholder="Place your query here" name="sql" type="text" value="${sql}" style="width: 500px; height: 100px"></textarea>
			</div>
			<br/>
			<input id="submitBtn" type="submit"  value="Execute" style="background-color: #ff9999">
		</form>
	</div>
	<c:if test="${not empty msg }">
		<div style="margin: 20px">
			${msg }
		</div>
	</c:if>
	<div style="margin: 20px">
		<table>
			<tr>
				<c:forEach items="${rs.header}" var="h">
					<th>${h }</th>
				</c:forEach>
			</tr>
			<c:forEach items="${rs.data }" var="row">
				<tr>
					<c:forEach items="${rs.header}" var="column">
						<td>${row[column]}</td>
					</c:forEach>
				</tr>
			</c:forEach>
		</table>
	</div>
</body>
</html>