<?xml version="1.0" encoding="UTF-8"?>
<%@page contentType="application/xml" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<data>
    <table>
        <tr>
            <th>Customer ID</th>
            <th>Name</th>
            <th>Address</th>
            <th>Phone</th>
            <th>Email</th>
            <th>Dealership</th>
            <th>Action</th>
        </tr>
        <c:forEach var="employee" items="${employees}">
            <tr>
                <td>${employee.id}</td>
                <td>${employee.name}</td>
                <td>${employee.address}</td>
                <td>${employee.phone}</td>
                <td>${employee.email}</td>
                <td>${employee.dealership}</td>
                <td>
                	<a id="editEmployeeBtn" employeeid="${employee.id}" href="#">Edit</a>
                	<a id="deleteEmployeeBtn" employeeid="${employee.id}" href="#">Delete</a>
                </td>
            </tr>
        </c:forEach>
    </table>
</data>