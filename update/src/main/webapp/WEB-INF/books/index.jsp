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
	<style>
		body{
		background-color: #F3ECDC;
		}
	</style>		
<title>Book List</title>
</head>
<body>
	<div class = "container text-center">
		<div class="row d-flex align-items-center justify-content-center vh-100">
			<table  class="table">
			<thead>
				<tr >
					<th class="fw-lighter text-center fs-5">Title</th>
					<th class="fw-lighter text-center fs-5">Description</th>
					<th class="fw-lighter text-center fs-5">Language</th>
					<th class="fw-lighter text-center fs-5">Number of Pages</th>
					<th class="fw-lighter text-center fs-5">Edit</th>
					<th class="fw-lighter text-center fs-5">Delete</th>
						
				</tr>
			</thead>
			
			<tbody>
				<c:forEach items="${books}" var ="book">
				<tr>
					<td class="fw-lighter text-center fs-5"><c:out value="${book.title}"/></td>
					<td class="fw-lighter text-center fs-5"><c:out value="${book.description}"/></td>
					<td class="fw-lighter text-center fs-5"><c:out value="${book.language}"/></td>
					<td class="fw-lighter text-center fs-5"><c:out value="${book.numberOfPages}"/></td>	
					<td><a class="fw-lighter text-decoration-none" href="/books/${book.id}/edit">Edit</a></td>	
					<td><a class="fw-lighter text-danger text-decoration-none" href="/books/${book.id}/delete">Delete</a></td>					
									
				</tr>
				</c:forEach>
			</tbody>
			</table>
			<div>
				<a class="fw-lighter text-center text-decoration-none fs-5" href="/books/new">Create New Book</a>
			</div>
			
		</div>
	
	</div>
	
	 <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" 
 			integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN" 
 			crossorigin="anonymous">
	</script>
</body>
</html>