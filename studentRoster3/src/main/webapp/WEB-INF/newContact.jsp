<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c" %>
<%@ page isErrorPage="true" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Contact Information</title>
</head>
<body>
<form:form action="/processContact" method="post" modelAttribute="contact">
		<h3>
			<form:label path="address">Address: </form:label>
			<form:input path="address"/>
			<form:errors path="address"/>
		</h3>
		<h3>
			<form:label path="city">City: </form:label>
			<form:input path="city"/>
			<form:errors path="city"/>
		</h3>
		<h3>
			<form:label path="state">State: </form:label>
			<form:input path="state"/>
			<form:errors path="state"/>
		</h3>
		
		<input id="btn" type="submit" value="Create"/>
	</form:form>
	
	<div>
		<form:errors path="contact.*"/>
	</div>
</body>
</html>