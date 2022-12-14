<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/views/user-login-template/loginHeader.jsp">
	<jsp:param value="로그인" name="title"/>
</jsp:include>
	<section class="w-980">
		<div class="row center mt-50">
			<h1>로그인</h1>
		</div>
		<div class="">
			<form action="login" method="post">
			<div class="row">
				<label> 
					<input type="radio" name="rank" value="off" checked> 
					회원 로그인
				</label>
				<label> 
					<input type="radio" name="rank" value="on">
					관리자 로그인
				</label>
			</div>
			<div class="row">
				<input type="text" name="userId" class="login-input" placeholder="아이디">
			</div>
			<div class="row">
				<input type="password" name="userPw" class="login-input" placeholder="비밀번호">
			</div>
			<div class="row">
				<label>
					<input type="checkbox">
					아이디 저장
				</label>
			</div>
			<div class="row">
				<button type="submit" class="btn btn-positive login-btn">로그인</button>
				<div class="row">
					<a href="idFind">아이디 찾기</a>
					/
					<a href="pwFind">비밀번호 찾기</a>
				</div>
			</div>
		</form>
	</div>
		<!-- 이상인 경우만 나오는 화면 -->
		<div class="row center">
			<c:if test="${param.error != null}">
				<h2 style="color: red">입력한 정보가 맞지 않습니다</h2>
			</c:if>
		</div>
	</section>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>