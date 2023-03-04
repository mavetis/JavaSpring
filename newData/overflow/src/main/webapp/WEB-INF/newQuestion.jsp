<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page isErrorPage="true" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>New Question</title>
</head>
<body>
	<h2>What's The Question?</h2>
	<form action="/questions/create" method="POST">
		<h3>
			<label>Question:</label>
			<input name="question"/>
		</h3>
		<h3>
			<label>Tags:</label>
			<input name="tag"/>
		</h3>
		 <input type="submit" value="Submit"/>
		</form>

</body>
</html>