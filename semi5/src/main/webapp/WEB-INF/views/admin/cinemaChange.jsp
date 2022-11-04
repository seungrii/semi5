<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="/WEB-INF/views/template/header.jsp">
	<jsp:param value="지점 수정" name="title"/>
</jsp:include>

<section class="w-980 test-css">
<div class="admin-box">

<jsp:include page="/WEB-INF/views/template/sidebar.jsp"></jsp:include>
	
<div class="container-400">
	
	<form action="cinemaChange" method="post" enctype="multipart/form-data">
		<div class="row center fs-28 mt-50">
			<span>지점 수정</span>
		</div>
		<div class="row mt-50">
			<label class="ms-10">지점명</label>
			<input class="input input-line w-100" name="cinemaPorin" type="text" readonly
					value="${cinemaDto.cinemaPorin}">
		</div>
        <div class="row mt-20">
			<label class="ms-10">기본주소</label>
			<input class="input input-line w-100" name="cinemaBaseAddress" type="text"
					value="${cinemaDto.cinemaBaseAddress}">
		</div>
		<div class="row mt-20">
			<label class="ms-10">상세주소</label>
			<input class="input input-line w-100" name="cinemaDetailAddress" type="text"
					value="${cinemaDto.cinemaDetailAddress}">
		</div>
		<div class="row mt-20">
			<label class="ms-10">전화번호</label>
			<input class="input input-line w-100" name="cinemaTel" type="text"
					value="${cinemaDto.cinemaTel}">
		</div>
		
		<!-- 지점 이미지 첨부 -->
		<div class="row left mt-20">
			<label>첨부파일(1개당 1MB. 최대 10MB 가능)</label>
			<input class="input input-line w-100" type="file" name="attachments" multiple>
		</div>
		<c:if test="${!attachments.isEmpty()}">
			<div class="row left mt-20">
				<label class="ms-10">지점 사진</label>
				<div class="mt-10">
				<c:forEach var="imageDto" items="${attachments}">
					<span class="ms-10 mt-10">
					<img src="${pageContext.request.contextPath}/attachment/download/${imageDto.fileNumber}" width="100" height="100">
					<a href="${pageContext.request.contextPath}/attachment/download/${imageDto.fileNumber}">다운로드</a>
					<%-- <a href="/attachment/delete/${imageDto.fileNumber}">삭제</a> 	삭제는 비동기로 구현 --%>
					<a href="${pageContext.request.contextPath}/admin/cinemaImageDelete?cinemaPorin=${cinemaDto.cinemaPorin}&fileNumber=${imageDto.fileNumber}">삭제</a>
					</span>
				</c:forEach>
				</div>
			</div>
		</c:if>
		
		<div class="row center mt-30">
			<a class="btn btn-neutral" href="cinemaList">목록</a>
			<button class="btn btn-neutral" type="submit">수정완료</button>
			<a class="btn btn-negative" href="cinemaDelete?cinemaPorin=${cinemaDto.cinemaPorin}">삭제</a>
		</div>
	</form>
	
</div>
	
 
	
</div>	
</section>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>