<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/user-login-template/loginHeader.jsp">
	<jsp:param value="로그인" name="title"/>
</jsp:include>
	<section class="w-980">
		<div class="row login-page">
			<div class="row">
				<h1>비밀번호 찾기</h1>
			</div>
			<div class="row">
				아이디:<input type="text" name="userId">
			</div>
			<div class="row">
				이름:<input type="text" name="userName">
			</div>
			<div class="row">
				전화번호:<input type="tel" name="userTel">
			</div>
			<div class="row">
				<button id="pw-find" type="button">찾기</button>
			</div>
		</div>
		<div class="row login-page success-page">
			<h1>성공</h1>
			<div class="row">
				<p class="success"></p>
			</div>
			<div class="row">
				<button class="btn-login-move">로그인하러 가기</button>
				<button class="btn-back" type="button">이전</button>
			</div>
		</div>
		<div class="row login-page fail-page">
			<h1>실패</h1>
			<div>
				<button class="btn-back" type="button">이전</button>
			</div>
		</div>
	</section>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>