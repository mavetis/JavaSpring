<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ page isErrorPage="true" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" 
	integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css" />
	<link rel="stylesheet" href="/css/main.css"/>
	<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
      rel="stylesheet">
<title>Id Info</title>
</head>
<body class="body">
	<div class="container">
		<div class="my-5 ms-5">
			
				<h1 class="ms-5 fw-lighter"><c:out value="${license.person.firstName} ${license.person.lastName}"/></h1>
				<h2 class="ms-5 fw-lighter">License Number: <c:out value="${license.number}"/></h2>
				<h2 class="ms-5 fw-lighter">State: <c:out value="${license.state}"/></h2>
				<h2 class="ms-5 fw-lighter">Expiration Date: <fmt:formatDate pattern="MM-dd-yyyy" value="${license.expirationDate}"/></h2>
			
		</div>
					
	</div>
			
</body>
</html>