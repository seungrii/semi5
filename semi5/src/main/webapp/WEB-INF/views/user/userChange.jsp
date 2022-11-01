<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="/WEB-INF/views/user-login-template/loginHeader.jsp">
	<jsp:param value="로그인" name="title"/>
</jsp:include>
	<section class="w-980">
		<div class="row mt-50 center">
			<h1>개인정보 수정</h1>
		</div>
		<!-- 지점 이미지 첨부 -->
		<form action="#"  method="post" enctype="multipart/form-data">
			<c:if test="${!attachments.isEmpty()}">
				<div class="row">
					<div class="mt-10">
					<c:forEach var="imageDto" items="${attachments}">
						<span class="ms-10 mt-10">
						<img src="/attachment/download/${imageDto.fileNumber}" width="100" height="100">
						<a href="/user/profileImageDelete?userId=${userDto.userId}&fileNumber=${imageDto.fileNumber}">삭제</a>
						</span>
					</c:forEach>
					</div>
				</div>
			</c:if>
			<div class="row">
				<input type="hidden" name="userId" value="${userDto.userId}" >
			</div>
			<div class="row">
				<input class="input-user" type="email" name="userEmail" value="${userDto.userEmail}" placeholder="이메일을 입력해주세요">
			</div>
			<div class="row">
				<input class="input-user" type="tel" name="userTel" value="${userDto.userTel }" placeholder="전화번호를 입력해주세요">
			</div>
			<!-- 회원 프로필 첨부 -->
			<div class="row mt-10">
				<span>첨부파일(1개당 1MB. 최대 10MB 가능)</span>
			</div>
			<div class="row">
				<input name="attachments" class="login-input" type="file" accept=".png, .jpg">
			</div>
			<div>
				<button type="submit">확인</button>
			</div>
		</form>
	</section>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>