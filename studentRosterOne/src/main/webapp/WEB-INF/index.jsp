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
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Nunito+Sans:wght@200&display=swap" rel="stylesheet">
	<style>
		body{
			background-image: url("../images/background.png");  
			background-repeat: no-repeat;
	 		background-size:100% 150%;
	 			
 			}

	</style>
	<title>Student</title>	
</head>
<body>
	<div class="container" style="font-family: 'Nunito Sans', sans-serif;" >
		<h2 class="title text-center mb-5 py-5 fw-lighter text-center">New Student</h2>
		<div class="row">
			<div class="col d-flex justify-content-center">
				<div class="card text-center border-white shadow-lg p-3 mb-5 bg-body rounded-pilled bg-transparent">
					<div class="card-body">
							<form:form action="/processStudent" method="post" modelAttribute="std">
							<p class="label">
			 				<form:label class="px-3 mt-2 border-0 rounded-pill text-center bg-transparent fw-lighter" path="firstName">First Name: </form:label>
				 				<form:input class="px-3 mt-2 border-0 rounded-pill text-center bg-transparent fw-lighter" path="firstName" placeholder="First Name"/>
							</p>
							<p class="label">
				 				<form:label class="px-3 mt-2 border-0 rounded-pill text-center bg-transparent fw-lighter" path="lastName">Last Name:</form:label>
				 				<form:input class="px-3 mt-2 border-0 rounded-pill text-center bg-transparent fw-lighter" path="lastName" placeholder="Last Name"/>
							</p>
							<p class="label">
								<form:label  class="px-3 mt-2 border-0 rounded-pill  bg-transparent fw-lighter" path="age">Age:</form:label>
				 				<form:input class="px-3 mt-2 border-0 rounded-pill  bg-transparent fw-lighter"  palceholder="Enter Age" path="age" />
							</p>
							<p class="label">
								<input class="btn btn-outline-light text-dark mt-3 fw-lighter" id="btn" type="submit" value="Create">
							</p>
							</form:form>
						</div>
				
				</div>
			</div>
				
		</div>
		
		</div>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>