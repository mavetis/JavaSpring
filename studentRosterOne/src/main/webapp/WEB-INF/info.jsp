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
	
	<style>
		body{
		background-color:#e6e7ee;  
		background-repeat: no-repeat;
	 	background-size:100% 140%;
		}
	
	</style>
<title>Information</title>
</head>
<body>
	<div class="container">
	<h2 class="title text-center py-5 fw-lighter">Student Information</h2>
	
		<div class="row">
			<div class="col d-flex justify-content-evenly">
				<div class="card text-center border-white shadow-lg p-3 mb-5 bg-body rounded-pilled bg-transparent">
					<div class="card-body bg-transparent">
					<form:form action="/processInfo" method="post" modelAttribute="a">
						<p class="">
							<form:label class="px-3 mt-2 border-0 rounded-pill fw-lighter" path="student">Student:</form:label>
							<form:select class="px-3 mt-2 border-0 rounded-pill bg-transparent fw-lighter" path="student">
								<c:forEach items="${studentList}" var="std">
									<form:option value="${std.sId}"><c:out value="${std.firstName} ${std.lastName}"/></form:option>
								</c:forEach>
							</form:select>	
						</p>
						<p class="">
							<form:label class="px-3 mt-2 border-0 rounded-pill fw-lighter" path="address">Address:</form:label>
							<form:input class="px-3 mt-2 border-0 rounded-pill text-center bg-transparent fw-lighter" placeholder="Enter" path="address"/>
							
						</p>
						<p class="">
							<form:label class="px-3 mt-2 border-0 rounded-pill fw-lighter" path="city">City:</form:label>
							<form:input class="px-3 mt-2 border-0 rounded-pill text-center bg-transparent fw-lighter" placeholder="Enter" path="city"/>
							
						</p>		
						<p class="fw-lighter text-center">
							<form:label class="px-3 mt-2 border-0 rounded-pill fw-lighter" path="state">State:</form:label>
							<form:select class="px-3 mt-2 border-0 rounded-pill text-center bg-transparent fw-lighter" path="state">
								<c:forEach items="${states}" var="state">
									<form:option value="${state}"><c:out value="${state}"/></form:option>
								</c:forEach>
						</form:select>
			</p>
			
			<p class="label">
				<input class="px-3 mt-2 border-0 rounded-pill text-center bg-transparent fw-lighter" id="btn" type="submit" value="Create"/>
			</p>
		</form:form>
		<form:errors cssClass="red" path="info.*"/>
					
					</div>
				</div>
			</div>
		
		</div>
		
	</div>
</body>
</html>