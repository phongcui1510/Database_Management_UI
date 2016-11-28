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
<%--         <c:if test="${not empty currentUser}">
            <p style="float: right; margin: 0px">Login as ${currentUser.username} <a href="${pageContext.request.contextPath}/logout">Logout</a></p>
        </c:if>
        <c:if test="${empty currentUser}">
            <a href="${pageContext.request.contextPath}/login" style="float: right">Login</a>
        </c:if> --%>
        <c:set var="context" value="${pageContext.request.contextPath}" />
        <div id="tabs">
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
                        <li><a href="#customer-tab-sub-tabs-2">INSERT</a></li>
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
                        <div id="searchCustomerResult"></div>
                    </div>
                    <div id="customer-tab-sub-tabs-2">
                        <form id="insertCustomerForm">
                            <table>
                                <tr>
                                    <td>Customer Name</td>
                                    <td><input type="text" name="name" required></td>
                                </tr>
                                <tr>
                                    <td>Address</td>
                                    <td><input type="text" name="address" required></td>
                                </tr>
                                <tr>
                                    <td>Phone Number</td>
                                    <td><input type="text" name="phone" required></td>
                                </tr>
                                <tr>
                                    <td>Email</td>
                                    <td><input type="text" name="email" required></td>
                                </tr>
                            </table>
                        </form>
                        <input id="insertCustomerBtn" type="button" value="Insert">
                        <div id="insertCustomerResult"></div>
                    </div>
                </div>
            </div>
            <div id="employee-tab">
            	<div class="sub-tabs">
                    <ul>
                        <li><a href="#employee-tab-sub-tabs-1">SEARCH</a></li>
                        <li><a href="#employee-tab-sub-tabs-2">INSERT</a></li>
                    </ul>
                    <div id="employee-tab-sub-tabs-1">
                        <form id="searchEmployeeForm">
                            <table>
			                    <tr>
			                        <td>Employee ID</td>
			                        <td><input type="text"></td>
			                    </tr>
			                    <tr>
			                        <td>Employee Name</td>
			                        <td><input type="text"></td>
			                    </tr>
			                    <tr>
			                        <td>Address</td>
			                        <td><input type="text"></td>
			                    </tr>
			                    <tr>
			                        <td>Phone Number</td>
			                        <td><input type="text"></td>
			                    </tr>
			                    <tr>
			                        <td>Email</td>
			                        <td><input type="text"></td>
			                    </tr>
			                </table>
                        </form>
                        <input id="searchEmployeeBtn" type="button" value="Search">
                        <div id="searchEmployeeResult"></div>
                    </div>
                    <div id="employee-tab-sub-tabs-2">
                        <form id="inserCustomerForm">
                            <table>
			                    <tr>
			                        <td>Employee Name</td>
			                        <td><input type="text"></td>
			                    </tr>
			                    <tr>
			                        <td>Address</td>
			                        <td><input type="text"></td>
			                    </tr>
			                    <tr>
			                        <td>Phone Number</td>
			                        <td><input type="text"></td>
			                    </tr>
			                    <tr>
			                        <td>Email</td>
			                        <td><input type="text"></td>
			                    </tr>
			                </table>
                        </form>
                        <input id="insertEmployeeBtn" type="button" value="Insert">
                        <div id="insertEmployeeResult"></div>
                    </div>
                </div>
            </div>
            <div id="vehicle-tab">
            	<div class="sub-tabs">
                    <ul>
                        <li><a href="#vehicle-tab-sub-tabs-1">SEARCH</a></li>
                        <li><a href="#vehicle-tab-sub-tabs-2">INSERT</a></li>
                    </ul>
                    <div id="vehicle-tab-sub-tabs-1">
                        <form id="searchVehicleForm">
                            <table>
			                    <tr>
			                        <td>Vehicle ID</td>
			                        <td><input type="text"></td>
			                    </tr>
			                    <tr>
			                        <td>Model</td>
			                        <td><input type="text"></td>
			                    </tr>
			                    <tr>
			                        <td>Price</td>
			                        <td><input type="text"></td>
			                    </tr>
			                    <tr>
			                        <td>Year</td>
			                        <td><input type="text"></td>
			                    </tr>
			                    <tr>
			                        <td>Color</td>
			                        <td><input type="text"></td>
			                    </tr>
			                </table>
                        </form>
                        <input id="searchVehicleBtn" type="button" value="Search">
                        <input id="editVehicleBtn" type="button" value="Search" style="display: none;">
                        <div id="searchVehicleResult"></div>
                    </div>
                    <div id="vehicle-tab-sub-tabs-2">
                        <form id="inserVehicleForm">
                            <table>
			                    <tr>
			                        <td>Vehicle ID</td>
			                        <td><input type="text"></td>
			                    </tr>
			                    <tr>
			                        <td>Model</td>
			                        <td><input type="text"></td>
			                    </tr>
			                    <tr>
			                        <td>Price</td>
			                        <td><input type="text"></td>
			                    </tr>
			                    <tr>
			                        <td>Year</td>
			                        <td><input type="text"></td>
			                    </tr>
			                    <tr>
			                        <td>Color</td>
			                        <td><input type="text"></td>
			                    </tr>
			                </table>
                        </form>
                        <input id="insertVehicleBtn" type="button" value="Insert">
                        <div id="insertVehicleResult"></div>
                    </div>
                </div>
            </div>
            <div id="billing-tab">
                <div class="sub-tabs">
                    <ul>
                        <li><a href="#billing-tab-sub-tabs-1">SEARCH</a></li>
                        <li><a href="#billing-tab-sub-tabs-2">INSERT</a></li>
                    </ul>
                    <div id="billing-tab-sub-tabs-1">
                        <form id="searchBillingForm">
                            <table>
			                    <tr>
			                        <td>Billing ID</td>
			                        <td><input type="text"></td>
			                    </tr>
			                    <tr>
			                        <td>Payment Method</td>
			                        <td><input type="text"></td>
			                    </tr>
			                    <tr>
			                        <td>Payment Date</td>
			                        <td><input type="text"></td>
			                    </tr>
			                    <tr>
			                        <td>Customer ID</td>
			                        <td><input type="text"></td>
			                    </tr>
			                    <tr>
			                        <td>Customer Name</td>
			                        <td><input type="text"></td>
			                    </tr>
			                    <tr>
			                        <td>Vehicle ID</td>
			                        <td><input type="text"></td>
			                    </tr>
			                    <tr>
			                        <td>Vehicle Name</td>
			                        <td><input type="text"></td>
			                    </tr>
			                    <tr>
			                        <td>Service ID</td>
			                        <td><input type="text"></td>
			                    </tr>
			                    <tr>
			                        <td>Service Name</td>
			                        <td><input type="text"></td>
			                    </tr>
			                </table>
                        </form>
                        <input id="searchBillingBtn" type="button" value="Search">
                        <div id="searchBillingResult"></div>
                    </div>
                    <div id="billing-tab-sub-tabs-2">
                        <form id="inserBillingForm">
                            <table>
			                    <tr>
			                        <td>Billing ID</td>
			                        <td><input type="text"></td>
			                    </tr>
			                    <tr>
			                        <td>Payment Method</td>
			                        <td><input type="text"></td>
			                    </tr>
			                    <tr>
			                        <td>Payment Date</td>
			                        <td><input type="text"></td>
			                    </tr>
			                    <tr>
			                        <td>Customer ID</td>
			                        <td><input type="text"></td>
			                    </tr>
			                    <tr>
			                        <td>Customer Name</td>
			                        <td><input type="text"></td>
			                    </tr>
			                    <tr>
			                        <td>Vehicle ID</td>
			                        <td><input type="text"></td>
			                    </tr>
			                    <tr>
			                        <td>Vehicle Name</td>
			                        <td><input type="text"></td>
			                    </tr>
			                    <tr>
			                        <td>Service ID</td>
			                        <td><input type="text"></td>
			                    </tr>
			                    <tr>
			                        <td>Service Name</td>
			                        <td><input type="text"></td>
			                    </tr>
			                </table>
                        </form>
                        <input id="insertBillingBtn" type="button" value="Insert">
                        <div id="insertBillingResult"></div>
                    </div>
                </div>
            </div>
            <div id="dealership-tab">
                <p>Mauris eleifend est et turpis. Duis id erat. Suspendisse potenti. Aliquam vulputate, pede vel vehicula accumsan, mi neque rutrum erat, eu congue orci lorem eget lorem. Vestibulum non ante. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Fusce sodales. Quisque eu urna vel enim commodo pellentesque. Praesent eu risus hendrerit ligula tempus pretium. Curabitur lorem enim, pretium nec, feugiat nec, luctus a, lacus.</p>
                <p>Duis cursus. Maecenas ligula eros, blandit nec, pharetra at, semper at, magna. Nullam ac lacus. Nulla facilisi. Praesent viverra justo vitae neque. Praesent blandit adipiscing velit. Suspendisse potenti. Donec mattis, pede vel pharetra blandit, magna ligula faucibus eros, id euismod lacus dolor eget odio. Nam scelerisque. Donec non libero sed nulla mattis commodo. Ut sagittis. Donec nisi lectus, feugiat porttitor, tempor ac, tempor vitae, pede. Aenean vehicula velit eu tellus interdum rutrum. Maecenas commodo. Pellentesque nec elit. Fusce in lacus. Vivamus a libero vitae lectus hendrerit hendrerit.</p>
            </div>
            <div id="inventory-tab">
                <p>Mauris eleifend est et turpis. Duis id erat. Suspendisse potenti. Aliquam vulputate, pede vel vehicula accumsan, mi neque rutrum erat, eu congue orci lorem eget lorem. Vestibulum non ante. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Fusce sodales. Quisque eu urna vel enim commodo pellentesque. Praesent eu risus hendrerit ligula tempus pretium. Curabitur lorem enim, pretium nec, feugiat nec, luctus a, lacus.</p>
                <p>Duis cursus. Maecenas ligula eros, blandit nec, pharetra at, semper at, magna. Nullam ac lacus. Nulla facilisi. Praesent viverra justo vitae neque. Praesent blandit adipiscing velit. Suspendisse potenti. Donec mattis, pede vel pharetra blandit, magna ligula faucibus eros, id euismod lacus dolor eget odio. Nam scelerisque. Donec non libero sed nulla mattis commodo. Ut sagittis. Donec nisi lectus, feugiat porttitor, tempor ac, tempor vitae, pede. Aenean vehicula velit eu tellus interdum rutrum. Maecenas commodo. Pellentesque nec elit. Fusce in lacus. Vivamus a libero vitae lectus hendrerit hendrerit.</p>
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
                $("#insertCustomerBtn").click(function(){
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
                });
                $("#submitUpdateCustomerBtn").click(function(){
                	$.ajax({
                        url: "customer/update",
                        method: "post",
                        //contentType: "application/json",
                        data: $("#searchCustomerForm").serializeArray(),
                        success: function (response) {
                        	if (response == "success") {
	                            $("#insertCustomerResult").html("Insert customer successfully");
                        	} else {
                        		$("#insertCustomerResult").html("Insert customer fail");
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
                })
                
            });
        </script>
    </body>
</html>