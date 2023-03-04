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
	<title>	<c:out value="${book.title}"/></title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" 
	integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css" />
	<style>
		body{
		background-color: #F3ECDC;
		}
	</style>
</head>

<body>
	<h2><c:out value="${book.title}"/></h2>
	<p>Description: <c:out value="${book.description}"/></p>
	<p>Language: <c:out value="${book.language}"/></p>
	<p>Number Of Pages: <c:out value="${book.numberOfPages}"/></p>
	<a href="/books/${book.id}/edit">Edit Book</a>
	
	<form action = "/books/${book.id }" method="post">
		<input type="hidden" name="editShow" value="delete">
		<input type="submit" value="Delete">
		
	</form>
	 <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" 
 			integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN" 
 			crossorigin="anonymous">
	</script>
</body>
</html>