<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="context" value="${pageContext.request.contextPath}" />
<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="#">Feedback Management System</a>
    </div>
    <ul class="nav navbar-nav">
      <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">Student<span class="caret"></span></a>
        <ul class="dropdown-menu">
          <li><a href="${context}/admin/user/list">All Student</a></li>
          <li><a href="${context}/admin/user/create">Create Student</a></li>
        </ul>
      </li>
      <li><a href="#">Faculty</a>
      	<ul class="dropdown-menu">
          <li><a href="#">All Faculty</a></li>
          <li><a href="#">Create Faculty</a></li>
        </ul>
      </li>
      <li><a href="#">Contact Us</a></li>
<!--       <li style="float: right"><a href="#">Logout</a></li> -->
    </ul>
    <ul class="nav navbar-nav" style="float: right">
    	<li ><a href="${context}/logout">Logout</a></li>
    </ul>
  </div>
</nav>