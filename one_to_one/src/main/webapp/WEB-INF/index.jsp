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
	<link rel="stylesheet" href="/css/main.css"/>
	<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
      rel="stylesheet">

	<title>Person</title>
</head>
<body class="body">
	<div class="container-sm">
		<h2 class="title text-center py-5 fw-lighter text-center"> Welcome</h2>
		<div class="row">
		<div class="col d-flex justify-content-center">
		<div class="card m2 cb1 text-center">
			<div class="card-body">
			<h3 class="card-title mb-3 fw-lighter text-center">Sign Up Here!</h3>
				<form:form action="/processPerson" method="post" modelAttribute="ppl">
				<p class="">
					<form:input class="px-3 mt-2 border-0 rounded-pill text-center bg-transparent fw-lighter" placeholder="Enter Name" path="firstName"/>
					<p class="text-warning">
					<form:errors path="firstName"/>				
					</p>
				</p>
				<p>
					<form:input  class="px-3 border-0 rounded-pill text-center bg-transparent fw-lighter" placeholder="Enter Lastname" path="lastName"/>
					<p class="text-warning">
					<form:errors path="lastName"/>
					</p>
				</p>
				<p class="">
					<input class="btn btn-outline-light text-white mt-3" type="submit" value="Create">
				</p>
				</form:form>
			</div>
		</div>
		</div>
		
		</div>
	</div>
</body>
</html>