<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>New Question</title>
</head>
<body>
	<h1>Question Dashobard</h1>
	<table>
		<thead>
			<tr>
				<th>Questions</th>
				<th>Tags</th>
			</tr>
		</thead>
		<c:forEach items="${questions}" var="question">
			<tr>
				<td><a href="/${question.id}">${question.question}</a></td>
				<td><c:forEach items="${question.tags}" var="tag">
						<span>${tag.subject}<c:if test="${ question.tags.indexOf(tag) != question.tags.size() - 1 }">, </c:if></span>
					</c:forEach>
				</td>
			</tr>
		</c:forEach>
		
	</table>
	<a href="/questions/new">New Question</a>
</body>
</html>