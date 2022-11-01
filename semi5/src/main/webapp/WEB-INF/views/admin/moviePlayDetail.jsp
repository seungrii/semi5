<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/template/header.jsp">
	<jsp:param value="상영스케쥴 상세" name="title"/>
</jsp:include>
<section class="w-980 test-css">
<jsp:include page="/WEB-INF/views/template/sidebar.jsp"></jsp:include>
	
	
<div class="container-400">
	
	
		<div class="row center fs-28">
			<span>상영스케쥴 상세</span>
		</div>
		<div class="row mt-50">
			<label class="ms-10">스케쥴번호</label>
			<input class="input input-line w-100" name="moviePlayNum" type="number" readonly
					value="${moviePlayVO.moviePlayNum}">
		</div>
		<div class="row mt-20">
			<label class="ms-10">상영시작일</label>
			<input class="input input-line w-100" name="moviePlayStartDate" type="date" readonly
					value="${moviePlayVO.moviePlayStartDate}">
		</div>
		<div class="row mt-20">
			<label class="ms-10">상영시작시간</label>
			<input class="input input-line w-100" name="moviePlayStartTime" type="time" readonly
					value="${moviePlayVO.moviePlayStartTime}">
		</div>
		<div class="row mt-20">
			<label class="ms-10">영화번호</label>
			<input class="input input-line w-100" name="movieNumber" type="number" readonly
					value="${moviePlayVO.movieNumber}">
		</div>
		<div class="row mt-20">
			<label class="ms-10">영화명</label>
			<input class="input input-line w-100" name="movieName" type="text" readonly
					value="${moviePlayVO.movieName}">
		</div>
		<div class="row mt-20">
			<label class="ms-10">개봉일</label>
			<input class="input input-line w-100" name="openingDate" type="date" readonly
					value="${moviePlayVO.openingDate}">
		</div>
		<div class="row mt-20">
			<label class="ms-10">상영종료일</label>
			<input class="input input-line w-100" name="screeningEnd" type="date" readonly
					value="${moviePlayVO.screeningEnd}">
		</div>
		<div class="row mt-20">
			<label class="ms-10">연령등급</label>
			<input class="input input-line w-100" name="movieAgeLimit" type="number" readonly
					value="${moviePlayVO.movieAgeLimit}">
		</div>
		<div class="row mt-20">
			<label class="ms-10">재생시간</label>
			<input class="input input-line w-100" name="moviePlayTime" type="number" readonly
					value="${moviePlayVO.moviePlayTime}">
		</div>
		<div class="row mt-20">
			<label class="ms-10">상영관번호 (고유번호)</label>
			<input class="input input-line w-100" name="theaterNum" type="number" readonly
					value="${moviePlayVO.theaterNum}">
		</div>
		<div class="row mt-20">
			<label class="ms-10">지점명</label>
			<input class="input input-line w-100" name="cinemaPorin" type="text" readonly
					value="${moviePlayVO.cinemaPorin}">
		</div>
		<div class="row mt-20">
			<label class="ms-10">상영관타입</label>
			<input class="input input-line w-100" name="theaterType" type="text" readonly
					value="${moviePlayVO.theaterType}">
		</div>
		<div class="row mt-20">
			<label class="ms-10">상영관번호 (관)</label>
			<input class="input input-line w-100" name="theaterHall" type="number" readonly
					value="${moviePlayVO.theaterHall}">
		</div>
		<div class="row mt-20">
			<label class="ms-10">좌석수</label>
			<input class="input input-line w-100" name="theaterTotalSeat" type="number" readonly
					value="${moviePlayVO.theaterTotalSeat}">
		</div>
		<div class="row center mt-30">
			<a class="btn btn-neutral" href="moviePlayList">목록</a>
			<a class="btn btn-neutral" href="moviePlayChange?moviePlayNum=${moviePlayVO.moviePlayNum}">수정</a>
			<a class="btn btn-negative" href="moviePlayDelete?moviePlayNum=${moviePlayVO.moviePlayNum}">삭제</a>
		</div>
	
	
</div>
	
</section>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>