<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="/WEB-INF/views/template/header.jsp">
	<jsp:param value="지점 목록" name="title"/>
</jsp:include>
<section class="container">
<div class="admin-box">


<div class="row">

	<div class="center mt-50">
		<h1>지점 목록</h1>
	</div>
	
	<!-- 키워드 검색 -->
	<div class="row center mt-30">
	<form action="cinemaList" method="get">
		<!-- type 선택목록 -->
		<c:choose>
			<c:when test="${param.type == 'cinema_base_address'}">
				<select class="input input-line" name="type" required>
					<option value="cinema_porin">지점명</option>
					<option value="cinema_base_address" selected>기본주소</option>
				</select>
			</c:when>
			<c:otherwise>
				<select class="input input-line" name="type" required>
					<option value="cinema_porin" selected>지점명</option>
					<option value="cinema_base_address">기본주소</option>
				</select>
			</c:otherwise>
		</c:choose>
		<!-- keyword 입력 -->
		<input class="input input-underline" type="search" name="keyword" required value="${param.keyword}">
		<button class="btn btn-neutral" type="submit">검색</button>
	</form>
	</div>
	
	<!-- 목록 -->
	<div class="container center">
	<table class="table table-slit">
		<thead>
			<tr>
				<td>지점명</td>
				<td>기본주소</td>
				<td>상세주소</td>
				<td>전화번호</td>
				<td colspan="2">관리</td>
			</tr>
		</thead>
		<tbody align="center">
			<c:forEach var="cinemaDto" items="${cinemaList}">
			<tr>
				<td>${cinemaDto.cinemaPorin}</td>
				<td>${cinemaDto.cinemaBaseAddress}</td>
				<td>${cinemaDto.cinemaDetailAddress}</td>
				<td>${cinemaDto.cinemaTel}</td>
				<td>
					<a class="btn btn-neutral" 
						href="cinemaDetail?cinemaPorin=${cinemaDto.cinemaPorin}">상세</a>
				</td>
			</tr>
			</c:forEach>
		</tbody>
	</table>
	</div>
	
	

</div>
</div>
</section>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>