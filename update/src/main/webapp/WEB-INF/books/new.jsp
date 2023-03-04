<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>    
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Collections"%>   
    
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>New Books</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" 
	integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	
	<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css" />
	<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
	<style>
		body{
		background-color: #F3ECDC;
		}
	</style>
</head>
<body>
	<div class="container text-center">
		<div class="row g-3 d-flex align-items-center justify-content-center vh-100">
				<form:form action="/books" method="post" modelAttribute="book">
				<h1 class="px-3 fw-lighter text-center">New Book</h1>
					<p>
 						<p>
 							<form:errors class="fw-lighter text-warning text-center fs-5" path="title"/>
 						</p>
				        <form:input class="px-3 bg-transparent fw-lighter text-reset text-center rounded-pill border-1 border-danger fs-5" placeholder= "Title" path="title"/>
				    </p>  
				   
				    <p>
					    <p>
					     	<form:errors class="fw-lighter text-warning text-center fs-5" path="description"/>
					    </p>
					        <form:textarea class="py-3 px-3 bg-transparent fw-lighter text-reset text-center rounded-pill border-1 border-danger fs-5" path="description" placeholder="Describe book"/>
					</p>
				    
				    <p>
					    <p>
					    	<form:errors class="fw-lighter text-warning text-center fs-5" path="language"/>				    	
					    </p>
				        <form:input class="px-3 bg-transparent fw-lighter text-reset text-center rounded-pill border-1 border-danger fs-5" path="language" placeholder="Language"/>
				    </p>
				    <p>
					    <p>
					    <form:errors class="fw-lighter text-warning text-center fs-5" path="numberOfPages"/>     					    	
					    </p>
					        <form:input class="px-3 bg-transparent align-items-center justify-content-center fw-lighter text-reset text-center rounded-pill border-1 border-danger fs-5" type="number" path="numberOfPages" placeholder="Number of pages"/>
				    </p>    
				    <input class="px-3 bg-transparent fw-lighter text-reset text-center rounded-pill border-1 border-danger fs-5" type="submit" value="Submit"/>
				</form:form> 	
		</div>
		
	</div>
	  
 <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" 
 			integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN" 
 			crossorigin="anonymous">
</script>	 
</body>
</html>