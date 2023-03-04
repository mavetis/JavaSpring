<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page isErrorPage="true" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Dorm</title>
</head>
<body>
	<h1><c:out value="${dorm.name }"/>  Dorm</h1>
	<form:form action="/dorms/addStudent" method="POST" modelAttribute="dorm">
		<h3>
 			<input type="hidden" value="${dorm.id}" name="dorm_id"/>
 			
 			<form:label path="student">Add Students:</form:label>
			<form:errors path="student"/>
			<form:select path="student">
				<c:forEach var="person" items="${students}">
					<form:option value="${person.id}">
						<c:out value="${person.firstName}"/>
						<c:out value="${person.lastName}"/>								
					</form:option>
				</c:forEach>
			</form:select>
		</h3>
	<input id="btn" type="submit" value="Add"/>	
	</form:form>
	
 	<table>
		<thead>
			<tr>
				<th>Name</th>
				<th>Action</th>	
			</tr>
		</thead>
		<tbody>
			<c:forEach var="student" items="${student.dorms}">
				<tr>
					<td><c:out value="${student.firstName}"/><c:out value="${student.lastName}"/></td>
 					<td><a href="/dorms/"/></td>
 				</tr>
			</c:forEach>
		</tbody>
	</table> 
</body>
</html>