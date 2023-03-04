<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isErrorPage="true"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet"/> 
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css" />
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com">
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com">
	<link href="https://fonts.googleapis.com/css2?family=Crimson+Text:ital@1&display=swap" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css2?family=Crimson+Text&display=swap" rel="stylesheet">
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com">
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com">
	<link href="https://fonts.googleapis.com/css2?family=Shantell+Sans&display=swap" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css2?family=Marmelad&family=Nunito+Sans:wght@200&display=swap" rel="stylesheet">
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com">
	<link href="https://fonts.googleapis.com/css2?family=Oswald:wght@200&display=swap" rel="stylesheet">
	<style>
			body{
			background:absolute;
        	background: #e1e1e2;
			background-repeat: no-repeat;
	 		background-size:100% 150%;	
 			}
			#neu-1 {
        	background: #e1e1e2;
        	border-radius: 6px;
        	box-shadow: -3px -3px 7px #ffffffb2, 
         	3px 3px 5px rgba(94, 104, 121, 0.945);
      		}
      		#neu-2 {
        	background: #e1e1e2;
        	border-radius: 6px;
        	box-shadow: 0px 0px 5px #ffffffb2, 
         	10px 10px 10px rgba(98, 104, 121, 0.945);
      		}
      		#neu-3, #date {
            background: #e1e1e2;
       		border-radius: 6px;
        	box-shadow: inset -3px -3px 7px #ffffffb0, 
         	inset 3px 3px 5px rgba(94, 104, 121, 0.692);
         	}
         	#neu-4 {
         	border-radius: 50px;
			background: linear-gradient(145deg, #e2e6d8, #ffffff);
			box-shadow:  24px 24px 48px #646660,
             -24px -24px 48px #ffffff;
         	}
         	
         	#cards {
         	display: -webkit-flex;
         	display: -moz-flex;
         	display: -ms-flex;
         	display: -o-flex;
         	display: flex;
         	position: relative;
         	border-radius: 50px;
         	background: rgba(255, 255, 255, 0.05);
         	box-shadow: 0 10px 25px rgba(0, 0, 0, 0.2);
         	backdrop-filter: blur(15px);
         	}
         	
         	.card {
 			background:#e1e1e2;
 			border-radius: 50px;
 			box-shadow:rgba(0, 0, 0, 0.17) 0px -23px 25px 0px inset, 
 					   rgba(0, 0, 0, 0.15) 0px -36px 30px 0px inset,
 					   rgba(0, 0, 0, 0.1) 0px -79px 40px 0px inset,
 					   rgba(0, 0, 0, 0.06) 0px 2px 1px,
 					   rgba(0, 0, 0, 0.09) 0px 4px 2px,
 					   rgba(0, 0, 0, 0.09) 0px 8px 4px,
 					   rgba(0, 0, 0, 0.09) 0px 16px 8px,
 					   rgba(0, 0, 0, 0.09) 0px 32px 16px;
}
	</style>
<title>${event.name}</title>
</head>
<body>
	<nav> 
		<div class="navbar mt-5 pe-5 me-5">
			<div class="container-fluid" style="font-family: 'Crimson Text', serif;"> 
				<a class="ms-5 px-3 pt-1 pb-1 text-decoration-none text-dark" style="font-family: 'Crimson Text', serif;" id="neu-4" href="/events">Events Page</a>
				Hey, <c:out value="${user.firstName}"></c:out>
				<a class="ms-5 px-3 pt-1 pb-1 text-decoration-none text-dark" style="font-family: 'Crimson Text', serif;" id="neu-4" href="/logout">Logout</a>
			</div>
		</div>
	</nav>
	<div class="container mt-5" style="font-family: 'Crimson Text', serif;">
		<h2 class="text-center">${event.name}</h2>
							<p class="text-center">
								<c:out value="${(event.attendees).size()}"></c:out>  guests
							</p>						
		<div class="container">
			<div class="row">
				<div class="col">
					<table class="table table-borderless">
						<thead>
							<tr>
								<th>Host</th>
								<th>Date</th>
								<th>Location</th>
							</tr>
						</thead>
						<tbody>
							<tr>
							<td>	
								<c:out value="${event.host.firstName}"></c:out>
								<c:out value="${event.host.lastName}"></c:out>
							</td>
							<td><c:out value="${event.date}"></c:out></td>
							<td><c:out value="${event.location}"></c:out>, <c:out value="${event.state}"></c:out></td>
							</tr>
							
						</tbody>
					
					</table>
				
				</div>
				<div class="col">
					<h4 class="text-center">Event Messages</h4>
					<div class="card border-0 text-center">
						<div class="card-body">
								<c:forEach items="${messages}" var="message">
							<p>••• Message from: <c:out value = "${message.user.firstName}"></c:out> ••• <c:out value = "${message.message}"></c:out></p>
						</c:forEach>
						</div>
					
					</div>
					<div class="">
						<form method= "POST" action="/events/${event.id}/addMessage">
						<div class="text-center">
							<textarea name = "message" class="form-control text-center border-0 mt-5" id="cards"
								rows="3" placeholder="add a comment"></textarea>
						</div>
						<div class="d-flex justify-content-center">
							<button type="submit" class="mt-3 ms-5 px-3 pt-1 pb-1 border-0" id="neu-4">Submit</button>
						</div>
					</form>
					</div>
			
				</div>

			</div>
		</div>
	</div>

</body>
</html>