<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/user-login-template/loginHeader.jsp">    
	<jsp:param value="메인화면" name="title"/>
</jsp:include>

	<section class="container mt-50">
		<div class="row mt-50 center">
			<h1>비밀번호 변경</h1>
		</div>
		<form action="changePw" method="post">
			<div class="row">
				<input class="change-input input-user" id="change-pw" type="password" name="userPw" placeholder="새 비밀번호">
				<span class="find-fail">사용할 수 없는 형식입니다.</span>
			</div>
			<div class="row">
				<input class="change-input input-user" id="change-pw-find" type="password" name="userPwFind" placeholder="비밀번호 확인">
				<span class="find-success">비밀번호가 일치합니다.</span>
				<span class="find-fail">비밀번호가 일치하지 않습니다.</span>	
			</div>
			<div>
				<button class="btn btn-positive" type="submit">변경</button>
			</div>
		</form>
	</section>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>