<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="/WEB-INF/views/template/header.jsp">
	<jsp:param value="관리자계정 목록" name="title"/>
</jsp:include>

<!-- 관리자메뉴 사이드바 -->
<section class="w-980 test-css">
<div class="admin-box">

<jsp:include page="/WEB-INF/views/template/sidebar.jsp"></jsp:include>

<div class="container-980">
	<div class="row center mt-50">
		<h1>관리자계정 조회</h1>
	</div>
	 
	<!-- 키워드 검색 -->
	<div class="row mt-30 center">
	<form action="adminList" method="get">
		<!-- type 선택목록 -->
		<c:choose>
			<c:when test="${param.type == 'employee_no'}">
				<select class="input input-line" name="type" required>
					<option value="admin_id">아이디</option>
					<option value="employee_no" selected>사원번호</option>
				</select>
			</c:when>
			<c:otherwise>
				<select class="input input-line" name="type" required>
					<option value="admin_id" selected>아이디</option>
					<option value="employee_no">사원번호</option>
				</select>
			</c:otherwise>
		</c:choose>
		<!-- keyword 입력 -->
		<input class="input input-underline" type="search" name="keyword" required value="${param.keyword}">
		<button class="btn btn-neutral" type="submit">검색</button>
		<a class="btn btn-positive" href="adminAdd">추가</a>
		
	</form>
	</div>
	
	<!-- 관리자계정 목록 -->
	<table class="table table-slit mt-30">
		<thead>
			<tr class="center">
				<td>아이디</td>
				<td>사원번호</td>
				<td>생성일</td>
				<td colspan="2">관리</td>
			</tr>
		</thead>
		<tbody align="center">
			<c:forEach var="adminDto" items="${adminList}">
			<tr>
				<td>${adminDto.adminId}</td>
				<td>${adminDto.employeeNo}</td>
				<td>${adminDto.adminAddDate}</td>
				<td>
					<a class="btn btn-neutral" 
						href="adminDetail?adminId=${adminDto.adminId}">상세</a>
				</td>
				<td>
					<a class="btn btn-negative" 
						href="adminDelete?adminId=${adminDto.adminId}">삭제</a>
				</td>
			</tr>
			</c:forEach>
		</tbody>
	</table>
	</div>
	
	<!-- <div class="mt-30">
		<a class="btn btn-positive" href="adminAdd">추가</a>
	</div> -->
</div>
</section>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>