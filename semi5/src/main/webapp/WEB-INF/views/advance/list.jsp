<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="/WEB-INF/views/template/header.jsp">
	<jsp:param name="title" value="예매"/>
</jsp:include>

<div>
	<ul>
		<c:forEach var="movieList" items="${movieList}">
			<li>${movieList.movieName}</li>
		</c:forEach>
	</ul>
	<br><br><br>
	<ul>
		<c:forEach var="cinemaList" items="${cinemaList}">
			<li>${cinemaList.cinemaPorin}</li>
		</c:forEach>
	</ul>
</div>

	
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>