<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--JSTL 사용 선언 --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/views/admin/admin-template/adminHeader.jsp">
	<jsp:param value="영화 목록" name="title"/>
</jsp:include>

<section class="w-980 test-css">
  
<div class="container-400">


<%--순위,예매율,별점,상영여부는 따로 받아옴 --%>

	<form action="movieAdd" method="post" enctype="multipart/form-data">
		<div class="row center fs-28">
			<span>영화 목록</span>
		</div>
		<!-- 키워드 검색 -->
		<div class="row center">
		<form action="movieList" method="get">
			<!-- type 선택목록 -->
			<c:choose>
				<c:when test="${param.type == 'movie_number'}">
					<select class="input input-line" name="type" required>
						<option value="movie_number">영화번호</option>
						<option value="movie_name" selected>영화이름</option>
					</select>
				</c:when>
				<c:otherwise>
					<select class="input input-line" name="type" required>
						<option value="movie_number" selected>영화번호</option>
						<option value="movie_name">영화이름</option>
					</select>
				</c:otherwise>
			</c:choose>
			<!-- keyword 입력 -->
			<input class="input input-underline" type="search" name="keyword" required value="${param.keyword}">
			<button class="btn btn-neutral" type="submit">검색</button>
		</form>
		</div>
		
			<!-- 
	
	<-- List<MovieDto> selectList - for문으로 출력-->
	
	<!-- 관리자계정 목록 -->
	<div class="row center">
	<table>
		<thead>
			<tr>
				<td>영화번호</td>
				<td>영화이름</td>
				<td>개봉일</td>
				<td>상영종료일</td>
				<td>연령등급</td>
				<td>재생시간</td>
				<!--<td colspan="1">관리</td>  -->
			</tr>
		</thead>
		<tbody align="center">
			<c:forEach var="movieDto" items="${movieList}">
			<tr>
				<td>${movieDto.movieNumber}</td>
				<td>${movieDto.movieName}</td>
				<td>${movieDto.openingDate}</td>
				<td>${movieDto.screeningEnd}</td>
				<td>${movieDto.movieAgeLimit}</td>
				<td>${adminDto.moviePlayTime}</td>
				<td>
					<a class="btn btn-neutral" 
						href="movieDetail?movieNumber=${movieDto.movieNumber}">상세</a>
				</td>
				<td>
					<a class="btn btn-negative" 
						href="movieDelete?movieNumber=${movieDto.movieNumber}">삭제</a>
				</td>
			</tr>
			</c:forEach>
		</tbody>
	</table>
	</div>
	
	<div class="center">
		<a class="btn btn-positive" href="movieAdd">추가</a>
	</div>
		
		

	</form>
	
</div>

	
	
</section>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>