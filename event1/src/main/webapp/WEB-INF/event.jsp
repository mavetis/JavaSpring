<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ page isErrorPage="true" %>  
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet"/> 
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css" />
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Marmelad&family=Nunito+Sans:wght@200&display=swap" rel="stylesheet">
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Oswald:wght@200&display=swap" rel="stylesheet">
	<style>
			body{
        	background: #dde1e7;
			background-repeat: no-repeat;
	 		background-size:100% 150%;	
 			}
			#neu-1 {
        	background: #dde1e7;
        	border-radius: 6px;
        	box-shadow: -3px -3px 7px #ffffffb2, 
         	3px 3px 5px rgba(94, 104, 121, 0.945);
      		}
	</style>
<title>Event</title>
</head>
<body>
	<div class="container">
		<h1> Welcome
			<c:out value="${user.firstName}"></c:out>
		</h1>
		
		<h3>Some events in your state</h3>
		<table class="table">
			<thead>
				<tr>
					<th scope="col">Name</th>
					<th scope="col">Date</th>
					<th scope="col">Location</th>
					<th scope="col">Host</th>
					<th scope="col">Action/Status</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="event" items="${eventsInState}">
				<tr>
					<th><a href="/events/${event.id}"><c:out value="${event.name}"/></a></th>
					<td><fmt:formatDate pattern ="MMMM dd, yyyy" value ="${event.date}"/></td>
			      <td><c:out value="${event.city}"/></td>
			      <td><c:out value="${event.host.firstName}"/></td>
			      <td>
			      	<c:choose>
			      		<c:when test="${event.host.id==user.id }">
		      				<a href="/events/${event.id }/edit">Edit</a>  
		      				<a href="/events/${event.id }/delete">Delete</a>
		      			</c:when>
		      			<c:otherwise>
		      				<c:choose>
		      					<c:when test="${event.attendees.contains(user) }">
		      						<span>Joined<a href="/events/${event.id}/cancel">Cancel</a></span>
		      					</c:when>
		      					<c:otherwise>
		      						<a href="/events/${event.id }/join">Join</a>
		      					</c:otherwise>
		      				</c:choose>
		      			</c:otherwise>
			      	</c:choose>
			      </td>
				</tr>
				</c:forEach>
			</tbody>
		</table>
		
		<h4>Here are some of the events in other states:</h4>
		<table class="table">
		  <thead class="thead-dark">
		    <tr>
		      <th scope="col">Name</th>
		      <th scope="col">Date</th>
		      <th scope="col">Location</th>
		      <th scope="col">Host</th>
		       <th scope="col">Action/Status</th>
		    </tr>
		  </thead>
		  <tbody>
			  <c:forEach var="e" items="${eventsOutState}">
			    <tr>
			      <th><a href="/events/${e.id}"><c:out value="${e.name}"/></a></th>
			      <td><fmt:formatDate pattern ="MMMM dd, yyyy" value ="${e.date}"/></td>
			      <td><c:out value="${e.city}"/></td>
			      <td><c:out value="${e.host.firstName}"/></td>
			      <td>
			      	<c:choose>
		      			<c:when test="${e.host.id==user.id}">
		      				<a href="/events/${e.id }/edit">Edit</a>
		      				<a href="/events/${e.id }/delete">Delete</a>
		      			</c:when>
		      			<c:otherwise>
		      				<c:choose>
		      					<c:when test="${e.attendees.contains(user)}">
		      						<span>Joined   <a href="/events/${event.id}/cancel">Cancel</a></span>
		      					</c:when>
		      					<c:otherwise>
		      						<a href="/events/${e.id}/join">Join</a>
		      					</c:otherwise>
		      				</c:choose>
		      			</c:otherwise>
		      		</c:choose>
			      </td>
			    </tr>
	    	  </c:forEach>
		  </tbody>
		</table>
		<div class="createEvent">
			<h3>Create an Event</h3>
			<p><form:errors path="event.*"/></p>
			<form:form method="post" action="/events/create" modelAttribute="event">
			<form:hidden path="host" value="${user.id}"/>
	            <form:errors path="name"/>
			<p>
	            <form:label class="col-sm-2 col-form-label" path="name">Event Name:</form:label>
	            <form:input class="form-control col-sm-6" type="text" path="name"/>
	        </p>
	        <p>
	        	<form:label class="col-sm-2 col-form-label" path="date">Date:</form:label>
	        	<form:input class="form-control col-sm-6" type="date" path="date"/>
	        <p>
	            <form:label class="col-sm-2 col-form-label" path="city">Location:</form:label>
	            <form:input class="form-control col-sm-6" type="text" path="city"/>
	        </p>
	        <p>
	            <form:label class="col-sm-2 col-form-label" path="state">State:</form:label>
	            <form:select path="state">
        			<c:forEach items="${states}" var="state">
            		<form:option value="${state}">${state}</form:option>
        			</c:forEach>
        		</form:select>
	        </p>
	        <input class="btn btn-warning" type="submit" value="Create"/>
	        </form:form>
		</div>
	</div>
</body>
</html>