<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
 <%@ page isErrorPage="true" %>   
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet"/> 
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css" />
	<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
      rel="stylesheet"><title>New Dojo</title>
      <link rel="preconnect" href="https://fonts.googleapis.com">
	  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	  <link href="https://fonts.googleapis.com/css2?family=Josefin+Sans:wght@100&display=swap" rel="stylesheet">
	  
	  <style>
	  	body{
	  	background-color: #ccd6d3;
	  	}
	  </style>
<title>Ninjas</title>
</head>
<body>

<div class="container">
	<div class="row align-items-center vh-100 justify-content-center">
		<div class="card text-center fw-light border-0 rounded-3 shadow-lg bg-transparent" style="width:18rem;">
			<div class="card-body">
			<h1 class="card-title fw-light mb-2 border-0" style="font-family: 'Josefin Sans', sans-serif;">New Ninja</h1>
			<form:form action="/processNinja" method="post" modelAttribute="newNinja">
   			   <p>
   			   	<form:label  class="fw-light text-center mt-3 border-0 bg-transparent" style="font-family: 'Josefin Sans', sans-serif;" path="dojo">Select Dojo:</form:label>
   			   	<form:select  class="fw-light text-center mt-3 border-0 bg-transparent" style="font-family: 'Josefin Sans', sans-serif;" path="dojo">
   			   		<c:forEach items="${dojoList}" var="dojo">
   			   			<form:option value="${dojo.id}"><c:out value="${dojo.name}"></c:out></form:option>
   			   		</c:forEach>
   			   	</form:select>
   			   </p>
   			   <p>
   			   	<form:errors class="text-danger" style="font-family: 'Josefin Sans', sans-serif;" path="firstName"/>
   			   	<form:input  class="fw-light text-center mt-3 border-0 bg-transparent" style="font-family: 'Josefin Sans', sans-serif;" placeholder="Enter Name" path="firstName"/>	
   			   </p>
   			 	 <p>
   			 	  	<form:errors class="text-danger" style="font-family: 'Josefin Sans', sans-serif;" path="lastName"/>
   			   	<form:input  class="fw-light text-center mt-3 border-0 bg-transparent" style="font-family: 'Josefin Sans', sans-serif;" placeholder="Enter Last Name" path="lastName"/>	
   			   </p>
   			    <p>
   			     	<form:errors class="text-danger" style="font-family: 'Josefin Sans', sans-serif;" path="age"/>
   			   	<form:input  class="fw-light text-center mt-3 border-0 bg-transparent" style="font-family: 'Josefin Sans', sans-serif;" placeholder="Enter Age" path="age"/>	
   			   </p>
   			   <p class="label">
				<input  class="fw-light text-center mt-3 border-0 bg-transparent" style="font-family: 'Josefin Sans', sans-serif;" id="btn" type="submit" value="Create"/>
				</p>
			</form:form>	
 			</div>
		</div>
	</div>

</div>

</body>
</html>