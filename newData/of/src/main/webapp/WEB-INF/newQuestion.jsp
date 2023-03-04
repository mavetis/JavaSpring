<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Dashboard</title>
</head>
<body>
	<h1>What is the question?</h1>
	
	<form:form action="questions/create" method="post" modelAttribute="newQuest">
		<h3>
			<form:label path="question">Question:</form:label>
			<form:errors path="question"/>
			<form:textarea path="question"></form:textarea>
		</h3>
		<h3>
			<form:label path="tags">Tags:</form:label>
			<form:errors path="tags"/>
			<form:input path="tags"/>
		</h3>
		<button>Submit</button>
	</form:form>
</body>
</html>