<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/user-login-template/loginHeader.jsp">    
	<jsp:param value="메인화면" name="title"/>
</jsp:include>

	<section class="w-980">
		<div class="row mt-20 center">
			<h1>비밀번호 변경</h1>
		</div>
		<form action="changePw" method="post">
			<div class="row">
				<input class="change-input" id="change-pw" type="password" name="userPw">
				<span class="find-fail">사용할 수 없는 형식입니다.</span>
			</div>
			<div class="row">
				<input class="change-input" id="change-pw-find" type="password" name="userPwFind">
				<span class="find-success">비밀번호가 일치합니다.</span>
				<span class="find-fail">비밀번호가 일치하지 않습니다.</span>	
			</div>
			<div>
				<button type="submit">변경</button>
			</div>
		</form>
	</section>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>