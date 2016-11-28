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
            <th>Action</th>
        </tr>
        <c:forEach var="customer" items="${customers}">
            <tr>
                <td>${customer.id}</td>
                <td>${customer.name}</td>
                <td>${customer.address}</td>
                <td>${customer.phone}</td>
                <td>${customer.email}</td>
                <td>
                	<a id="editCustomerBtn" customerid="${customer.id}" href="#">Edit</a>
                	<a id="deleteCustomerBtn" customerid="${customer.id}" href="#">Delete</a>
                </td>
            </tr>
        </c:forEach>
    </table>
</data>