<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/views/template/header.jsp">
	<jsp:param value="영화정보 상세" name="title"/>
</jsp:include>
<section class="w-980 test-css">
<jsp:include page="/WEB-INF/views/template/sidebar.jsp"></jsp:include>
	
<div class="container-400">




	<form action="movieAdd" method="post" enctype="multipart/form-data"> 
		<div class="row center fs-28">
			<span>영화 정보 상세</span>
		</div>
		<div class="row mt-50">
			<label class="ms-10">영화번호</label>
			<input class="input input-line w-100" name="movieNumber" type="text" readonly
			    value="${movieDto.movieNumber}">
		</div>
		<div class="row mt-20">
			<label class="ms-10">영화이름</label>
			<input class="input input-line w-100" name="movieName" type="text" readonly
			    value="${movieDto.movieName}">
		</div>
        <div class="row mt-20">
			<label class="ms-10">개봉일</label>
			<input class="input input-line w-100" name="openingDate" type="date" readonly
			    value="${movieDto.openingDate }">
		</div>
		<div class="row mt-20">
			<label class="ms-10">상영종료일</label>
			<input class="input input-line w-100" name="screeningEnd" type="date" readonly
			 value="${movieDto.screeningEnd }">
		</div>
		<div class="row mt-20">
			<label class="ms-10">줄거리</label>
			<textarea class="input textarea-line fix-width w-100" rows="8" cols="10" name="movieSummary" readonly
				>"${movieDto.movieSummary}"</textarea>
		</div>
		<div class="row mt-20">
			<label class="ms-10">연령등급</label>
			<input class="input input-line w-100" name="movieAgeLimit" type="number" min="1" readonly
			 value="${movieDto.movieAgeLimit }">
		</div>
		<div class="row mt-20">
			<label class="ms-10">재생시간</label>
			<input class="input input-line w-100" name="moviePlayTime" type="number" min="1" readonly
			 value="${movieDto.moviePlayTime }">
		</div>
		
		<c:forEach var="characterDtoListDirector" items="${characterDtoListDirector}">
		<div class="row mt-20">
			<label class="ms-10">감독</label>
			<input class="input input-line w-100" name="directorName1" type="text" readonly
			value="${characterDtoListDirector.charaterName}">
		</div>
		</c:forEach>
		
		<div class="row mt-20">
			<label class="ms-10">배우</label>
			<c:forEach var="characterDtoListActor" items="${characterDtoListActor}">
				<input class="input input-line w-100" name="actorName1" type="text" readonly
					value="${characterDtoListActor.charaterName}">
			</c:forEach>
		</div>
		
		<div class="row mt-20">
			<label class="ms-10">장르</label>
			<c:forEach var="ListHashtag" items="${ListHashtag}">
				<input class="input input-line w-100" name="genreName" type="text" readonly
					value="${ListHashtag.genreName}">
			</c:forEach>
			<span>1: 공포,2.로맨스 .. 추가 해야 함</span>
		</div>
		
		<!-- 영화 포스터 첨부 -->
		<!-- <div class="row left mt-20">
			<label>첨부파일(1개당 1MB. 최대 10MB 가능)</label>
			<input class="input input-line w-100" type="file" name="imageCinema" accept=".png,.jpg">
		</div> -->
		
		<div class="row center mt-30">
			<a class="btn btn-neutral" href="movieList">목록</a>
			<a class="btn btn-negative" href="movieDelete?movieNumber=${movieDto.movieNumber}">삭제</a>
		</div>
	</form>
	
</div>

	<!--value="${hashtagVOList.genreName}"  -->
	
</section>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>