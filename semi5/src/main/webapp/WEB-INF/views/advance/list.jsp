<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="/WEB-INF/views/template/header.jsp">
	<jsp:param name="title" value="예매" />
</jsp:include>

<style>
.advance-container {
	height: 720px;
	display: flex;
	/* position: relative; */
}

.advance-movie {
	width: 284px;
	height: 100%;
	/* position: absolute; */
}

.advance-theater {
	width: 265px;
	height: 100%;
	/* position: absolute; */
}

.advance-date {
	width: 91px;
	height: 100%;
	background-color: aqua;
	/* position: absolute; */
}

.advance-time {
	width: 340px;
	height: 100%;
	background-color: yellowgreen;
	/* position: absolute; */
}
</style>

<section class="w-980">

	<!-- 컨텐츠 -->
	<div class="advance-container">
<!-- 			<ul> -->
<%-- 				<c:forEach var="movieList" items="${movieList}"> --%>
<%-- 					<li>${movieList.movieName}</li> --%>
<%-- 				</c:forEach> --%>
<!-- 			</ul> -->
<!-- 			<br><br><br> -->
<!-- 			<ul> -->
<%-- 				<c:forEach var="cinemaList" items="${cinemaList}"> --%>
<%-- 					<li>${cinemaList.cinemaPorin}</li> --%>
<%-- 				</c:forEach> --%>
<!-- 			</ul> -->
		<!-- 영화 고르는 박스 -->
		<!-- 284px -->
		<div class="advance-movie">
			<div>
				<ul>
					<li>영화</li>
					<br>
					<c:forEach var="movieList" items="${movieList}">
						<li>${movieList.movieName}</li>
					</c:forEach>
			</ul>
			</div>
		</div>
		<!-- 극장 고르는 박스 -->
		<!-- 265px -->
		<div class="advance-theater">
			<ul>
				<li>지점</li>
				<br>
				<c:forEach var="cinemaList" items="${cinemaList}">
					<li>${cinemaList.cinemaPorin}</li>
				</c:forEach>
			</ul>
		</div>
		<!-- 날짜 고르는 박스 -->
		<!-- 91px -->
		<div class="advance-date">
			<ul>
				<li>날짜</li>
				<br>
				<c:forEach var="mPDL" items="${mPDL}">
					<li>${mPDL.il}</li>
				</c:forEach>
			</ul>
		</div>
		<!-- 시간 고르는 박스 -->
		<!-- 340px -->
		<div class="advance-time">
			<ul>
				<li>상영시간</li>
				<br>
			</ul>
		</div>





	</div>
</section>


<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>