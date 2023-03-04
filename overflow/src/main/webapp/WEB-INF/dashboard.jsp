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
<title>Dashboard</title>
</head>
<body>
	<div class="container text-center mb-5 pb-5">
		
		<h1 class="title text-center pt-5 fw-lighter" style="font-family: 'Oswald', sans-serif;">Questions Dashboard</h1>
		<div class="row text-center me-5 pe-5">
			<table  class="table table-borderless mt-5">
			<thead>
				<tr>
					<th class="text-center fw-light" scope="col" style="font-family: 'Oswald', sans-serif;">Question</th>
					<th class="text-center fw-light" scope="col" style="font-family: 'Oswald', sans-serif;">Tags</th>
				</tr>
			</thead>
			
			<tbody>
				<c:forEach items="${questions}" var="q">
					<tr>
			      <td class="fw-lighter text-decoration-none"><a class="text-decoration-none" style="font-family: 'Oswald', sans-serif;" href="questions/${q.id}">${q.question}</a></td>
			      <td class="fw-lighter">
			      	<c:forEach items="${q.tags}" var="tag">
						<span>${ tag.subject }<c:if test="${ question.tags.indexOf(tag) != question.tags.size() - 1 }">,</c:if></span>	
						
						</c:forEach>
			      </td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	
		</div>
		<p class="mt-5">
			<a id="neu-1" class=" px-3 pt-3 pb-3 no-outline text-decoration-none fw-lighter" style="font-family: 'Oswald', sans-serif;"  href="/questions/new">New Question</a>
		</p>
	</div>
	
	
</body>
</html>