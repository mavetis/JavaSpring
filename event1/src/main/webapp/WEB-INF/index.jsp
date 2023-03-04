<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
	<title>Welcome</title>
</head>
<body>

	<div class="container">
		<h1 class="display-2">Welcome</h1>
		<div class="register">
			<h3>Register</h3>
			<p><form:errors path="user.*"/></p>
	    
	    	<form:form method="POST" action="/registration" modelAttribute="user">

	        <p>
	            <form:label class="col-sm-4 col-form-label" path="firstName">First Name:</form:label>
	            <form:input class="form-control col-sm-6" type="text" path="firstName"/>
	        </p>
	        <p>
	            <form:label class="col-sm-4 col-form-label" path="lastName">Last Name:</form:label>
	            <form:input class="form-control col-sm-6" type="text" path="lastName"/>
	        </p>
	        <p>
	            <form:label class="col-sm-4 col-form-label" path="email">Email:</form:label>
	            <form:input class="form-control col-sm-6" type="email" path="email"/>
	        </p>
	        <p>
	            <form:label class="col-sm-4 col-form-label" path="city">City:</form:label>
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
	        <p>
	            <form:label  class="col-sm-4 col-form-label" path="password">Password:</form:label>
	            <form:password class="form-control col-sm-6" path="password"/>
	        </p>
	        <p>
	            <form:label class="col-sm-4 col-form-label" path="passwordConfirmation">Password Confirmation:</form:label>
	            <form:password class="form-control col-sm-6" path="passwordConfirmation"/>
	        </p>
	        <input class="btn btn-warning" type="submit" value="Register!"/>
	    </form:form>
		</div>
		<div class="login">
			<h3>Login</h3>
			    <p><c:out value="${error}" /></p>
		    <form method="post" action="/login">
		        <p>
		            <label class="col-sm-4 col-form-label" for="email">Email</label>
		            <input class="form-control col-sm-6" type="text" id="email" name="email"/>
		        </p>
		        <p>
		            <label class="col-sm-4 col-form-label" for="password">Password</label>
		            <input class="form-control col-sm-6" type="password" id="password" name="password"/>
		        </p>
		        <input class="btn btn-warning" type="submit" value="Login!"/>
		    </form>  
		</div>
	
	</div>


</body>
</html>