<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isErrorPage="true" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" 
	integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css" />
	<link rel="stylesheet" href="/css/main.css"/>
	<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
      rel="stylesheet">
<title>New License</title>
</head>
<body class="body">
	<h2 class="itle text-center py-5 fw-lighter text-center">New License</h2>
	<div class="container">
		<div class="row">
			<div class="col d-flex justify-content-center">
				<div class="card m2 cb1 text-center">
					<div class="card-body">
						<form:form action="/addLicense" method="post" modelAttribute="license">
								<p class="fw-lighter">
									<form:label class="" path="person">Person:</form:label>
									<form:select class="px-3 mt-2 border-0 rounded-pill shadow-lg  text-center text-white bg-transparent fw-lighter" path="person">
										<c:forEach items="${personList}" var="per">
											<form:option value="${per.perId}"><c:out value="${per.firstName} ${per.lastName}"/></form:option>
										</c:forEach>
									</form:select>	
								</p>	
								<p class="fw-lighter">
									<form:label path="state">State:</form:label>
									<form:select class="px-3 mt-2 border-0 rounded-pill  shadow-lg text-center text-white bg-transparent fw-lighter" path="state">
										<c:forEach items="${states}" var="state">
											<form:option value="${state}"><c:out value="${state}"/></form:option>
										</c:forEach>
									</form:select>
								</p>
								<p class="fw-lighter">
									<form:label path="expirationDate">Expiration Date:</form:label>
									<form:input class="px-3 mt-2 border-0 rounded-pill  shadow-lg text-center text-white bg-transparent fw-lighter" type="date" path="expirationDate"/>
								</p>
								<p class="">
									<input class="btn btn-outline-light text-white mt-3" type="submit" value="Create"/>
								</p>
						</form:form>
						<form:errors cssClass="red" path="license.*"/>
					</div>
				</div>
			</div>
		</div>
		
	</div>
</body>
</html>