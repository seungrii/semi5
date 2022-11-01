<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/user-login-template/loginHeader.jsp">
	<jsp:param value="로그인" name="title"/>
</jsp:include>
	<section class="container">
		<div class="row login-page mt-50">
			<div class="row left mt-50">
				<h1>아이디 찾기</h1>
			</div>
			<div class="row">
				이름 <input class="input-user" type="text" name="userName">
			</div>
			<div class="row">
				전화번호 <input class="input-user" type="tel" name="userTel">
			</div>
			<div class="row">
				<button class="btn btn-positive" id="id-find" type="button">확인</button>
			</div>
		</div>
		<div class="row login-page success-page">
			<div class="row left">
				<h1>아이디 찾기</h1>
			</div>
			<div class="row">
				<p class="success"></p>
			</div>
			<div class="row">
				<button class="btn-back">이전</button>
				<button class="btn-login-move">로그인</button>
			</div>
		</div>
		<div class="row login-page fail-page">
			<div class="row left">
				<h1>아이디 찾기</h1>
			</div>
			<h1>실패</h1>
			<button class="btn-back">이전</button>
		</div>
	</section>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>