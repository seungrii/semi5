<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/views/template/header.jsp">
	<jsp:param value="메인화면" name="title"/>
</jsp:include>
	<section class="w-980">
		<div class="row center">
			<h1>마이페이지</h1>
		</div>
		<div class="row">
			<a href="delete">회원탈퇴</a>
		</div>
		<div class="row">
			<a href="changePwFind">비밀번호 변경</a>
		</div>
		<div class="row">
			<a href="change">개인정보 수정</a>
		</div>
		<div class="row">
			<a href="oneQna">1:1 문의</a>
		</div>
		<div class="row">
			<a href="oneQnaList">1:1 문의내역</a>
		</div>
		<!-- 지점 이미지 첨부 -->
		<!--<div>
			<img src="download?userId=${userDto.userId}" width="100" height="100">
		</div> -->
		<c:if test="${!attachments.isEmpty()}">
			<div class="row">
				<div class="mt-10">
				<c:forEach var="imageDto" items="${attachments}">
					<span class="ms-10 mt-10">
					<img src="/attachment/download/${imageDto.fileNumber}" width="100" height="100">
					</span>
				</c:forEach>
				</div>
			</div>
		</c:if>
		<div class="row">${userDto.userId}</div>
		<div class="row">${userDto.userName}</div>
		<div class="row">${userDto.userGender}</div>
		<div class="row">${userDto.userEmail}</div>
		<div class="row">${userDto.userRank}</div>
		<div class="row">${userDto.userTel}</div>
		<div class="row">${userDto.userBirth}</div>
		<div class="row">
		<hr>
		<div class="row">
			<a href="boardList">내가 작성한 글</a>
		</div>
		</div>
	</section>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>