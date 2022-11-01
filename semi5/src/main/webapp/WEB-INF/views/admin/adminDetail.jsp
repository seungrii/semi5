<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/template/header.jsp">
	<jsp:param value="관리자계정 상세" name="title"/>
</jsp:include>
<section class="w-980 test-css">
<div class="admin-box">

<jsp:include page="/WEB-INF/views/template/sidebar.jsp"></jsp:include>
	
	
<div class="container-400">
	
	
		<div class="row center fs-28 mt-50">
			<span>관리자계정 상세</span>
		</div>
		<div class="row mt-50">
			<label class="ms-10">ID</label>
			<input class="input input-line w-100" name="adminId" type="text" readonly
					value="${adminDto.adminId}">
		</div>
		<div class="row mt-20">
			<label class="ms-10">사원번호</label>
			<input class="input input-line w-100" name="EmployeeNo" type="number" readonly
					value="${adminDto.employeeNo}">
		</div>
		<div class="row mt-20">
			<label class="ms-10">메모사항</label>
			<textarea class="input textarea-line fix-width w-100" rows="8" cols="10" name="adminAddMemo" readonly
					>${adminDto.adminAddMemo}</textarea>
		</div>
		<div class="row center mt-30">
			<a class="btn btn-neutral" href="adminList">목록</a>
			<a class="btn btn-neutral" href="adminChange?adminId=${adminDto.adminId}">수정</a>
			<a class="btn btn-negative" href="adminDelete?adminId=${adminDto.adminId}">삭제</a>
		</div>
	
	
</div>
</div>	
</section>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>