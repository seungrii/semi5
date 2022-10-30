<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/user-login-template/loginHeader.jsp">
	<jsp:param value="로그인" name="title"/>
</jsp:include>
	<section class="w-980">
		<div class="row mt-20 center">
			<h1>개인정보 수정</h1>
		</div>
		<form action="#"  method="post">
			<div class="row">
				<input type="hidden" name="userId" value="${userDto.userId}" >
			</div>
			<div class="row">
				<input type="email" name="userEmail" value="${userDto.userEmail}">
			</div>
			<div class="row">
				<input type="tel" name="userTel" value="${userDto.userTel }" >
			</div>
			<div>
				<button type="submit">확인</button>
			</div>
		</form>
	</section>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>