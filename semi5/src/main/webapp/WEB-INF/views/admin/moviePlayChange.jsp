<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/views/template/header.jsp">
	<jsp:param value="상영스케쥴 수정" name="title"/>
</jsp:include>

<section class="w-980 test-css">
<div class="admin-box">

<jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/template/sidebar.jsp"></jsp:include>
	
<div class="container-400">
	
	<form action="moviePlayChange" method="post">
		<div class="row center fs-28 mt-50">
			<span>상영스케쥴 수정</span>
		</div>
		<div class="row mt-50">
			<label class="ms-10">상영스케쥴 번호</label>
			<input class="input input-line w-100" name="moviePlayNum" type="number" readonly
				value="${moviePlayDto.moviePlayNum}">
		</div>
		<div class="row mt-20">
			<label class="ms-10">영화 번호</label>
			<input class="input input-line w-100" name="movieNumber" type="number" min="1" required
				value="${moviePlayDto.movieNumber}">
		</div>
        <div class="row mt-20">
			<label class="ms-10">상영관 고유번호 (지점별 상영관별 고유번호)</label>
			<input class="input input-line w-100" name="theaterNum" type="number" min="1" required
				value="${moviePlayDto.theaterNum}">
		</div>
		<div class="row mt-20">
			<label class="ms-10">상영 시작일</label>
			<input class="input input-line w-100" name="moviePlayStartDate" type="date" required
				value="${moviePlayDto.moviePlayStartDate}">
		</div>
		<div class="row mt-20">
			<label class="ms-10">상영 시작시간</label>
			<input class="input input-line w-100" name="moviePlayStartTime" type="time" required
				value="${moviePlayDto.moviePlayStartTime}">
		</div>
		<div class="row center mt-30">
			<a class="btn btn-neutral" href="moviePlayList">목록</a>
			<button class="btn btn-neutral" type="submit">수정완료</button>
			<a class="btn btn-negative" href="moviePlayDelete?moviePlayNum=${moviePlayDto.moviePlayNum}">삭제</a>
		</div>
	</form>
	
</div>
</div>	
</section>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>