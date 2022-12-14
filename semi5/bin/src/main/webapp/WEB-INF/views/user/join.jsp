<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/user-login-template/header.jsp">
	<jsp:param value="회원가입" name="title"/>
</jsp:include>
	<section class="w-980">
		<div class="row center">
			<h1>회원가입</h1>
		</div>
		<form action="">
			<div>
				<input type="text" name="userId" class="login-input" placeholder="아이디">
			</div>
			<div>
				<input type="password" name="userPw" class="login-input" placeholder="비밀번호">
			</div>
			<div>
				<input type="password" class="login-input" placeholder="비밀번호 확인">
			</div>
			<div>
				<input type="text" name="userName" class="login-input" placeholder="이름">
			</div>
			<div>
				<label>남자
					<input name="userGender" type="radio" value="남자">
				</label>
				<label>여자
					<input name="userGender" type="radio" value="여자">
				</label>
			</div>
			<div>
				<input name="userEmail" type="email" class="login-input" placeholder="이메일">
			</div>
			<div>
				<input name="userTel" type="tel" class="login-input" placeholder="전화번호">
			</div>
			<div>
				<input name="userBirth" type="date" class="login-input" placeholder="생년월일">
			</div>
			<div>
				<button class="btn btn-neutral login-btn" type="button">뒤로가기</button>
				<button class="btn btn-positive login-btn" type="submit">회원가입</button>
			</div>
		</form>
	</section>
<jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/template/footer.jsp"></jsp:include>
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
>>>>>>> refs/remotes/origin/main
