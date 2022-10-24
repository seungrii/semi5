<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/views/template/header.jsp">
	<jsp:param value="회원 가입" name="title"/>
</jsp:include>
	<section class="w-980 test-css">
		<div>
			<h1>로그인</h1>
		</div>
		<form action="login" method="post">
			<div>
				<input type="text" name="userId" placeholder="아이디">
			</div>
			<div>
				<input type="password" name="userPw" placeholder="비밀번호">
			</div>
			<div>
				<label>
					<input type="checkbox">
					아이디 저장
				</label>
				<label>
					<input type="checkbox">
					관리자 로그인
				</label>
			</div>
			<div>
				<button type="submit">로그인</button>
			</div>
		</form>
		<!-- 이상인 경우만 나오는 화면 -->
		<c:if test="${param.error != null}">
			<h2 style="color: red">입력한 정보가 맞지 않습니다</h2>
		</c:if>
	</section>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>