
   
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
<!-- 	<link rel="stylesheet" href="/css/main.css"/>
 -->	<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
      rel="stylesheet"><title>New Dojo</title>
      <link rel="preconnect" href="https://fonts.googleapis.com">
	  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	  <link href="https://fonts.googleapis.com/css2?family=Josefin+Sans:wght@100&display=swap" rel="stylesheet">
	  
	  <style>
	  	body{
	  	background-color: #ccd6d3;
	  	}
	  </style>
</head>
<body>
	<div class="container">
		<div class="row align-items-center vh-100 justify-content-center">
				<div class= "card text-center fw-light border-0 rounded-3 shadow-lg bg-transparent" style="width: 18rem;">
				<div class="card-body">
					<h2 class="card-title fw-light mb-2 border-0" style="font-family: 'Josefin Sans', sans-serif;">New Dojo</h2>
					<form:form action="/process" method="post" modelAttribute="newDojo">
						<p>
<%-- 							<form:label path="name">Name:</form:label>
 --%>							<form:input class="fw-light text-center mt-3 border-0 bg-transparent" style="font-family: 'Josefin Sans', sans-serif;" placeholder="Enter Dojo Name" path="name"/>
						</p>
						<p>
							<input class="btn btn-outline-light fw-light text-black mt-3 border-0 bg-transparent" id="btn" type="submit" value="Create"/>
						</p>
					</form:form>
					<form:errors path = "newDojo.*"/>		
				</div>
			</div>
	
		</div>	
	</div>

</body>
</html>