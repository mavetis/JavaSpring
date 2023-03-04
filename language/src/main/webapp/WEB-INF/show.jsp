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
	
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
		<!-- Bootstrap -->
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
		<link rel="stylesheet" type="text/css" href="http://yui.yahooapis.com/3.11.0/build/cssnormalize/cssnormalize-min.css">
		<link rel="stylesheet" href="/css/main.css">
		
<title><c:out value="${language.name}"/></title>
</head>
<body>
	<div id="container">
		<div>
			<a href="/languages"><h1 class= "home">Dashboard</h1></a>
		</div>
		
		<h1><c:out value="${language.name}"/></h1>
		<h1><c:out value="${language.creator}"/></h1>
		<h1><c:out value="${language.version}"/></h1>
		<a href="/languages/edit/<c:out value="${language.id}"/>"><h1>Edit</h1></a>
		<a href="/languages/delete/<c:out value="${language.id}"/>"><h1>Delete</h1></a>
	</div>
</body>
</html>