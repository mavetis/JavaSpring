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
			background-color:#dde1e7;  
			background-repeat: no-repeat;
	 		background-size:100% 150%;	
 			}
 			#neu-1 {
        	background: #dde1e7;
        	border-radius: 6px;
        	box-shadow: -3px -3px 7px #ffffffb2, 
         	3px 3px 5px rgba(94, 104, 121, 0.945);
      		}
      		#neu-2 {
            background: #dde1e7;
       		border-radius: 6px;
        	box-shadow: inset -3px -3px 7px #ffffffb0, 
         	inset 3px 3px 5px rgba(94, 104, 121, 0.692);
      }
 		<
			.material-symbols-outlined {
  			font-variation-settings:
  			'FILL' 0,
  			'wght' 400,
  			'GRAD' 0,
  			'opsz' 48
			}
			
	

	</style>
<title>Show</title>
</head>
<body>
	<div class="container text-center mb-5 pb-5">
			<h1 class="mt-5 pt-5 mb-5 fw-light" style="font-family: 'Oswald', sans-serif;">${ question.question }?</h1>
	
		<div class="row">
			<div class="col mb-3">
				<div class="form-floating">
					<h3 class="text-end me-5 fw-lighter" style="font-family: 'Oswald', sans-serif;">Tags:</h3>
				</div>
			</div>
			<div class="col mb-3">
				<div class="form-floating">
					<ul class="list-group list-group-horizontal list-unstyled">
						<c:forEach items="${ question.tags }" var="tag">
						<li class="list-group-item rounded-pill fw-lighter" style="font-family: 'Oswald', sans-serif;" id="neu-2">${ tag.subject }</li>
						</c:forEach>
					</ul>
				</div>
			</div>		
		</div>
		<div class="row">
			<div class="col mb-3">
				<div class="form-floating">
					<h3 class="text-end me-5 fw-lighter">Answers:</h3>
				</div>
			</div>
			<div class="col mb-3">
				<div class="form-floating">
					<ul class="list-group list-group-vertical list-unstyled">
						<c:forEach items="${ question.answers }" var="answer">
						<li class="list-group-item mb-2 rounded-pill text-break fw-lighter" id="neu-1">${ answer.answer }</li>		
						</c:forEach>
					</ul>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col">
				<div class="form-floating">
					<h3 class="text-end me-5 fw-lighter">Add your answer:</h3>
				</div>	
			</div>
			<div class="col">
				<div class="form-floating">
					<form:form action="/questions/answers" method="post" modelAttribute="ans">
			 		<div class="form-group">
	        		<form:errors path="answer"/>
		        		<form:textarea id="neu-1" class="form-control text-center p-5 fw-lighter" placeholder="click" path="answer"></form:textarea>
		            	<input class="btn bg-transparent mt-3" id="neu-1" type="submit"/>
		 				
		            	
		    		</div>
		    		<form:hidden path="question" value="${ question.id }"/>
					</form:form>
				</div>
			</div>
		</div>
	
	</div>
</body>
</html>