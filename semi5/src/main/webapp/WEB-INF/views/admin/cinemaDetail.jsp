<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="/WEB-INF/views/admin/admin-template/adminHeader.jsp">
	<jsp:param value="지점 상세" name="title"/>
</jsp:include>

<section class="w-980 test-css">
	
<div class="container-400">
	
		<div class="row center fs-28">
			<span>지점 상세</span>
		</div>
		<div class="row mt-50">
			<label class="ms-10">지점명</label>
			<input class="input input-line w-100" name="cinemaPorin" type="text" readonly
					value="${cinemaDto.cinemaPorin}">
		</div>
        <div class="row mt-20">
			<label class="ms-10">기본주소</label>
			<input class="input input-line w-100" name="cinemaBaseAddress" type="text" readonly
					value="${cinemaDto.cinemaBaseAddress}">
		</div>
		<div class="row mt-20">
			<label class="ms-10">상세주소</label>
			<input class="input input-line w-100" name="cinemaDetailAddress" type="text" readonly
					value="${cinemaDto.cinemaDetailAddress}">
		</div>
		<div class="row mt-20">
			<label class="ms-10">전화번호</label>
			<input class="input input-line w-100" name="cinemaTel" type="text" readonly
					value="${cinemaDto.cinemaTel}">
		</div>
		
		<!-- 지점 이미지 첨부 -->
		<c:if test="${!attachments.isEmpty()}">
			<div class="row left mt-20">
				<label class="ms-10">지점 사진</label>
				<div class="mt-10">
				<c:forEach var="imageDto" items="${attachments}">
					<span class="ms-10 mt-10">
					<img src="/attachment/download/${imageDto.fileNumber}" width="100" height="100">
					<a href="/attachment/download/${imageDto.fileNumber}">다운로드</a>
					<%-- <a href="/attachment/delete/${imageDto.fileNumber}">삭제</a> 	삭제는 비동기로 구현해야함 --%>
					</span>
				</c:forEach>
				</div>
			</div>
		</c:if>
		
		<div class="row center mt-30">
			<a class="btn btn-neutral" href="cinemaList">목록</a>
			<a class="btn btn-neutral" href="cinemaChange?cinemaPorin=${cinemaDto.cinemaPorin}">수정</a>
			<a class="btn btn-negative" href="cinemaDelete?cinemaPorin=${cinemaDto.cinemaPorin}">삭제</a>
		</div>
	
</div>
	
 
	
	
</section>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>