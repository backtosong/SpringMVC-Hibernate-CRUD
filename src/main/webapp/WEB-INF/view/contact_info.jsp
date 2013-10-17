<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<title>Spring 3 MVC</title>
	<style type="text/css">
		body {
			font-family: sans-serif;
		}
	</style>
</head>
<body>
	
<h2>Contact Update</h2>

<form method="post" action="update" commandName="contact" >
	<input name="id" type="hidden" value="${contact.id}"/>
	<table>
	<tr>
		<td>FIRSTNAME</td>
		<td><input name="firstname" value="${contact.firstname}"/></td> 
	</tr>
	<tr>
		<td>LASTNAME</td>
		<td><input name="lastname" value="${contact.lastname}"/></td>
	</tr>
	<tr>
		<td>EMAIL</td>
		<td><input name="email" value="${contact.email}"/></td>
	</tr>
	<tr>
		<td>TELEPHONE</td>
		<td><input name="telephone" value="${contact.telephone}"/></td>
	</tr>
	<tr>
		<td>
			<input type="submit" value="UpdateContact" />
		</td>
	</tr>
</table>	
</form>

</body>
</html>
