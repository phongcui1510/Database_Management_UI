<?xml version="1.0" encoding="UTF-8"?>
<%@page contentType="application/xml" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<data>
    <table>
        <tr>
            <th>Inventory ID</th>
            <th>Name</th>
            <th>Address</th>
            <c:if test="${currentUser.role == 'ADMIN'}">
            	<th>Action</th>
            </c:if>
        </tr>
        <c:forEach var="inventory" items="${inventories}">
            <tr>
                <td>${inventory.id}</td>
                <td>${inventory.name}</td>
                <td>${inventory.address}</td>
                <c:if test="${currentUser.role == 'ADMIN'}">
	                <td>
	                	<a id="editInventoryBtn" inventoryid="${inventory.id}" href="#">Edit</a>
	                	<a id="deleteInventoryBtn" inventoryid="${inventory.id}" href="#">Delete</a>
	                </td>
                </c:if>
            </tr>
        </c:forEach>
    </table>
</data>