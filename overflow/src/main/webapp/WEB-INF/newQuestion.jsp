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
      		#neu-2 {
            background: #dde1e7;
       		border-radius: 6px;
        	box-shadow: inset -3px -3px 7px #ffffffb0, 
         	inset 3px 3px 5px rgba(94, 104, 121, 0.692);
      }
	</style>
<title>New Question</title>
</head>
<body>
<div class="container text-center">
	<h1 class="title text-center pt-5 fw-lighter" style="font-family: 'Oswald', sans-serif;">What is your question?</h1>
	<div class="row">
		<div class="col mt-5 d-flex justify-content-center">
			<div id="neu-2" class="card text-center border-0">
				<div class="card-body">
					<form:form action="/questions/process" method="post" modelAttribute="addQuestion">
						<p class="fw-lighter">
<%-- 							<form:label path="question">Question:</form:label>
 --%>							<form:textarea class="px-5 pt-2 pb-2 bg-transparent text-center fw-lighter border-0 rounded-pill" style="font-family: 'Oswald', sans-serif;"  placeholder="Write your question" path="question"></form:textarea>
							<form:errors path="question"/>
						</p>
						<p class="fw-lighter">
<%-- 							<form:label path="tags">Tags:</form:label>
 --%>							<form:input class="px-5 pt-2 pb-2 bg-transparent text-center fw-lighter border-0 rounded-pill" style="font-family: 'Oswald', sans-serif;" placeholder="enter tags" path="tags"/>
							<form:errors path="tags"/>
						</p>
						<p class="fw-lighter">
							<input id="neu-1" class="no-outline fw-lighter border-0" style="font-family: 'Oswald', sans-serif;" type="submit" value="Create"/>
						</p>
							 	
					</form:form>
					<div>
						<form:errors path="addQuestion.*"/>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
	
	
	
	
</body>
</html>