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
				<input type="password" name="userPw">
			</div>
			<div class="row">
				<input type="password" name="userPwFind">
			</div>
			<div>
				<button type="submit">변경</button>
			</div>
		</form>
	</section>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>