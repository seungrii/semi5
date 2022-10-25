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
		<div>
			<img src="download?userId=${userDto.userId}" width="100" height="100">
		</div>
		<div class="row">${userDto.userId}</div>
		<div class="row">${userDto.userName}</div>
		<div class="row">${userDto.userGender}</div>
		<div class="row">${userDto.userEmail}</div>
		<div class="row">${userDto.userRank}</div>
		<div class="row">${userDto.userTel}</div>
		<div class="row">${userDto.userBirth}</div>
		<div class="row">
		<hr>
			<c:forEach var="boardDto" items="${boardDto}">
				<div class="row">
					${boardDto.boardNo}
				</div>
				<div class="row">
					${boardDto.boardHead}
				</div>
				<div class="row">
					${boardDto.boardTitle}
				</div>
				<div class="row">
					${boardDto.boardWriter}
				</div>
				<div class="row">
					${boardDto.boardWriteTime}
				</div>
			</c:forEach>
		</div>
	</section>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>