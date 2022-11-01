<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/template/header.jsp">
	<jsp:param value="관리자계정 추가" name="title"/>
</jsp:include>
<script src="/js/adminAccountCheck.js"></script>

<section class="w-980 test-css">
<jsp:include page="/WEB-INF/views/template/sidebar.jsp"></jsp:include>
	
	
<div class="container-400">
	
	<form action="adminAdd" method="post">
		<div class="row center fs-28">
			<span>관리자계정 추가</span>
		</div>
		<div class="row mt-50">
			<label class="ms-10">ID</label>
			<input class="input input-line w-100" name="adminId" type="text" required autocomplete="off">
			<span class="NNNNN-message">이미 사용중인 아이디입니다</span>
            <span class="NNNNY-message">사용 가능한 아이디입니다!</span>
            <span class="fail-message">영문과 숫자 5~10글자로 작성해주세요</span>
		</div>
        <div class="row mt-20">
			<label class="ms-10">PW</label>
			<input class="input input-line w-100" name="adminPw" type="password" required autocomplete="off">
            <span class="NNNNY-message">사용 가능한 비밀번호입니다!</span>
			<span class="fail-message">8~16자로 반드시 영문 대/소문자, 숫자, 특수문자가 포함되어야 합니다</span>
		</div>
		<div class="row mt-20">
			<label class="ms-10">사원번호</label>
			<input class="input input-line w-100" name="EmployeeNo" type="number" min="1" required autocomplete="off">
		</div>
		<div class="row mt-20">
			<label class="ms-10">메모사항</label>
			<textarea class="input textarea-line fix-width w-100" rows="8" cols="10" name="adminAddMemo"></textarea>
		</div>
		<div class="row center mt-30">
			<a class="btn btn-neutral" href="adminList">목록</a>
			<button class="btn btn-positive" type="submit">추가</button>
		</div>
	</form>
	
</div>
	
 
	
	
</section>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>