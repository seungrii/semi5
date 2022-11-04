<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/template/header.jsp">
	<jsp:param value="영화 추가" name="title"/>
</jsp:include>

<section class="w-980 test-css">
<div class="admin-box">

	<jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/template/sidebar.jsp"></jsp:include>
	
<div class="container-400">


<%--순위,예매율,별점,상영여부는 따로 받아옴 --%>

	<form action="movieAdd" method="post" enctype="multipart/form-data">
		<div class="row center fs-28 mt-50">
			<span>영화 추가</span>
		</div>
		<div class="row mt-50">
			<label class="ms-10">영화이름</label>
			<input class="input input-line w-100" name="movieName" type="text" required autocomplete="off">
		</div>
        <div class="row mt-20">
			<label class="ms-10">개봉일</label>
			<input class="input input-line w-100" name="openingDate" type="date" required>
		</div>
		<div class="row mt-20">
			<label class="ms-10">상영종료일</label>
			<input class="input input-line w-100" name="screeningEnd" type="date" required>
		</div>
		<div class="row mt-20">
			<label class="ms-10">줄거리</label>
			<textarea class="input textarea-line fix-width w-100" rows="8" cols="10" name="movieSummary" required></textarea>
		</div>

		<div class="row mt-20">
			<label class="ms-10">연령등급</label>
			<input class="input input-line w-100" name="movieAgeLimit" type="number" min="1" required autocomplete="off">
		</div>
		<div class="row mt-20">
			<label class="ms-10">재생시간</label>
			<input class="input input-line w-100" name="moviePlayTime" type="number" min="1" required autocomplete="off">
		</div>
		<div class="row mt-20">
			<label class="ms-10">감독 (필수)</label>
			<input class="input input-line w-100" name="charaterName1" type="text" required autocomplete="off">
		</div>
		<div class="row mt-20">
			<label class="ms-10">배우1 (필수)</label>
			<input class="input input-line w-100" name="charaterName2" type="text" required autocomplete="off">
		</div>
		<div class="row mt-20">
			<label class="ms-10">배우2</label>
			<input class="input input-line w-100" name="charaterName3" type="text" autocomplete="off">
		</div>
		<div class="row mt-20">
			<label class="ms-10">배우3</label>
			<input class="input input-line w-100" name="charaterName4" type="text" autocomplete="off">
		</div>
		<div class="row mt-20">
			<label class="ms-10">배우4</label>
			<input class="input input-line w-100" name="charaterName5" type="text" autocomplete="off">
		</div>
		<div class="row mt-20">
			<label class="ms-10">장르</label>
			<input class="input input-line w-100" name="genreNo" type="number" min="1" required autocomplete="off">
			<span>1: 공포, .. 추가 해야 함</span>
		</div>		
		
		<!-- 영화 포스터 첨부 -->
		<div class="row left mt-20">
			<label>첨부파일(1개당 1MB. 최대 10MB 가능)</label>
			<input class="input input-line w-100" type="file" name="imageCinema" accept=".png,.jpg">
		</div>
		
		<div class="row center mt-30">
			<a class="btn btn-neutral" href="movieList">목록</a>
			<button class="btn btn-positive" type="submit">추가</button>
		</div>
	</form>
	
</div>

	
</div>	
</section>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>