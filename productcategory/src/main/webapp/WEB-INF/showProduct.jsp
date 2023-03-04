<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
	<style>
		body{
			background-color:#e6e7ee;  
			background-repeat: no-repeat;
	 		background-size:100% 150%;	
 			}

	</style>
	<title><c:out value="${product.name}"/></title>
</head>
<body>
	<div class="container text-center">
		<h2 class="title text-center pt-5 fw-lighter">Product Name</h2>
		<div class="row">
		<h4 class="mb-5" style="font-family: 'Marmelad', sans-serif;"><c:out value="${product.name}"/></h4>
			<div class="col d-flex justify-content-center">
				<div class="card text-center border-0 shadow-lg p-3 mb-5 bg-body rounded-pilled bg-transparent">
					<div class="card-body">
					
						<h5 class="fw-lighter">Categories:</h5>
							<c:forEach items="${product.categories}" var="cat">
							<p style="font-family: 'Marmelad', sans-serif;"><c:out value="${cat.name}"/></p>
							</c:forEach>
							<form:form action="/attachCategory" method="post" modelAttribute="catPro">
						<p class="fw-lighter">
							<form:label path="category">Add Category:</form:label>
							<form:select path="category" class="border-0 bg-transparent text-center fw-lighter">
								<c:forEach items="${categories}" var="cat">
									<form:option value="${cat.id}"><c:out value="${cat.name}"/></form:option>
								</c:forEach>
							</form:select>
						</p>
						<form:hidden path="product" value="${product.id}" />
			    		
			    		<input class="no-outline fw-lighter border-0 shadow-lg bg-transparent bg-body px-2 pt-3 pb-3 mt-2 rounded-pill" type="submit" value="Create"/>
						</form:form>
						<p class="px-3 mt-3">						
							<a class="fw-lighter px-3 mt-2 text-decoration-none" href="/products/new">New Product</a>
						</p>
						<p class="px-3 mt-3">						
							<a class="fw-lighter px-3 mt-2 text-decoration-none" href="/categories/new">New Category</a>
						</p>
					</div>	
			
					
				</div>
			</div>
		
		</div>
	</div>
</body>
</html>