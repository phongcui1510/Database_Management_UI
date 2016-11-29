<?xml version="1.0" encoding="UTF-8"?>
<%@page contentType="application/xml" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<data>
    <table>
        <tr>
            <th>Vehicle ID</th>
            <th>Model</th>
            <th>Year</th>
            <th>Color</th>
            <th>Price</th>
            <c:if test="${currentUser.role == 'ADMIN'}">
            	<th>Action</th>
            </c:if>
        </tr>
        <c:forEach var="vehicle" items="${vehicles}">
            <tr>
                <td>${vehicle.id}</td>
                <td>${vehicle.model}</td>
                <td>${vehicle.year}</td>
                <td>${vehicle.color}</td>
                <td>${vehicle.price}</td>
                <c:if test="${currentUser.role == 'ADMIN'}">
	                <td>
	                	<a id="editVehicleBtn" vehicleid="${vehicle.id}" href="#">Edit</a>
	                	<a id="deleteVehicleBtn" vehicleid="${vehicle.id}" href="#">Delete</a>
	                </td>
                </c:if>
            </tr>
        </c:forEach>
    </table>
</data>