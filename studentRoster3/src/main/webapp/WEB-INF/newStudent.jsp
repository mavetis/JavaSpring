   
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c" %>
<%@ page isErrorPage="true" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>New Student Registration</title>
</head>
<body>
	<form:form action="/processStudent" method="post" modelAttribute="student">
		<h3>
			<form:label path="firstName">First Name: </form:label>
			<form:input path="firstName"/>
			<form:errors path="firstName"/>
		</h3>
		<h3>
			<form:label path="lastName">Last Name: </form:label>
			<form:input path="lastName"/>
			<form:errors path="lastName"/>
		</h3>
		<h3>
			<form:label path="age">Age: </form:label>
			<form:input path="age"/>
			<form:errors path="age"/>
		</h3>
		
		<input id="btn" type="submit" value="Create"/>
	</form:form>
	
	<div>
		<form:errors path="student.*"/>
	</div>

</body>
</html>