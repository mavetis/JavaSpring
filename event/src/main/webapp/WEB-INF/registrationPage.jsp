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
	<link href="https://fonts.googleapis.com/css2?family=Shantell+Sans&display=swap" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css2?family=Marmelad&family=Nunito+Sans:wght@200&display=swap" rel="stylesheet">
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com">
	<link href="https://fonts.googleapis.com/css2?family=Oswald:wght@200&display=swap" rel="stylesheet">
	<style>
			body{
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
      		
      		#password{
      		background: #e1e1e2;
        	border-radius: 6px;
        	box-shadow: -3px -3px 7px #ffffffb2, 
         	3px 3px 5px rgba(94, 104, 121, 0.945);
      		}
      		#name{
      		background: #e1e1e2;
        	border-radius: 6px;
        	box-shadow: -3px -3px 7px #ffffffb2, 
         	3px 3px 5px rgba(94, 104, 121, 0.945);
      		}
	</style>
<title>Welcome</title>
</head>
<body>
 
    <div class="container">
      <div class="row mt-5">
        <div class="col text-center" style="font-family: 'Shantell Sans', cursive;">


          <p>Registration</p>

          <p class="">
            <form:errors path="user.*" />
          </p>

          <form:form method="POST" action="/registration" modelAttribute="user">
            <p>
              <form:input class="text-center bg-transparent border-0 px-3 pt-2 pb-2 fw-light" id="neu-1" type="text" path="firstName" placeholder="First Name" />
            </p>
            <p>
              <form:input class="text-center bg-transparent border-0  px-3 pt-2 pb-2 fw-light" id="neu-1" type="text" path="lastName" placeholder="Last Name" />
            </p>
            <p>
              <form:input class="text-center bg-transparent border-0  px-3 pt-2 pb-2 fw-light" id="neu-1" type="email" path="email" placeholder="Email" />
            </p>
            <p>
              <form:input class="text-center bg-transparent border-0  px-3 pt-2 pb-2 fw-light" id="neu-1" type="text" path="location" placeholder="Location" />
            </p>
            <form:select path="state" class="text-center bg-transparent border-0 fw-lighter px-3 pt-2 pb-2 mb-3" id="neu-1">
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
            <p>
              <form:password class="text-center bg-transparent border-0 fw-light  px-3 pt-2 pb-2" id="neu-1" path="password" placeholder="password" />
            </p>
            <p>
              <form:password class="text-center bg-transparent border-0 fw-light  px-3 pt-2 pb-2" id="neu-1" path="passwordConfirmation" placeholder="confirm password" />
            </p>
            <button type="submit" class="no-outline bg-transparent fw-light border-0 px-3 pt-2 pb-2" id="neu-2">Register</button>
          </form:form>
        </div>


        <div class="col text-center" style="font-family: 'Shantell Sans', cursive;">
          <p class="">Login</p>
          <p class = "">
            <c:out value="${error}" />
          </p>
          <form method="post" action="/login">
            <p>
              <input class="text-center bg-transparent border-0 fw-light px-3 pt-2 pb-2" type="text" id="name" name="email" placeholder="email" />
            </p>
            <p>
               <input class="text-center text-center bg-transparent border-0 fw-light  px-3 pt-2 pb-2" type="password" id="password" name="password" placeholder="password" />
            </p>
            <button type="submit" class="no-outline bg-transparent fw-light border-0 px-3 pt-2 pb-2" id="neu-2">Log In</button>
          </form>
        </div>
      </div>
    </div>

</body>


</html>