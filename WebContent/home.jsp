<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
        <meta name="viewport"
              content="width=device-width,initial-scale=1,maximum-scale=1">
        <script type="text/javascript" src="<c:url value="/javascript/lib/jquery/jquery.js"/>"></script>
        <script type="text/javascript" src="<c:url value="/javascript/lib/jquery-ui/jquery-ui.js"/>"></script>
        <script type="text/javascript" src="<c:url value="/javascript/lib/jquery-ui/jquery-ui.js"/>"></script>
        <link rel="stylesheet" href="<c:url value="/javascript/lib/jquery-ui/jquery-ui.css"/>">

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

            #flip-tabs{  
                width:300px;  
                margin:20px auto; position:relative;  
            }  
            #flip-navigation{  
                margin:0 0 10px; padding:0;   
                list-style:none;  
            }  
            #flip-navigation li{   
                display:inline;   
            }  
            #flip-navigation li a{  
                text-decoration:none; padding:10px;   
                margin-right:0px;  
                background:#f9f9f9;  
                color:#333; outline:none;  
                font-family:Arial; font-size:12px; text-transform:uppercase;  
            }  
            #flip-navigation li a:hover{  
                background:#999;   
                color:#f0f0f0;  
            }  
            #flip-navigation li.selected a{  
                background:#999;  
                color:#f0f0f0;  
            }  
            #flip-container{    
                width:300px;  
                font-family:Arial; font-size:13px;  
            }  
            #flip-container div{   
                background:#fff;  
            }  
        </style>

    </head>
    <body>
		 <c:if test="${not empty currentUser}">
            <p style="margin: 0px">Login as ${currentUser.username} <a href="${pageContext.request.contextPath}/logout">Logout</a></p>
        </c:if>
        <c:if test="${empty currentUser}">
            <a href="${pageContext.request.contextPath}/login">Login</a>
        </c:if>
        <c:set var="context" value="${pageContext.request.contextPath}" />
        <div id="tabs" style="margin-top: 20px">
            <ul>
                <li><a href="#customer-tab">CUSTOMER</a></li>
                <li><a href="#employee-tab">EMPLOYEE</a></li>
                <li><a href="#vehicle-tab">VEHICLE</a></li>
                <li><a href="#billing-tab">BILLING</a></li>
                <li><a href="#dealership-tab">DEALERSHIP</a></li>
                <li><a href="#inventory-tab">INVENTORY</a></li>
            </ul>
            <div id="customer-tab">
                <div class="sub-tabs">
                    <ul>
                        <li><a href="#customer-tab-sub-tabs-1">SEARCH</a></li>
                        <c:if test="${currentUser.role == 'ADMIN'}">
                        	<li><a href="#customer-tab-sub-tabs-2">INSERT</a></li>
                        </c:if>
                    </ul>
                    <div id="customer-tab-sub-tabs-1">
                        <form id="searchCustomerForm">
                            <table>
                                <tr>
                                    <td>Customer ID</td>
                                    <td><input type="number" name="id"></td>
                                </tr>
                                <tr>
                                    <td>Customer Name</td>
                                    <td><input type="text" name="name"></td>
                                </tr>
                                <tr>
                                    <td>Address</td>
                                    <td><input type="text" name="address"></td>
                                </tr>
                                <tr>
                                    <td>Phone Number</td>
                                    <td><input type="text" name="phone"></td>
                                </tr>
                                <tr>
                                    <td>Email</td>
                                    <td><input type="text" name="email"></td>
                                </tr>
                            </table>
                        </form>
                        <input id="clearCustomerBtn" type="button" value="Clear">
                        <input id="searchCustomerBtn" type="button" value="Search">
                        <input id="submitUpdateCustomerBtn" type="button" value="Update" style="display: none;">
                        <div id="updateDeleteCustomerResult"></div>
                        <div id="searchCustomerResult"></div>
                    </div>
                    <c:if test="${currentUser.role == 'ADMIN'}">
	                    <div id="customer-tab-sub-tabs-2">
	                        <form id="insertCustomerForm">
	                            <table>
	                                <tr>
	                                    <td>Customer Name</td>
	                                    <td><input type="text" name="name"></td>
	                                </tr>
	                                <tr>
	                                    <td>Address</td>
	                                    <td><input type="text" name="address"></td>
	                                </tr>
	                                <tr>
	                                    <td>Phone Number</td>
	                                    <td><input type="text" name="phone"></td>
	                                </tr>
	                                <tr>
	                                    <td>Email</td>
	                                    <td><input type="text" name="email"></td>
	                                </tr>
	                            </table>
	                        </form>
	                        <input id="insertCustomerBtn" type="button" value="Insert">
	                        <div id="insertCustomerResult"></div>
	                    </div>
                    </c:if>
                </div>
            </div>
            <div id="employee-tab">
            	<div class="sub-tabs">
                    <ul>
                        <li><a href="#employee-tab-sub-tabs-1">SEARCH</a></li>
                        <c:if test="${currentUser.role == 'ADMIN'}">
                        	<li><a href="#employee-tab-sub-tabs-2">INSERT</a></li>
                        </c:if>
                    </ul>
                    <div id="employee-tab-sub-tabs-1">
                        <form id="searchEmployeeForm">
                            <table>
			                    <tr>
			                        <td>Employee ID</td>
			                        <td><input type="number" name="id"></td>
			                    </tr>
			                    <tr>
			                        <td>Employee Name</td>
			                        <td><input type="text" name="name"></td>
			                    </tr>
			                    <tr>
			                        <td>Address</td>
			                        <td><input type="text" name="address"></td>
			                    </tr>
			                    <tr>
			                        <td>Phone Number</td>
			                        <td><input type="text" name="phone"></td>
			                    </tr>
			                    <tr>
			                        <td>Email</td>
			                        <td><input type="text" name="email"></td>
			                    </tr>
			                    <tr>
			                        <td>Dealership</td>
			                        <td>
			                        	<select name="dealership">
			                        		<option value="">-None-</option>
			                        		<c:forEach items="${dealerships}" var="dealership">
			                        			<option value="${dealership.id}">${dealership.name}</option>
			                        		</c:forEach>
			                        	</select>
			                        </td>
			                    </tr>
			                </table>
                        </form>
                         <input id="clearEmployeeBtn" type="button" value="Clear">
                        <input id="searchEmployeeBtn" type="button" value="Search">
                        <input id="submitUpdateEmployeeBtn" type="button" value="Update" style="display: none;">
                         <div id="updateDeleteEmployeeResult"></div>
                        <div id="searchEmployeeResult"></div>
                    </div>
                    <c:if test="${currentUser.role == 'ADMIN'}">
	                    <div id="employee-tab-sub-tabs-2">
	                        <form id="insertEmployeeForm">
	                            <table>
				                    <tr>
				                        <td>Employee Name</td>
				                        <td><input type="text" name="name"></td>
				                    </tr>
				                    <tr>
				                        <td>Address</td>
				                        <td><input type="text" name="address"></td>
				                    </tr>
				                    <tr>
				                        <td>Phone Number</td>
				                        <td><input type="text" name="phone"></td>
				                    </tr>
				                    <tr>
				                        <td>Email</td>
				                        <td><input type="text" name="email"></td>
				                    </tr>
				                    <tr>
				                        <td>Dealership</td>
				                        <td>
				                        	<select name="dealership">
				                        		<c:forEach items="${dealerships}" var="dealership">
				                        			<option value="${dealership.id}">${dealership.name}</option>
				                        		</c:forEach>
				                        	</select>
				                        </td>
				                    </tr>
				                </table>
	                        </form>
	                        <input id="insertEmployeeBtn" type="button" value="Insert">
	                        <div id="insertEmployeeResult"></div>
	                    </div>
                    </c:if>
                </div>
            </div>
            <div id="vehicle-tab">
            	<div class="sub-tabs">
                    <ul>
                        <li><a href="#vehicle-tab-sub-tabs-1">SEARCH</a></li>
                        <c:if test="${currentUser.role == 'ADMIN'}">
                        	<li><a href="#vehicle-tab-sub-tabs-2">INSERT</a></li>
                        </c:if>
                    </ul>
                    <div id="vehicle-tab-sub-tabs-1">
                        <form id="searchVehicleForm">
                            <table>
			                    <tr>
			                        <td>Vehicle ID</td>
			                        <td><input type="number" name="id"></td>
			                    </tr>
			                    <tr>
			                        <td>Model</td>
			                        <td><input type="text" name="model"></td>
			                    </tr>
			                    <tr>
			                        <td>Price</td>
			                        <td><input type="number" name="price"></td>
			                    </tr>
			                    <tr>
			                        <td>Year</td>
			                        <td><input type="number" name="year"></td>
			                    </tr>
			                    <tr>
			                        <td>Color</td>
			                        <td><input type="text" name="color"></td>
			                    </tr>
			                </table>
                        </form>
                        <input id="clearVehicleBtn" type="button" value="Clear">
                        <input id="searchVehicleBtn" type="button" value="Search">
                        <input id="submitUpdateVehicleBtn" type="button" value="Update" style="display: none;">
                        <div id="updateDeleteVehicleResult"></div>
                        <div id="searchVehicleResult"></div>
                    </div>
                    <c:if test="${currentUser.role == 'ADMIN'}">
	                    <div id="vehicle-tab-sub-tabs-2">
	                        <form id="insertVehicleForm">
	                            <table>
				                    <tr>
				                        <td>Model</td>
				                        <td><input type="text" name="model"></td>
				                    </tr>
				                    <tr>
				                        <td>Price</td>
				                        <td><input type="number" name="price"></td>
				                    </tr>
				                    <tr>
				                        <td>Year</td>
				                        <td><input type="number" name="year"></td>
				                    </tr>
				                    <tr>
				                        <td>Color</td>
				                        <td><input type="text" name="color"></td>
				                    </tr>
				                </table>
	                        </form>
	                        <input id="insertVehicleBtn" type="button" value="Insert">
	                        <div id="insertVehicleResult"></div>
	                    </div>
                    </c:if>
                </div>
            </div>
            <div id="billing-tab">
                <div class="sub-tabs">
                    <ul>
                        <li><a href="#billing-tab-sub-tabs-1">SEARCH</a></li>
                        <c:if test="${currentUser.role == 'ADMIN'}">
                        	<li><a href="#billing-tab-sub-tabs-2">INSERT</a></li>
                        </c:if>
                    </ul>
                    <div id="billing-tab-sub-tabs-1">
                        <form id="searchBillingForm">
                            <table>
			                    <tr>
			                        <td>Billing ID</td>
			                        <td><input type="number" name="id"></td>
			                    </tr>
			                    <tr>
			                        <td>Payment Method</td>
			                        <td><input type="text" name="payment_method"></td>
			                    </tr>
			                    <tr>
			                        <td>Payment Date</td>
			                        <td><input type="date" name="payment_date"></td>
			                    </tr>
			                    <tr>
			                        <td>Customer</td>
			                        <td>
			                        	<select name="customer_id">
			                        		<option value="">--None--</option>
			                        		<c:forEach items="${customers}" var="customer">
			                        			<option value="${customer.id}">${customer.name}</option>
			                        		</c:forEach>
			                        	</select>
			                        </td>
			                    </tr>
			                    <tr>
			                        <td>Vehicle</td>
			                        <td>
			                        	<select name="vehicle_id">
			                        		<option value="">--None--</option>
			                        		<c:forEach items="${vehicles}" var="vehicle">
			                        			<option value="${vehicle.id}">${vehicle.model}</option>
			                        		</c:forEach>
			                        	</select>
			                        </td>
			                    </tr>
			                    <tr>
			                        <td>Service</td>
			                        <td>
			                        	<select name="service_id">
			                        		<option value="">--None--</option>
			                        		<c:forEach items="${services}" var="service">
			                        			<option value="${service.id}">${service.name}</option>
			                        		</c:forEach>
			                        	</select>
			                        </td>
			                    </tr>
			                </table>
                        </form>
                        <input id="clearBillingBtn" type="button" value="Clear">
                        <input id="searchBillingBtn" type="button" value="Search">
                        <input id="submitUpdateBillingBtn" type="button" value="Update" style="display: none;">
                        <div id="updateDeleteBillingResult"></div>
                        <div id="searchBillingResult"></div>
                    </div>
                    <c:if test="${currentUser.role == 'ADMIN'}">
	                    <div id="billing-tab-sub-tabs-2">
	                        <form id="insertBillingForm">
	                            <table>
				                    <tr>
				                        <td>Payment Method</td>
				                        <td><input type="text" name="payment_method"></td>
				                    </tr>
				                    <tr>
				                        <td>Payment Date</td>
				                        <td><input type="date" name="payment_date"></td>
				                    </tr>
				                    <tr>
				                        <td>Customer</td>
				                        <td>
				                        	<select name="customer_id">
				                        		<c:forEach items="${customers}" var="customer">
				                        			<option value="${customer.id}">${customer.name}</option>
				                        		</c:forEach>
				                        	</select>
				                        </td>
				                    </tr>
				                    <tr>
				                        <td>Vehicle</td>
				                        <td>
				                        	<select name="vehicle_id">
				                        		<c:forEach items="${vehicles}" var="vehicle">
				                        			<option value="${vehicle.id}">${vehicle.model}</option>
				                        		</c:forEach>
				                        	</select>
				                        </td>
				                    </tr>
				                    <tr>
				                        <td>Service</td>
				                        <td>
				                        	<select name="service_id">
				                        		<c:forEach items="${services}" var="service">
				                        			<option value="${service.id}">${service.name}</option>
				                        		</c:forEach>
				                        	</select>
				                        </td>
				                    </tr>
				                </table>
	                        </form>
	                        <input id="insertBillingBtn" type="button" value="Insert">
	                        <div id="insertBillingResult"></div>
	                    </div>
                    </c:if>
                </div>
            </div>
            <div id="dealership-tab">
                <div class="sub-tabs">
                    <ul>
                        <li><a href="#dealership-tab-sub-tabs-1">SEARCH</a></li>
                        <c:if test="${currentUser.role == 'ADMIN'}">
                        	<li><a href="#dealership-tab-sub-tabs-2">INSERT</a></li>
                        </c:if>
                    </ul>
                    <div id="dealership-tab-sub-tabs-1">
                        <form id="searchDealershipForm">
                            <table>
			                    <tr>
			                        <td>Dealership ID</td>
			                        <td><input type="text" name="id"></td>
			                    </tr>
			                    <tr>
			                        <td>Name</td>
			                        <td><input type="text" name="name"></td>
			                    </tr>
			                </table>
                        </form>
                        <input id="clearDealershipBtn" type="button" value="Clear">
                        <input id="searchDealershipBtn" type="button" value="Search">
                        <input id="submitUpdateDealershipBtn" type="button" value="Update" style="display: none;">
                        <div id="updateDeleteDealershipResult"></div>
                        <div id="searchDealershipResult"></div>
                    </div>
                    <c:if test="${currentUser.role == 'ADMIN'}">
	                    <div id="dealership-tab-sub-tabs-2">
	                        <form id="insertDealershipForm">
	                            <table>
				                    <tr>
				                        <td>Name</td>
				                        <td><input type="text" name="name"></td>
				                    </tr>
				                </table>
	                        </form>
	                        <input id="insertDealershipBtn" type="button" value="Insert">
	                        <div id="insertDealershipResult"></div>
	                    </div>
                    </c:if>
                </div>
            </div>
            <div id="inventory-tab">
                <div class="sub-tabs">
                    <ul>
                        <li><a href="#inventory-tab-sub-tabs-1">SEARCH</a></li>
                        <c:if test="${currentUser.role == 'ADMIN'}">
                        	<li><a href="#inventory-tab-sub-tabs-2">INSERT</a></li>
                        </c:if>
                    </ul>
                    <div id="inventory-tab-sub-tabs-1">
                        <form id="searchInventoryForm">
                            <table>
			                    <tr>
			                        <td>Inventory ID</td>
			                        <td><input type="text" name="id"></td>
			                    </tr>
			                    <tr>
			                        <td>Inventory Name</td>
			                        <td><input type="text" name="name"></td>
			                    </tr>
			                    <tr>
			                        <td>Address</td>
			                        <td><input type="text" name="address"></td>
			                    </tr>
			                </table>
                        </form>
                         <input id="clearInventoryBtn" type="button" value="Clear">
                        <input id="searchInventoryBtn" type="button" value="Search">
                        <input id="submitUpdateInventoryBtn" type="button" value="Update" style="display: none;">
                         <div id="updateDeleteInventoryResult"></div>
                        <div id="searchInventoryResult"></div>
                    </div>
                    <c:if test="${currentUser.role == 'ADMIN'}">
	                    <div id="inventory-tab-sub-tabs-2">
	                        <form id="insertInventoryForm">
	                            <table>
				                    <tr>
				                        <td>Inventory Name</td>
				                        <td><input type="text" name="name"></td>
				                    </tr>
				                    <tr>
				                        <td>Address</td>
				                        <td><input type="text" name="address"></td>
				                    </tr>
				                </table>
	                        </form>
	                        <input id="insertInventoryBtn" type="button" value="Insert">
	                        <div id="insertInventoryResult"></div>
	                    </div>
                    </c:if>
                </div>
            </div>
        </div>
        <script>
            $(function () {
                $("#tabs").tabs();
                $(".sub-tabs").tabs();
                $("#searchCustomerBtn").click(function(){
                   $.ajax({
                       url: "customer/search",
                       method: "get",
                       //contentType: "application/json",
                       data: $("#searchCustomerForm").serializeArray(),
                       success: function (responseXml) {
                           $("#searchCustomerResult").html($(responseXml).find("data").html());
                       }
                   });
                });
                $('body').on('click','#editCustomerBtn',function(){
                	var element = this;
                	
                	$.ajax({
                        url: "customer/search/json",
                        method: "get",
                        //contentType: "application/json",
                        data: "id="+$(element).attr("customerid"),
                        success: function (response) {
                        	var arrayLength = response.length;
                        	for (var i = 0; i < arrayLength; i++) {
                        		$("#searchCustomerForm input[name='id']").val(response[i].id);
                        		$("#searchCustomerForm input[name='id']").prop('disabled', true);
                        		$("#searchCustomerForm").append("<input type='hidden' value='"+ response[i].id + "' name='id'></input>");
                        		$("#searchCustomerForm input[name='name']").val(response[i].name);
                        		$("#searchCustomerForm input[name='address']").val(response[i].address);
                        		$("#searchCustomerForm input[name='phone']").val(response[i].phone);
                        		$("#searchCustomerForm input[name='email']").val(response[i].email);
                        		$("#submitUpdateCustomerBtn").css("display","inline");
                        	}
                        }
                    });
			    });
                $('body').on('click','#deleteCustomerBtn',function(){
                	var element = this;
                	if (confirm("Are you sure want to delete this record?") == true) {
                		$.ajax({
                            url: "customer/delete",
                            method: "post",
                            data: "id="+$(element).attr("customerid"),
                            success: function (response) {
                            	if (response == "success") {
	                            	$("#updateDeleteCustomerResult").html("Delete customer successfully");
	                            	$("#clearCustomerBtn").click();
	                            	$("#searchCustomerBtn").click();
	                            	
                            	} else {
                            		$("#updateDeleteCustomerResult").html("Delete customer fail");
                            	}
                            }
                        });
                	}
			    });
                $("#insertCustomerBtn").click(function(){
                	var flag = false;
                	$("#insertCustomerForm input").each(function(index, value){
                		if ($(value).val()==''){
                			flag = true;
                		}
                	});
                	if (flag == true) {
                		alert("Please fill the form");
                	} else {
                		$.ajax({
                            url: "customer/insert",
                            method: "post",
                            //contentType: "application/json",
                            data: $("#insertCustomerForm").serializeArray(),
                            success: function (response) {
                            	if (response == "success") {
    	                            $("#insertCustomerResult").html("Insert customer successfully");
                            	} else {
                            		$("#insertCustomerResult").html("Insert customer fail");
                            	}
                            }
                        });
                	}
                	
                });
                $("#submitUpdateCustomerBtn").click(function(){
                	$.ajax({
                        url: "customer/update",
                        method: "post",
                        //contentType: "application/json",
                        data: $("#searchCustomerForm").serializeArray(),
                        success: function (response) {
                        	if (response == "success") {
	                            $("#updateDeleteCustomerResult").html("Update customer successfully");
                        	} else {
                        		$("#updateDeleteCustomerResult").html("Update customer fail");
                        	}
                        }
                    });
                });
                $("#clearCustomerBtn").click(function(){
                	$("#searchCustomerForm").remove("input[type='hidden']");
                	$("#searchCustomerForm input[name='id']").prop('disabled', false);
                	$("#searchCustomerForm input[name='id']").val("");
                	$("#searchCustomerForm input[name='name']").val("");
                	$("#searchCustomerForm input[name='address']").val("");
                	$("#searchCustomerForm input[name='phone']").val("");
                	$("#searchCustomerForm input[name='email']").val("");
                	$("#submitUpdateCustomerBtn").css("display","none");
                });
                
                
            	//  Employee
                $("#searchEmployeeBtn").click(function(){
                    $.ajax({
                        url: "employee/search",
                        method: "get",
                        //contentType: "application/json",
                        data: $("#searchEmployeeForm").serializeArray(),
                        success: function (responseXml) {
                            $("#searchEmployeeResult").html($(responseXml).find("data").html());
                        }
                    });
                 });
                $('body').on('click','#editEmployeeBtn',function(){
                	var element = this;
                	
                	$.ajax({
                        url: "employee/search/json",
                        method: "get",
                        //contentType: "application/json",
                        data: "id="+$(element).attr("employeeid"),
                        success: function (response) {
                        	var arrayLength = response.length;
                        	for (var i = 0; i < arrayLength; i++) {
                        		$("#searchEmployeeForm input[name='id']").val(response[i].id);
                        		$("#searchEmployeeForm input[name='id']").prop('disabled', true);
                        		$("#searchEmployeeForm").append("<input type='hidden' value='"+ response[i].id + "' name='id'></input>");
                        		$("#searchEmployeeForm input[name='name']").val(response[i].name);
                        		$("#searchEmployeeForm input[name='address']").val(response[i].address);
                        		$("#searchEmployeeForm input[name='phone']").val(response[i].phone);
                        		$("#searchEmployeeForm input[name='email']").val(response[i].email);
                        		$("#searchEmployeeForm select[name='dealership']").val(response[i].dealership);
                        		$("#submitUpdateEmployeeBtn").css("display","inline");
                        	}
                        }
                    });
    		    });
                $('body').on('click','#deleteEmployeeBtn',function(){
                	var element = this;
                	if (confirm("Are you sure want to delete this record?") == true) {
                		$.ajax({
                            url: "employee/delete",
                            method: "post",
                            data: "id="+$(element).attr("employeeid"),
                            success: function (response) {
                            	if (response == "success") {
                                	$("#updateDeleteEmployeeResult").html("Delete employee successfully");
                                	$("#clearEmployeeBtn").click();
                                	$("#searchEmployeeBtn").click();
                                	
                            	} else {
                            		$("#updateDeleteCustomerResult").html("Delete employee fail");
                            	}
                            }
                        });
                	}
    		    });
                $("#submitUpdateEmployeeBtn").click(function(){
                	$.ajax({
                        url: "employee/update",
                        method: "post",
                        data: $("#searchEmployeeForm").serializeArray(),
                        success: function (response) {
                        	if (response == "success") {
                                $("#updateDeleteEmployeeResult").html("Update employee successfully");
                        	} else {
                        		$("#updateDeleteEmployeeResult").html("Update employee fail");
                        	}
                        }
                    });
                });
                $("#insertEmployeeBtn").click(function(){
                	var flag = false;
                	$("#insertEmployeeForm input").each(function(index, value){
                		if ($(value).val()==''){
                			flag = true;
                		}
                	});
                	if (flag == true) {
                		alert("Please fill the form");
                	} else {
                		$.ajax({
                            url: "employee/insert",
                            method: "post",
                            //contentType: "application/json",
                            data: $("#insertEmployeeForm").serializeArray(),
                            success: function (response) {
                            	if (response == "success") {
    	                            $("#insertEmployeeResult").html("Insert employee successfully");
                            	} else {
                            		$("#insertEmployeeResult").html("Insert employee fail");
                            	}
                            }
                        });
                	}
                	
                });
                $("#clearEmployeeBtn").click(function(){
                	$("#searchEmployeeForm").remove("input[type='hidden']");
                	$("#searchEmployeeForm input[name='id']").prop('disabled', false);
                	$("#searchEmployeeForm input[name='id']").val("");
                	$("#searchEmployeeForm input[name='name']").val("");
                	$("#searchEmployeeForm input[name='address']").val("");
                	$("#searchEmployeeForm input[name='phone']").val("");
                	$("#searchEmployeeForm input[name='email']").val("");
                	$("#searchEmployeeForm select").val("");
                	$("#submitUpdateEmployeeBtn").css("display","none");
                });
                
                
             // --- Vehicle-----
                $("#searchVehicleBtn").click(function(){
                    $.ajax({
                        url: "vehicle/search",
                        method: "get",
                        //contentType: "application/json",
                        data: $("#searchVehicleForm").serializeArray(),
                        success: function (responseXml) {
                            $("#searchVehicleResult").html($(responseXml).find("data").html());
                        }
                    });
                 });
                $('body').on('click','#editVehicleBtn',function(){
                	var element = this;
                	
                	$.ajax({
                        url: "vehicle/search/json",
                        method: "get",
                        //contentType: "application/json",
                        data: "id="+$(element).attr("vehicleid"),
                        success: function (response) {
                        	var arrayLength = response.length;
                        	for (var i = 0; i < arrayLength; i++) {
                        		$("#searchVehicleForm input[name='id']").val(response[i].id);
                        		$("#searchVehicleForm input[name='id']").prop('disabled', true);
                        		$("#searchVehicleForm").append("<input type='hidden' value='"+ response[i].id + "' name='id'></input>");
                        		$("#searchVehicleForm input[name='model']").val(response[i].model);
                        		$("#searchVehicleForm input[name='year']").val(response[i].year);
                        		$("#searchVehicleForm input[name='price']").val(response[i].price);
                        		$("#searchVehicleForm input[name='color']").val(response[i].color);
                        		$("#submitUpdateVehicleBtn").css("display","inline");
                        	}
                        }
                    });
    		    });
                $('body').on('click','#deleteVehicleBtn',function(){
                	var element = this;
                	if (confirm("Are you sure want to delete this record?") == true) {
                		$.ajax({
                            url: "vehicle/delete",
                            method: "post",
                            data: "id="+$(element).attr("vehicleid"),
                            success: function (response) {
                            	if (response == "success") {
                                	$("#updateDeleteVehicleResult").html("Delete vehicle successfully");
                                	$("#clearVehicleBtn").click();
                                	$("#searchVehicleBtn").click();
                                	
                            	} else {
                            		$("#updateDeleteVehicleResult").html("Delete vehicle fail");
                            	}
                            }
                        });
                	}
    		    });
                $("#submitUpdateVehicleBtn").click(function(){
                	$.ajax({
                        url: "vehicle/update",
                        method: "post",
                        data: $("#searchVehicleForm").serializeArray(),
                        success: function (response) {
                        	if (response == "success") {
                                $("#updateDeleteVehicleResult").html("Update vehicle successfully");
                        	} else {
                        		$("#updateDeleteVehicleResult").html("Update vehicle fail");
                        	}
                        }
                    });
                });
                $("#insertVehicleBtn").click(function(){
                	var flag = false;
                	$("#insertVehicleForm input").each(function(index, value){
                		if ($(value).val()==''){
                			flag = true;
                		}
                	});
                	if (flag == true) {
                		alert("Please fill the form");
                	} else {
                		$.ajax({
                            url: "vehicle/insert",
                            method: "post",
                            //contentType: "application/json",
                            data: $("#insertVehicleForm").serializeArray(),
                            success: function (response) {
                            	if (response == "success") {
    	                            $("#insertVehicleResult").html("Insert vehicle successfully");
                            	} else {
                            		$("#insertVehicleResult").html("Insert vehicle fail");
                            	}
                            }
                        });
                	}
                	
                });
                $("#clearVehicleBtn").click(function(){
                	$("#searchVehicleForm").remove("input[type='hidden']");
                	$("#searchVehicleForm input[name='id']").prop('disabled', false);
                	$("#searchVehicleForm input[name='id']").val("");
                	$("#searchVehicleForm input[name='model']").val("");
                	$("#searchVehicleForm input[name='year']").val("");
                	$("#searchVehicleForm input[name='price']").val("");
                	$("#searchVehicleForm input[name='color']").val("");
                	$("#searchVehicleForm select").val("");
                	$("#submitUpdateVehicleBtn").css("display","none");
                });
                
                
             // --- Dealership-----
                $("#searchDealershipBtn").click(function(){
                    $.ajax({
                        url: "dealership/search",
                        method: "get",
                        //contentType: "application/json",
                        data: $("#searchDealershipForm").serializeArray(),
                        success: function (responseXml) {
                            $("#searchDealershipResult").html($(responseXml).find("data").html());
                        }
                    });
                 });
                $('body').on('click','#editDealershipBtn',function(){
                	var element = this;
                	
                	$.ajax({
                        url: "dealership/search/json",
                        method: "get",
                        //contentType: "application/json",
                        data: "id="+$(element).attr("dealershipid"),
                        success: function (response) {
                        	var arrayLength = response.length;
                        	for (var i = 0; i < arrayLength; i++) {
                        		$("#searchDealershipForm input[name='id']").val(response[i].id);
                        		$("#searchDealershipForm input[name='id']").prop('disabled', true);
                        		$("#searchDealershipForm").append("<input type='hidden' value='"+ response[i].id + "' name='id'></input>");
                        		$("#searchDealershipForm input[name='name']").val(response[i].name);
                        		$("#submitUpdateDealershipBtn").css("display","inline");
                        	}
                        }
                    });
    		    });
                $('body').on('click','#deleteDealershipBtn',function(){
                	var element = this;
                	if (confirm("Are you sure want to delete this record?") == true) {
                		$.ajax({
                            url: "dealership/delete",
                            method: "post",
                            data: "id="+$(element).attr("dealershipid"),
                            success: function (response) {
                            	if (response == "success") {
                                	$("#updateDeleteDealershipResult").html("Delete dealership successfully");
                                	$("#clearDealershipBtn").click();
                                	$("#searchDealershipBtn").click();
                                	
                            	} else {
                            		$("#updateDeleteDealershipResult").html("Delete dealership fail");
                            	}
                            }
                        });
                	}
    		    });
                $("#submitUpdateDealershipBtn").click(function(){
                	$.ajax({
                        url: "dealership/update",
                        method: "post",
                        data: $("#searchDealershipForm").serializeArray(),
                        success: function (response) {
                        	if (response == "success") {
                                $("#updateDeleteDealershipResult").html("Update dealership successfully");
                        	} else {
                        		$("#updateDeleteDealershipResult").html("Update dealership fail");
                        	}
                        }
                    });
                });
                $("#insertDealershipBtn").click(function(){
                	var flag = false;
                	$("#insertDealershipForm input").each(function(index, value){
                		if ($(value).val()==''){
                			flag = true;
                		}
                	});
                	if (flag == true) {
                		alert("Please fill the form");
                	} else {
                		$.ajax({
                            url: "dealership/insert",
                            method: "post",
                            //contentType: "application/json",
                            data: $("#insertDealershipForm").serializeArray(),
                            success: function (response) {
                            	if (response == "success") {
    	                            $("#insertDealershipResult").html("Insert dealership successfully");
                            	} else {
                            		$("#insertDealershipResult").html("Insert dealership fail");
                            	}
                            }
                        });
                	}
                	
                });
                $("#clearDealershipBtn").click(function(){
                	$("#searchDealershipForm").remove("input[type='hidden']");
                	$("#searchDealershipForm input[name='id']").prop('disabled', false);
                	$("#searchDealershipForm input[name='id']").val("");
                	$("#searchDealershipForm input[name='name']").val("");
                	$("#submitUpdateDealershipBtn").css("display","none");
                });
                
                
             // --- inventory-----
                $("#searchInventoryBtn").click(function(){
                    $.ajax({
                        url: "inventory/search",
                        method: "get",
                        //contentType: "application/json",
                        data: $("#searchInventoryForm").serializeArray(),
                        success: function (responseXml) {
                            $("#searchInventoryResult").html($(responseXml).find("data").html());
                        }
                    });
                 });
                $('body').on('click','#editInventoryBtn',function(){
                	var element = this;
                	
                	$.ajax({
                        url: "inventory/search/json",
                        method: "get",
                        //contentType: "application/json",
                        data: "id="+$(element).attr("inventoryid"),
                        success: function (response) {
                        	var arrayLength = response.length;
                        	for (var i = 0; i < arrayLength; i++) {
                        		$("#searchInventoryForm input[name='id']").val(response[i].id);
                        		$("#searchInventoryForm input[name='id']").prop('disabled', true);
                        		$("#searchInventoryForm").append("<input type='hidden' value='"+ response[i].id + "' name='id'></input>");
                        		$("#searchInventoryForm input[name='name']").val(response[i].name);
                        		$("#searchInventoryForm input[name='address']").val(response[i].address);
                        		$("#submitUpdateInventoryBtn").css("display","inline");
                        	}
                        }
                    });
    		    });
                $('body').on('click','#deleteInventoryBtn',function(){
                	var element = this;
                	if (confirm("Are you sure want to delete this record?") == true) {
                		$.ajax({
                            url: "inventory/delete",
                            method: "post",
                            data: "id="+$(element).attr("inventoryid"),
                            success: function (response) {
                            	if (response == "success") {
                                	$("#updateDeleteInventoryResult").html("Delete inventory successfully");
                                	$("#clearInventoryBtn").click();
                                	$("#searchInventoryBtn").click();
                                	
                            	} else {
                            		$("#updateDeleteInventoryResult").html("Delete inventory fail");
                            	}
                            }
                        });
                	}
    		    });
                $("#submitUpdateInventoryBtn").click(function(){
                	$.ajax({
                        url: "inventory/update",
                        method: "post",
                        data: $("#searchInventoryForm").serializeArray(),
                        success: function (response) {
                        	if (response == "success") {
                                $("#updateDeleteInventoryResult").html("Update inventory successfully");
                        	} else {
                        		$("#updateDeleteInventoryResult").html("Update inventory fail");
                        	}
                        }
                    });
                });
                $("#insertInventoryBtn").click(function(){
                	var flag = false;
                	$("#insertInventoryForm input").each(function(index, value){
                		if ($(value).val()==''){
                			flag = true;
                		}
                	});
                	if (flag == true) {
                		alert("Please fill the form");
                	} else {
                		$.ajax({
                            url: "inventory/insert",
                            method: "post",
                            //contentType: "application/json",
                            data: $("#insertInventoryForm").serializeArray(),
                            success: function (response) {
                            	if (response == "success") {
    	                            $("#insertInventoryResult").html("Insert inventory successfully");
                            	} else {
                            		$("#insertInventoryResult").html("Insert inventory fail");
                            	}
                            }
                        });
                	}
                	
                });
                $("#clearInventoryBtn").click(function(){
                	$("#searchInventoryForm").remove("input[type='hidden']");
                	$("#searchInventoryForm input[name='id']").prop('disabled', false);
                	$("#searchInventoryForm input[name='id']").val("");
                	$("#searchInventoryForm input[name='name']").val("");
                	$("#searchInventoryForm input[name='address']").val("");
                	$("#submitUpdateInventoryBtn").css("display","none");
                });
                
                
             // --- Billing-----
                $("#searchBillingBtn").click(function(){
                    $.ajax({
                        url: "billing/search",
                        method: "get",
                        //contentType: "application/json",
                        data: $("#searchBillingForm").serializeArray(),
                        success: function (responseXml) {
                            $("#searchBillingResult").html($(responseXml).find("data").html());
                        }
                    });
                 });
                $('body').on('click','#editBillingBtn',function(){
                	var element = this;
                	
                	$.ajax({
                        url: "billing/search/json",
                        method: "get",
                        //contentType: "application/json",
                        data: "id="+$(element).attr("billingid"),
                        success: function (response) {
                        	var arrayLength = response.length;
                        	for (var i = 0; i < arrayLength; i++) {
                        		$("#searchBillingForm input[name='id']").val(response[i].id);
                        		$("#searchBillingForm input[name='id']").prop('disabled', true);
                        		$("#searchBillingForm").append("<input type='hidden' value='"+ response[i].id + "' name='id'></input>");
                        		$("#searchBillingForm input[name='payment_date']").val(response[i].payment_date);
                        		$("#searchBillingForm input[name='payment_method']").val(response[i].payment_method);
                        		$("#searchBillingForm select[name='service_id']").val(response[i].service_id);
                        		$("#searchBillingForm select[name='customer_id']").val(response[i].customer_id);
                        		$("#searchBillingForm select[name='vehicle_id']").val(response[i].vehicle_id);
                        		$("#submitUpdateBillingBtn").css("display","inline");
                        	}
                        }
                    });
    		    });
                $('body').on('click','#deleteBillingBtn',function(){
                	var element = this;
                	if (confirm("Are you sure want to delete this record?") == true) {
                		$.ajax({
                            url: "billing/delete",
                            method: "post",
                            data: "id="+$(element).attr("billingid"),
                            success: function (response) {
                            	if (response == "success") {
                                	$("#updateDeleteBillingResult").html("Delete billing successfully");
                                	$("#clearBillingBtn").click();
                                	$("#searchBillingBtn").click();
                                	
                            	} else {
                            		$("#updateDeleteBillingResult").html("Delete billing fail");
                            	}
                            }
                        });
                	}
    		    });
                $("#submitUpdateBillingBtn").click(function(){
                	$.ajax({
                        url: "billing/update",
                        method: "post",
                        data: $("#searchBillingForm").serializeArray(),
                        success: function (response) {
                        	if (response == "success") {
                                $("#updateDeleteBillingResult").html("Update billing successfully");
                        	} else {
                        		$("#updateDeleteBillingResult").html("Update billing fail");
                        	}
                        }
                    });
                });
                $("#insertBillingBtn").click(function(){
                	var flag = false;
                	$("#insertBillingForm input").each(function(index, value){
                		if ($(value).val()==''){
                			flag = true;
                		}
                	});
                	if (flag == true) {
                		alert("Please fill the form");
                	} else {
                		$.ajax({
                            url: "billing/insert",
                            method: "post",
                            //contentType: "application/json",
                            data: $("#insertBillingForm").serializeArray(),
                            success: function (response) {
                            	if (response == "success") {
    	                            $("#insertBillingResult").html("Insert billing successfully");
                            	} else {
                            		$("#insertBillingResult").html("Insert billing fail");
                            	}
                            }
                        });
                	}
                	
                });
                $("#clearBillingBtn").click(function(){
                	$("#searchBillingForm").remove("input[type='hidden']");
                	$("#searchBillingForm input[name='id']").prop('disabled', false);
                	$("#searchBillingForm input[name='id']").val("");
                	$("#searchBillingForm input[name='payment_date']").val("");
                	$("#searchBillingForm input[name='payment_method']").val("");
                	$("#searchBillingForm select[name='service_id']").val("");
                	$("#searchBillingForm select[name='vehicle_id']").val("");
                	$("#searchBillingForm select[name='customer_id']").val("");
                	$("#submitUpdateBillingBtn").css("display","none");
                });
                
            });
            
        </script>
    </body>
</html>