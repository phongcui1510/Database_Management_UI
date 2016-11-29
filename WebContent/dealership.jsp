<?xml version="1.0" encoding="UTF-8"?>
<%@page contentType="application/xml" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<data>
    <table>
        <tr>
            <th>Dealership ID</th>
            <th>Name</th>
        </tr>
        <c:forEach var="dealership" items="${dealerships}">
            <tr>
                <td>${dealership.id}</td>
                <td>${dealership.name}</td>
                <td>
                	<a id="editDealershipBtn" dealershipid="${dealership.id}" href="#">Edit</a>
                	<a id="deleteDealershipBtn" dealershipid="${dealership.id}" href="#">Delete</a>
                </td>
            </tr>
        </c:forEach>
    </table>
</data>