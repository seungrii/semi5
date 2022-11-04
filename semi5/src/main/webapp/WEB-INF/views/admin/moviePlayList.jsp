<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="/WEB-INF/views/template/header.jsp">
	<jsp:param value="상영스케쥴 목록" name="title"/>
</jsp:include>
<section class="w-980 test-css">
<div class="admin-box">

<div class="admin-box">

<jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/template/sidebar.jsp"></jsp:include>

<div class="container">

	<div class="row center mt-50">
		<h1>상영스케쥴 목록</h1>
	</div>
	
	<!-- 키워드 검색 -->
	<div class="row right">
	<form action="moviePlayList" method="get">
		<!-- type 선택목록 -->
		<c:choose>
			<c:when test="${param.type == 'movie_name'}">
				<select class="input input-line" name="type" required>
					<option value="movie_play_num">스케쥴번호</option>
					<option value="movie_name" selected>영화명</option>
					<option value="cinema_porin">지점명</option>
					<option value="movie_play_start">상영일자</option>
				</select>
			</c:when>
			<c:when test="${param.type == 'cinema_porin'}">
				<select class="input input-line" name="type" required>
					<option value="movie_play_num">스케쥴번호</option>
					<option value="movie_name">영화명</option>
					<option value="cinema_porin" selected>지점명</option>
					<option value="movie_play_start">상영일자</option>
				</select>
			</c:when>
			<c:when test="${param.type == 'movie_Play_Start'}">
				<select class="input input-line" name="type" required>
					<option value="movie_play_num">스케쥴번호</option>
					<option value="movie_name">영화명</option>
					<option value="cinema_porin">지점명</option>
					<option value="movie_play_start" selected>상영일자</option>
				</select>
			</c:when>
			<c:otherwise>
				<select class="input input-line" name="type" required>
					<option value="movie_play_num" selected>스케쥴번호</option>
					<option value="movie_name">영화명</option>
					<option value="cinema_porin">지점명</option>
					<option value="movie_play_start">상영일자</option>
				</select>
			</c:otherwise>
		</c:choose>
		<!-- keyword 입력 -->
		<input class="input input-underline" type="search" name="keyword" required value="${param.keyword}">
		<button class="btn btn-neutral" type="submit">검색</button>
	</form>
	</div>
	
	<!-- 목록 -->
	<div class="row center mt-30">
	<table class="table table-slit">
		<thead>
			<tr>
				<td>스케쥴번호</td>
				<td>영화명</td>
				<td>지점명</td>
				<td>상영관번호</td>
				<td>상영일자</td>
				<td>상영시간</td>
				<td colspan="1">관리</td>
			</tr>
		</thead>
		<tbody align="center">
			<c:forEach var="moviePlayList" items="${moviePlayList}">
				<tr>
					<td>${moviePlayList.moviePlayNum}</td>
					<td>${moviePlayList.movieName}</td>
					<td>${moviePlayList.cinemaPorin}</td>
					<td>${moviePlayList.theaterHall}</td>
					<td>${moviePlayList.moviePlayStart}</td>
					<td>${moviePlayList.theaterHall}</td>
					<td>
						<a class="btn btn-neutral" 
							href="moviePlayDetail?moviePlayNum=${moviePlayList.moviePlayNum}">상세</a>
					</td>
					<td>
						<a class="btn btn-negative" 
							href="moviePlayDelete?moviePlayNum=${moviePlayList.moviePlayNum}">삭제</a>
					</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	</div>
	
	<div class="center mt-30">
		<a class="btn btn-positive" href="moviePlayAdd">추가</a>
	</div>

</div>
</div>
</div>
</section>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>