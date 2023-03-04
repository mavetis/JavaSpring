<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page isErrorPage="true" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Dashboard</title>
</head>
<body>
	<h2>Question Board</h2>
	<div>
		<table>
			<thead>
				<tr>
					<th>Questions</th>
					<th>Tags</th>
				</tr>
			</thead>
			
			<tbody>
				<c:forEach items="${questions}" var ="q">
					<tr>
						<td><a href="/questions/${question.id}"><c:out value="${question.question}"/></a></td>
						<td><c:forEach var="tag" items="${question.tags}">
							<c:out value="${tag.tag}"/></c:forEach></td>
 					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	<div>
		<a href="/questions/new">New Question</a>
	</div>
</body>
</html>