<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isErrorPage="true" %>  
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet"/> 
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css" />
	<style>
		body{
			background-image: url("../images/wallpaper.png");  
			background-repeat: no-repeat;
	 		background-size:cover;	
 			}

	</style>
<title>Student List</title>
</head>
<body>
<div class="container text-center">
	<div class="row">
	
	</div>
	<table class="table table-borderless mt-5">
		<thead>
			<tr class="me-5">
				<th class="text-center fw-lighter" scope="col">Name</th>
				<th class="text-center fw-lighter" scope="col">Age</th>
				<th class="text-center fw-lighter" scope="col">Address</th>
				<th class="text-center fw-lighter" scope="col">City</th>
				<th class="text-center fw-lighter" scope="col">State</th>	
			</tr>
		</thead>
		<tbody>
  				<c:forEach items="${students}" var= "s">
	  				<tr>
		  				<td class="fw-lighter"><c:out value="${s.firstName} ${s.lastName}"/></td>
						<td class="fw-lighter"><c:out value="${s.age}"/></td>
						<td class="fw-lighter"><c:out value="${s.info.address}"/></td>
						<td class="fw-lighter"><c:out value="${s.info.city}"/></td>
						<td class="fw-lighter"><c:out value="${s.info.state}"/></td>
	  				</tr>
 				</c:forEach>
 		</tbody>
	</table>
</div>
	
</body>
</html>