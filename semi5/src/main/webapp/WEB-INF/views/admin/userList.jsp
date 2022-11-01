<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="/WEB-INF/views/admin/admin-template/adminHeader.jsp">
	<jsp:param value="회원 목록" name="title"/>
</jsp:include>
<section class="w-980 test-css">

<div class="container mt-50">

	<div class="row center">
		<h1>회원 목록</h1>
	</div>
	
	<!-- 키워드 검색 -->
	<div class="row center mt-30">
	<form action="userList" method="get">
		<!-- type 선택목록 -->
		<c:choose>
			<c:when test="${param.type == 'user_name'}">
				<select class="input input-line" name="type" required>
					<option value="user_id">아이디</option>
					<option value="user_name" selected>이름</option>
				</select>
			</c:when>
			<c:otherwise>
				<select class="input input-line" name="type" required>
					<option value="user_id" selected>아이디</option>
					<option value="user_name">이름</option>
				</select>
			</c:otherwise>
		</c:choose>
		<!-- keyword 입력 -->
		<input class="input input-underline" type="search" name="keyword" required value="${param.keyword}">
		<button class="btn btn-neutral" type="submit">검색</button>
	</form>
	</div>
	
	<!-- 관리자계정 목록 -->
	<div class="row center">
	<table class="table table-slit center mt-30">
		<thead>
			<tr>
				<td>아이디</td>
				<td>이름</td>
				<td>등급</td>
				<td>연락처</td>
				<td>수신동의</td>
				<td>관리</td>
			</tr>
		</thead>
		<tbody align="center">
			<c:forEach var="userDto" items="${userList}">
			<tr>
				<td>${userDto.userId}</td>
				<td>${userDto.userName}</td>
				<td>${userDto.userRank}</td>
				<td>${userDto.userTel}</td>
				<td>${userDto.userBlurb}</td>
				<td>
					<a class="btn btn-neutral" 
						href="userDetail?userId=${userDto.userId}">상세</a>
				</td>
			</tr>
			</c:forEach>
		</tbody>
	</table>
	</div>

</div>

</section>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>