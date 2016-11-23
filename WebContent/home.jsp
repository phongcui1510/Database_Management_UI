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
</head>
<body>
	<div class="container">
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
									<input required class="form-control"
										placeholder="Place your query here" name="sql" type="text"
										value="${sql}">
								</div>
								<input id="submitBtn" type="submit"
									class="btn btn-success btn-block" value="Execute">
							</fieldset>
						</form>
					</div>
				</div>
				<c:if test="${rs.showMsg && (not empty rs.errorMsg || (empty rs.service && empty rs.customer && empty rs.billing && empty rs.vehicle))}">
						<p>No records found</p>
					</c:if>
					<c:if test="${not empty rs.selectQuery && !rs.selectQuery}">
						<p>Execute sql done.</p>
					</c:if>
			</div>
		</div>
		<c:if test="${not empty rs.customer}">
			<table class="table table-condensed">
				<thead>
					<tr>
						<th>Customer ID</th>
						<th>Customer Name</th>
						<th>Address</th>
						<th>Email</th>
						<th>Phone</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${rs.customer}" var="customer">
						<tr>
							<td>${customer.customer_id}</td>
							<td>${customer.name}</td>
							<td>${customer.address}</td>
							<td>${customer.email}</td>
							<td>${customer.phone}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</c:if>
		<br/>
		<c:if test="${not empty rs.vehicle}">
			<table class="table table-condensed">
				<thead>
					<tr>
						<th>Vehicle ID</th>
						<th>Model</th>
						<th>Price</th>
						<th>Year</th>
						<th>Color</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${rs.vehicle}" var="vehicle">
						<tr>
							<td>${vehicle.vehicle_id}</td>
							<td>${vehicle.model}</td>
							<td>${vehicle.price}</td>
							<td>${vehicle.year}</td>
							<td>${vehicle.color}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</c:if>
		<br/>
		<c:if test="${not empty rs.billing}">
			<table class="table table-condensed">
				<thead>
					<tr>
						<th>Billing ID</th>
						<th>Payment Date</th>
						<th>Payment Method</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${rs.billing}" var="billing">
						<tr>
							<td>${billing.billing_id}</td>
							<td>${billing.payment_date}</td>
							<td>${billing.payment_method}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</c:if>
		<br/>
		<c:if test="${not empty rs.service}">
			<table class="table table-condensed">
				<thead>
					<tr>
						<th>Service ID</th>
						<th>Problem Type</th>
						<th>Estimate Time</th>
						<th>Estimate Price</th>
						<th>Completion Date</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${rs.service}" var="service">
						<tr>
							<td>${service.service_id}</td>
							<td>${service.problem_type}</td>
							<td>${service.estimate_time}</td>
							<td>${service.estimate_price}</td>
							<td>${service.completion_date}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</c:if>
	</div>
</body>
</html>