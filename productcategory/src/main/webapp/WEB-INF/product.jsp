   
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c" %>
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
<title>New Product</title>
<style>
 input {
  border-top-style: hidden;
  border-right-style: hidden;
  border-left-style: hidden;
  border-bottom-style: hidden;
/*   background-color: #eee;
 */}

.no-outline:focus {
  outline: none;
} 
</style>
</head>
<body>
	<div class="container">
		<h1 class="title text-center mb-2 py-5 fw-lighter text-center">New Product</h1>
		<div class="row">
			<div class="col d-flex justify-content-center">
				<div class="card text-center border-0 shadow-lg p-3 mb-5 bg-body rounded-pilled bg-transparent">
					<div class="card-body">
					<form:form action="/processProduct" method="post" modelAttribute="product">
					<h3>
						<form:errors path="name"/>
<%-- 						<form:label path="name"> Name: </form:label>
 --%>						<form:input class="no-outline text-center fs-4 fw-lighter bg-transparent" placeholder="Enter Name" path="name"/>
					</h3>
					<h3>
						<form:errors path="description"/>
<%-- 						<form:label path="description">Description:</form:label>
 --%>						<form:input class="no-outline text-center fs-4 fw-lighter bg-transparent px-3 mt-2" placeholder="Enter Description" path="description"/>
					</h3>
					<h3>
						<form:errors path="price"/>
<%-- 						<form:label path="price">Price:</form:label>
 --%>						<form:input class="no-outline text-center fs-4 fw-lighter bg-transparent px-3 mt-2" placeholder="Enter Price" path="price"/>
					</h3>
					 <input class="no-outline fw-lighter border-white shadow-lg bg-transparent bg-body px-2 pt-3 pb-3 mt-2 rounded-pill" type="submit" value="Create"/>
				</form:form>
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