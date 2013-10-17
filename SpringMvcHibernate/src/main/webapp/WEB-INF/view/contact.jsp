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
		.data, .data td {
			border-collapse: collapse;
			width: 100%;
			border: 1px solid #aaa;
			margin: 2px;
			padding: 2px;
		}
		.data th {
			font-weight: bold;
			background-color: #5C82FF;
			color: white;
		}
	</style>
	
<script type="text/javascript" src="js/jquery-1.8.0.min.js"></script>
<script type="text/javascript">	
function del(id) {
	if (confirm("确定删除？")) {
		$.ajax( {
			type : "POST",
			url : "delete?id=" + id,
			dataType : "json",
			success : function(data) {
				if (data.del == "true") {
					$("#" + id).remove();
					alert("删除成功！");

				} else {
					alert("删除失败！");
				}
			},
			error : function() {
				alert("网络连接出错！");
			}
		})
	}
}
</script>
</head>
<body>
	
<h2>Contact Manager</h2>

<form method="post" action="add" commandName="contact" >

	<table>
	<tr>
		<td>FIRSTNAME</td>
		<td><input name="firstname" /></td> 
	</tr>
	<tr>
		<td>LASTNAME</td>
		<td><input name="lastname" /></td>
	</tr>
	<tr>
		<td>EMAIL</td>
		<td><input name="email" /></td>
	</tr>
	<tr>
		<td>TELEPHONE</td>
		<td><input name="telephone" /></td>
	</tr>
	<tr>
		<td>
			<input type="submit" value="addcontact" />
		</td>
	</tr>
</table>	
</form>

	
<h3>Contacts</h3>

<table class="data">
<tr>
	<th>Name</th>
	<th>Email</th>
	<th>Telephone</th>
	<th>&nbsp;</th>
</tr>
<c:forEach items="${contactList}" var="contact" >
	<tr id="<c:out value="${contact.id}"/>">
		<td>${contact.lastname}, ${contact.firstname} </td>
		<td>${contact.email}</td>
		<td>${contact.telephone}</td>
		<td>
		<input type="button" onclick='del(<c:out value="${contact.id}"/>)' value="del" />
		<input type="button"  value="edit" onclick="window.location.href='editredirect/${contact.id}'"/>
		</td>
	</tr>
</c:forEach>
</table>

</body>
</html>
