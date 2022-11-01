<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/views/user-login-template/loginHeader.jsp">
	<jsp:param value="로그인" name="title"/>
</jsp:include>
	<section class="w-980">
		<div class="row mt-20">
			<h1>회원탈퇴</h1>
		</div>
		<div class="row center mt-50">
			<h2>비밀번호 확인</h2>
		</div>
		<form action="delete" method="post">
			<div class="row">
				<input class="input-user" type="password" name="userPw" placeholder="비밀번호 입력">
			</div>
			<div class="row">
				<button class="btn btn-positive" type="submit">삭제</button>
			</div>
		</form>
		<div class="row center">
			<c:if test="${param.error != null}">
				<h2 style="color: red">입력한 정보가 맞지 않습니다</h2>
			</c:if>
		</div>
	</section>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>