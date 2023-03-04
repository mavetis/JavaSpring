<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page isErrorPage="true" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>All Students</title>
</head>
<body>
	<table>
		<thead>
			<tr>
				<th>First Name</th>
				<th>Last Name</th>
				<th>Age</th>
				<th>Address</th>
				<th>City</th>
				<th>State</th>	
				<th>Dorm</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${students}" var="student">
				<tr>
					<td>${student.firstName}</td>
					<td>${student.lastName}</td>
					<td>${student.age}</td>
					<td>${student.contact.address}</td>
					<td>${student.contact.city}</td>
					<td>${student.contact.state}</td>
					<td>${student.dorm.name}</td>
				</tr>
		<%-- 		<tr>
					<td><c:out value="${info.firstName}"></</c:out></td>
					<td><c:out value="${info.lastName}"></</c:out></td>
					<td><c:out value="${info.age}"></</c:out></td>
 				 	<td><c:out value="${info.contact.address}"></</c:out></td>
 					<td><c:out value="${info.contact.city}"></</c:out></td>
  					<td><c:out value="${info.contact.state}"></</c:out></td> 
 
				
				</tr> --%>
			
			</c:forEach>
		</tbody>
	</table>
</body>
</html>