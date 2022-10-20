<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
</head>
<body>
	<div>
		<div>
			<h1>회원가입</h1>
		</div>
		<form action="">
			<div>
				<input type="text" name="userId" placeholder="아이디">
			</div>
			<div>
				<input type="password" name="userPw" placeholder="비밀번호">
			</div>
			<div>
				<input type="password" placeholder="비밀번호 확인">
			</div>
			<div>
				<input type="text" name="userName" placeholder="이름">
			</div>
			<div>
				<label>남자
					<input name="userGender" type="radio">
				</label>
				<label>여자
					<input name="userGender" type="radio">
				</label>
			</div>
			<div>
				<input name="userEmail" type="email" placeholder="이메일">
			</div>
			<div>
				<input name="userTel" type="tel" placeholder="전화번호">
			</div>
			<div>
				<input name="userBirth" type="date" placeholder="생년월일">
			</div>
			<div>
				<button type="submit">회원가입</button>
				<button type="submit">뒤로가기</button>
			</div>
		</form>
	</div>
</body>
</html>