<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/admin/admin-template/adminHeader.jsp">
	<jsp:param value="관리자계정 추가" name="title"/>
</jsp:include>
<section class="w-980 test-css">
	
	
<div class="container-400">
	
	<form action="addAdmin" method="post">
		<div class="row center fs-28">
			<span>관리자계정 추가</span>
		</div>
		<div class="row mt-50">
			<label class="ms-10">ID</label>
			<input class="input input-line w-100" name="adminId" type="text" required autocomplete="off">
		</div>
		<div class="row mt-20">
			<label class="ms-10">PW</label>
			<input class="input input-line w-100" name="adminPw" type="password" required autocomplete="off">
		</div>
		<div class="row mt-20">
			<label class="ms-10">사원번호</label>
			<input class="input input-line w-100" name="EmployeeNo" type="number" required autocomplete="off">
		</div>
		<div class="row mt-20">
			<label class="ms-10">메모사항</label>
			<textarea class="input textarea-line fix-width w-100" rows="8" cols="10" name="adminAddMemo"></textarea>
		</div>
		<div class="row center mt-30">
			<a class="btn btn-neutral" href="listAdmin">목록</a>
			<button class="btn btn-positive" type="submit">추가</button>
		</div>
	</form>
	
</div>
	
</section>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>