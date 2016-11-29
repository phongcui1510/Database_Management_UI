<?xml version="1.0" encoding="UTF-8"?>
<%@page contentType="application/xml" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<data>
    <table>
        <tr>
            <th>Billing ID</th>
            <th>Payment Date</th>
            <th>Payment Method</th>
            <th>Customer ID</th>
            <th>Customer Name</th>
            <th>Vehicle ID</th>
            <th>Vehicle Model</th>
            <th>Service ID</th>
            <th>Service Name</th>
            <c:if test="${currentUser.role == 'ADMIN'}">
            	<th>Action</th>
            </c:if>
        </tr>
        <c:forEach var="billing" items="${billings}">
            <tr>
                <td>${billing.id}</td>
                <td>${billing.payment_date}</td>
                <td>${billing.payment_method}</td>
                <td>${billing.customer_id}</td>
                <td>${billing.customer_name}</td>
                <td>${billing.vehicle_id}</td>
                <td>${billing.vehicle_model}</td>
                <td>${billing.service_id}</td>
                <td>${billing.service_name}</td>
                <c:if test="${currentUser.role == 'ADMIN'}">
	                <td>
	                	<a id="editBillingBtn" billingid="${billing.id}" href="#">Edit</a>
	                	<a id="deleteBillingBtn" billingid="${billing.id}" href="#">Delete</a>
	                </td>
                </c:if>
            </tr>
        </c:forEach>
    </table>
</data>