<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div>
		<div>
			<h1>로그인</h1>
		</div>
		<form action="login" method="post">
			<div>
				<input type="text" name="userId" placeholder="아이디">
			</div>
			<div>
				<input type="password" name="userPw" placeholder="비밀번호">
			</div>
			<div>
				<label>
				<input type="checkbox">
				아이디 저장
				</label>
			</div>
			<div>
				<button type="submit">로그인</button>
			</div>
		</form>
		<!-- 이상인 경우만 나오는 화면 -->
		<c:if test="${param.error != null}">
			<h2 style="color: red">입력한 정보가 맞지 않습니다</h2>
		</c:if>
	</div>
</body>
</html>