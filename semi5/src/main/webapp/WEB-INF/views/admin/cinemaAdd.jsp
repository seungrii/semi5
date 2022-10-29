<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/admin/admin-template/adminHeader.jsp">
	<jsp:param value="지점 추가" name="title"/>
</jsp:include>

<section class="w-980 test-css">
	
<div class="container-400">
	
	<form action="cinemaAdd" method="post" enctype="multipart/form-data">
		<div class="row center fs-28">
			<span>지점 추가</span>
		</div>
		<div class="row mt-50">
			<label class="ms-10">지점명</label>
			<input class="input input-line w-100" name="cinemaPorin" type="text" required autocomplete="off">
		</div>
        <div class="row mt-20">
			<label class="ms-10">기본주소</label>
			<input class="input input-line w-100" name="cinemaBaseAddress" type="text" autocomplete="off">
		</div>
		<div class="row mt-20">
			<label class="ms-10">상세주소</label>
			<input class="input input-line w-100" name="cinemaDetailAddress" type="text" autocomplete="off">
		</div>
		<div class="row mt-20">
			<label class="ms-10">전화번호</label>
			<input class="input input-line w-100" name="cinemaTel" type="text" autocomplete="off">
		</div>
		
		<!-- 지점 이미지 첨부 -->
		<div class="row left mt-20">
			<label>첨부파일(1개당 1MB. 최대 10MB 가능)</label>
			<input class="input input-line w-100" type="file" name="attachments" multiple>
		</div>
		
		<div class="row center mt-30">
			<a class="btn btn-neutral" href="cinemaList">목록</a>
			<button class="btn btn-positive" type="submit">추가</button>
		</div>
	</form>
	
</div>
	
 
	
	
</section>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>