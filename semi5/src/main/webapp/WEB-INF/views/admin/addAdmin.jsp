<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>계정 추가</title>
</head>
<body>
	<form action="addAdmin" method="post">
		<input name="adminId" type="text" required autocomplete="name">
		<input name="adminPw" type="password" required autocomplete="name">
		<input name="EmployeeNo" type="number" required autocomplete="name">
		<button type="submit">추가</button>
	</form>
</body>
</html>