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
<title>Dashboard</title>
</head>
<body>
	<div id="container text-center">
		<div class="p-5 row text-center">
			<table class="bg-transparent table table-sm table-hover">
				<thead class="align-items-center justify-content-center">
					<tr>
						<th class="fw-lighter text-center fs-5">Name</th>
						<th class="fw-lighter text-center fs-5">Creator</th>
						<th class="fw-lighter text-center fs-5">Version</th>
						<th class="fw-lighter text-center fs-5">Action</th>
					</tr>
				</thead>
				
				<tbody class=" align-items-center justify-content-center">
					<c:forEach items="${languages}" var="language">
						<tr>
							<td class="middle fw-lighter text-center fs-5"><a class="text-decoration-none" href="languages/<c:out value="${language.id}"/>"><c:out value="${language.name}"/></a></td>
							<td class="middle fw-lighter text-center fs-5"><c:out value="${language.creator}"/></td>
			            	<td class="middle fw-lighter text-center fs-5"><c:out value="${language.version}"/></td>
			            	<td class="middle fw-lighter text-center fs-5"><a class="p-2" href="/languages/delete/<c:out value="${language.id}"/>">
			            											<span class="material-icons"> delete_outline </span></a> 
			            											
			            											<a class="" href="languages/edit/<c:out value="${language.id}"/>">
			            											<span class="material-icons">edit</span></a></td>
						</tr>
					</c:forEach>
				</tbody>
				</table>
		</div> 
		
		<div class="row">
			<form:form action="/languages" method="post" modelAttribute="addNew">		  
			    <p class="text-center">
			        <form:input class="px-3 shadow-lg bg-body rounded bg-transparent align-items-center justify-content-center fw-lighter text-reset text-center rounded-pill border-1 border-danger fs-5" path="name" placeholder="enter language"/>
			        	<form:errors class="red" path="name"/>

			    </p>
			    <p class="text-center">
		        <form:input class="px-3 shadow-lg bg-body rounded bg-transparent align-items-center justify-content-center fw-lighter text-reset text-center rounded-pill border-1 border-danger fs-5" path="creator" placeholder="creator"/>
    					<form:errors class="red" path="creator"/>
			    </p>
			    <p class="text-center">
			        <form:input class="px-3 shadow-lg bg-body rounded bg-transparent align-items-center justify-content-center fw-lighter text-reset text-center rounded-pill border-1 border-danger fs-5" path="version" placeholder="version"/>
     		 			<form:errors class="red" path="version"/>
			    </p>
			    <div class=" text-center">
			    	<input class="px-3 shadow-lg bg-body rounded bg-transparent fw-lighter text-reset text-center rounded-pill border-1 border-danger fs-5" type="submit" value="Submit"/>	 	
			    </div>
			</form:form>
		</div>
		
	</div>
</body>
</html>