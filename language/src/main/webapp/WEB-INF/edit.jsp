<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>    
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Collections"%>   
    <%@ page isErrorPage="true" %>
    
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" 
	integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css" />
	<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
      rel="stylesheet">
	<style>
		body{
		background-color: #acebe0;
		}
	</style>
		
<title><c:out value="${language.name}"/></title>
</head>
<body>
			
		<form:form class="py-5" action="/languages/edit/${language.id}" method="post" modelAttribute="language">
		<input type="hidden" name="_method" value="put">
			<div id="container text-center">
				<div class="row py-5 align-items-center justify-content-md-center text-center">
				   
				    <div class="col">
				    	 <p class="py-0">
					        <form:input class="px-3 shadow-lg bg-body rounded bg-transparent align-items-center justify-content-center fw-lighter text-reset text-center rounded-pill border-1 border-danger fs-5" placeholder="language name" path="name"/>
					        <form:errors class="red" path="name"/>
		
					    </p>
					    <p class="py-0">
					        <form:input class="px-3 shadow-lg bg-body rounded bg-transparent align-items-center justify-content-center fw-lighter text-reset text-center rounded-pill border-1 border-danger fs-5" placeholder="creator" path="creator"/>
		    				<form:errors class="red" path="creator"/>
					    </p>
					    <p class="py-0">
					        <form:input class="px-3 shadow-lg bg-body rounded bg-transparent align-items-center justify-content-center fw-lighter text-reset text-center rounded-pill border-1 border-danger fs-5" placeholder="version" path="version"/>
		     		 		<form:errors class="red" path="version"/>
					    </p>
				    <input class="px-3 shadow-lg bg-body rounded bg-transparent fw-lighter text-reset text-center rounded-pill border-1 border-danger fs-5" type="submit" value="Submit"/>
				    </div>
				    
				    <div class="row py-5 align-items-center">
					 	<div class="col">
							<a class="fw-lighter text-reset text-center" href="/languages/delete/<c:out value="${language.id}"/>">
								<span class="material-icons"> delete_outline </span>
							</a>
						</div>
				 	</div>
					
					<div class="row align-items-center">
						<div class="col">
							<a class="fw-lighter text-reset text-center" href="/languages">
								<span class="material-icons">dashboard</span>							
							</a>
						</div>
					</div>
				</div>
				</div>
				</form:form>
	
</body>
</html>