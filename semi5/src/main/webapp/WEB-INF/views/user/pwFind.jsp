<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/user-login-template/loginHeader.jsp">
	<jsp:param value="로그인" name="title"/>
</jsp:include>
	<section class="w-980">
		<div class="row login-page center">
			<div class="row mt-50">
				<h1>비밀번호 찾기</h1>
			</div>
			<div class="row mt-30">
				<input class="input-user" type="text" name="userId" placeholder="아이디를 입력해주세요">
			</div>
			<div class="row">
				<input class="input-user" type="text" name="userName" placeholder="이름을 입력해주세요">
			</div>
			<div class="row">
				<input class="input-user" type="tel" name="userTel" placeholder="전화번호를 입력해주세요">
			</div>
			<div class="row mt-30">
				<button class="btn btn-positive" id="pw-find" type="button">찾기</button>
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