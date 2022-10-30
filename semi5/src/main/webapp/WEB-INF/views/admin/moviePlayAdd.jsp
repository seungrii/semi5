<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/admin/admin-template/adminHeader.jsp">
	<jsp:param value="상영스케쥴 추가" name="title"/>
</jsp:include>

<section class="w-980 test-css">
	
	
<div class="container-400">
	
	<form action="moviePlayAdd" method="post">
		<div class="row center fs-28">
			<span>상영스케쥴 추가</span>
		</div>
		<div class="row mt-50">
			<label class="ms-10">영화 번호</label>
			<input class="input input-line w-100" name="movieNumber" type="number" min="1" required>
		</div>
        <div class="row mt-20">
			<label class="ms-10">상영관 고유번호 (지점별 상영관별 고유번호)</label>
			<input class="input input-line w-100" name="theaterNum" type="number" min="1" required>
		</div>
		<div class="row mt-20">
			<label class="ms-10">상영 시작일</label>
			<input class="input input-line w-100" name="moviePlayStartDate" type="date" required>
		</div>
		<div class="row mt-20">
			<label class="ms-10">상영 시작시간</label>
			<input class="input input-line w-100" name="moviePlayStartTime" type="time" required>
		</div>
		<div class="row center mt-30">
			<a class="btn btn-neutral" href="moviePlayList">목록</a>
			<button class="btn btn-positive" type="submit">추가</button>
		</div>
	</form>
	
</div>
	
	
</section>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>