<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Message</title>
</head>
<body>
	<p>${message}</p>
	<p><a href="${path}/user/list">List User</a></p>
	<p><a href="${path}/user/form">Add User</a></p>
	<p><a href="${path}/cliente/list">List Cliente</a></p>
	<p><a href="${path}/cliente/form">Add Cliente</a></p>
	<p><a href="${path}/servico/list">List Servico</a></p>
	<p><a href="${path}/servico/form">Add Servico</a></p>
	<p><a href="${path}/grupo/list">List Grupo</a></p>
	<p><a href="${path}/grupo/form">Add Grupo</a></p>
</body>
</html>