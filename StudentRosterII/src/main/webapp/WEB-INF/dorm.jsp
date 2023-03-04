   
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c" %>
<%@ page isErrorPage="true" %>     
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<link rel="stylesheet" href="/css/index.css">
<title>New Dorm</title>
</head>
<body>
	<div>
		<h1>New Dorm</h1>
		
		<form:form action="/processDorm" method="post" modelAttribute="newDorm">
			<h2>
				<form:label path="name">Name:</form:label>
				<form:input path="name"/>
				<form:errors path="name"/>
			</h2>
			<h2>
				<input id="btn" type="submit" value="Create"/>
			</h2>
		</form:form>
		
		<form:errors path = "newDorm.*"/>
	</div>
</body>
</html>