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
	<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
      rel="stylesheet">
      <link rel="preconnect" href="https://fonts.googleapis.com">
	  <link rel="preconnect" href="https://fonts.gstatic.com">
	  <link href="https://fonts.googleapis.com/css2?family=Josefin+Sans:wght@100&display=swap" rel="stylesheet">
	  
	  <style>
	  	body{
	  	background-color: #ccd6d3;
	  	}
	  </style>
	<title>Dojos and Ninjas</title>
</head>
<body>
<div class="container">
	<div class="row">
			<h1 class="text-center" style="font-family: 'Josefin Sans', sans-serif;"><c:out value="${dojo.name}"/> Ninjas</h1>
		<table  style="font-family: 'Josefin Sans', sans-serif;">
			<thead class="text-center">
				<tr>
				   <th scope="col">First Name</th>
				   <th scope="col">Last Name</th>
				   <th scope="col">Age</th>
				</tr>
			</thead>
			<tbody class="text-center">
				<c:forEach items="${dojo.ninjas}" var="ninja">
					<tr  class="text-center">
						<td><c:out value="${ninja.firstName}"></c:out></td>
						<td><c:out value="${ninja.lastName}"></c:out><td>
						<td><c:out value="${ninja.age}"></c:out></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</div>

</body>
</html>