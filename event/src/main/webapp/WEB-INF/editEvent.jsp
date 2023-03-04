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
      		#neu-3 {
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
         	width: 30%;
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
         	
	</style>
<title>Events</title>
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

	<div class="mt-5 pt-5 container d-flex justify-content-center" style="font-family: 'Crimson Text', serif;">
		<div id="cards" class="card border-0 text-center" >
			<div class="card-body">
					<h2 class = "">${event.name}</h2>
			
			<h5>Edit Event</h5>
			<form:form method="POST" action="/editEvent/${event.id}" modelAttribute="event">
			<p>
				<form:input id="neu-3" class="bg-transparent border-0 border text-center" type="text" path="name" placeholder="Event Name" />
			</p>
			<div>
				<!-- Date input -->
				<form:input class="bg-transparent border-0 text-center" path="date" id="neu-3" name="date"
					 type="text" />
			</div>

			<p>
				<form:input id="neu-3" class="bg-transparent border-0 text-center" type="text" path="location" placeholder="Location" />
			</p>
			<div class="">
				<form:select id="neu-3" path="state" class="bg-transparent border-0 text-center">
				    <option selected>Select State</option>
					<option value="AL">AL</option>
					<option value="AK">AK</option>
					<option value="AR">AR</option>
					<option value="AZ">AZ</option>
					<option value="CA">CA</option>
					<option value="CO">CO</option>
					<option value="CT">CT</option>
					<option value="DC">DC</option>
					<option value="DE">DE</option>
					<option value="FL">FL</option>
					<option value="GA">GA</option>
					<option value="HI">HI</option>
					<option value="IA">IA</option>
					<option value="ID">ID</option>
					<option value="IL">IL</option>
					<option value="IN">IN</option>
					<option value="KS">KS</option>
					<option value="KY">KY</option>
					<option value="LA">LA</option>
					<option value="MA">MA</option>
					<option value="MD">MD</option>
					<option value="ME">ME</option>
					<option value="MI">MI</option>
					<option value="MN">MN</option>
					<option value="MO">MO</option>
					<option value="MS">MS</option>
					<option value="MT">MT</option>
					<option value="NC">NC</option>
					<option value="NE">NE</option>
					<option value="NH">NH</option>
					<option value="NJ">NJ</option>
					<option value="NM">NM</option>
					<option value="NV">NV</option>
					<option value="NY">NY</option>
					<option value="ND">ND</option>
					<option value="OH">OH</option>
					<option value="OK">OK</option>
					<option value="OR">OR</option>
					<option value="PA">PA</option>
					<option value="RI">RI</option>
					<option value="SC">SC</option>
					<option value="SD">SD</option>
					<option value="TN">TN</option>
					<option value="TX">TX</option>
					<option value="UT">UT</option>
					<option value="VT">VT</option>
					<option value="VA">VA</option>
					<option value="WA">WA</option>
					<option value="WI">WI</option>
					<option value="WV">WV</option>
					<option value="WY">WY</option>
				</form:select>
			</div>
			<button type="submit" class="border-0 mt-3" id="neu-4">Update!</button>
			</form:form>
			</div>
		</div>
		
	</div>

</body>

</html>