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
        	background:#e1e1e2;
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
         	border-radius: 13px;
			background: linear-gradient(315deg, #bfccc3, #e3f3e8);
			box-shadow:  -5px -5px 14px #c3d1c8,
            5px 5px 14px #e5f5ea;
         	
         	}
	</style>
</head>
<body>
<body>
	<div
		class="d-flex justify-content-center mt-5" style="font-family: 'Crimson Text', serif;">
		<h5 class="ms-5 me-5 text-center">
			Hey,
			
			<c:out value="${user.firstName}"></c:out>
			
		</h5>

		<a class="ms-5 px-3  pt-1 pb-1 text-decoration-none text-dark" id="neu-4" href="/logout">Logout</a>
	</div>
	<div class="container mt-5" style="font-family: 'Crimson Text', serif;">

		<div class="row">
			<div class="">
				<h5 class="text-center">Here are some of the events in your state:</h5>
				<table class="table mt-4">
					<thead>
						<tr>
							<th scope="col">Name</th>
							<th scope="col">Date</th>
							<th scope="col">Location</th>
							<th scope="col">State</th>
							<th scope="col">Host</th>
							<th scope="col">Action/ Status</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${instate_events}" var="event">
							<tr>
								<td><a href="/events/${event.id}">${event.name}</a></td>
								<td>${event.date}</td>
								<td>${event.location}</td>
								<td>${event.state}</td>
								<td>${event.host.firstName}</td>
								<c:if test="${user.id == event.host.id }">
									<td><a href="/events/${event.id}/edit">Edit <span>
										</span></a> | <a href="/events/${event.id}/delete"> Delete</a></td>

								</c:if>
								<c:choose>

									<c:when test="${event.host.id != user.id }">
										<c:set var="attending" value="null" />


										<c:forEach items="${event.attendees}" var="attendee">


											<c:if test="${attendee.id == user.id }">
												<c:set var="attending" value="true" />
											</c:if>
										</c:forEach>


										<c:if test="${attending.contains('null') }">
											<td><a href="/events/${event.id}/join">Join</a></td>
										</c:if>


										<c:if test="${attending == true}">
											<td><span>Joining</span> | <a
												href="/events/${event.id}/cancel">Cancel</a></td>
										</c:if>
									</c:when>
								</c:choose>
							</tr>
						</c:forEach>
					</tbody>
				</table>

			</div>
		</div>


		<div class="row">
			<div class="mt-5">
				<h5 class="text-center">Here are some of the events in other state:</h5>

				<table class="table mt-4">
					<thead>
						<tr>
							<th scope="col">Name</th>
							<th scope="col">Date</th>
							<th scope="col">Location</th>
							<th scope="col">State</th>
							<th scope="col">Host</th>
							<th scope="col">Action/ Status</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${outstate_events}" var="event">
							<tr>
								<td><a href="/events/${event.id}">${event.name}</a></td>
								<td>${event.date}</td>
								<td>${event.location}</td>
								<td>${event.state}</td>
								<td>${event.host.firstName}</td>
								<c:if test="${user.id == event.host.id }">
									<td><a href="/events/${event.id}/edit">Edit <span>
										</span></a> | <a href="/events/${event.id}/delete"> Delete</a></td>

								</c:if>
								<c:choose>

									<c:when test="${event.host.id != user.id }">
										<c:set var="attending" value="null" />


										<c:forEach items="${event.attendees}" var="attendee">


											<c:if test="${attendee.id == user.id }">
												<c:set var="attending" value="true" />
											</c:if>
										</c:forEach>


										<c:if test="${attending.contains('null') }">
											<td><a href="/events/${event.id}/join">Join</a></td>
										</c:if>


										<c:if test="${attending == true}">
											<td><span>Joining</span> | <a
												href="/events/${event.id}/cancel">Cancel</a></td>
										</c:if>
									</c:when>
								</c:choose>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
		<div class="row text-center">
			<div class="">
				<p class="">Create An Event</p>

				<p>
					<form:errors path="event.*" />
				</p>

				<form:form method="POST" action="/createEvent"
					modelAttribute="event">
					<p>
						<form:input class="bg-transparent border-0 text-center px-3 pt-1 pb-1" id="neu-3" type="text" path="name" placeholder="Event Name" />
					</p>
					<div class="">
						<!-- Date input -->
						<form:input path="date" id="date" name="date" type="date" class="mb-3 bg-transparent border-0 px-2 pt-1 pb-1" />
					</div>

					<p>
						<form:input class="bg-transparent border-0 text-center  px-3 pt-1 pb-1" type="text" path="location" placeholder="Location" id="neu-3"/>
					</p>
					<div class="mb-3">
						<form:select path="state" class="bg-transparent border-0 text-center  px-3 pt-1 pb-1" id="neu-3">
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
					<button type="submit" class="mb-5 px-3  pt-1 pb-1 border-0 text-dark" id="neu-2">Create</button>
				</form:form>
			</div>
		</div>
	</div>

</body>

</html>