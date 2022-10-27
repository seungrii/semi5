<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/views/admin/admin-template/adminHeader.jsp">
	<jsp:param value="관리자계정 수정" name="title"/>
</jsp:include>
<script src="/js/adminAccountCheck.js"></script>

<section class="w-980 test-css">
	
<div class="container-400">
	
	<form action="adminChange" method="post">
		<div class="row center fs-28">
			<span>관리자계정 수정</span>
		</div>
		<div class="row mt-50">
			<label class="ms-10">ID</label>
			<input class="input input-line w-100" name="adminId" type="text" readonly
					value="${adminDto.adminId}">
		</div>
		<!-- loginId일 경우, PW 수정가능 -->
		<c:if test="${LoginId == adminDto.adminId}">
			<div class="row mt-20">
				<label class="ms-10">PW</label>
				<input class="input input-line w-100" name="adminPw" type="password" required>
           	<span class="NNNNY-message">사용 가능한 비밀번호입니다!</span>
			<span class="fail-message">8~16자로 반드시 영문 대/소문자, 숫자, 특수문자가 포함되어야 합니다</span>
			</div>
		</c:if>
		<div class="row mt-20">
			<label class="ms-10">사원번호</label>
			<input class="input input-line w-100" name="EmployeeNo" type="number" min="1" required
					value="${adminDto.employeeNo}">
		</div>
		<div class="row mt-20">
			<label class="ms-10">메모사항</label>
			<textarea class="input textarea-line fix-width w-100" rows="8" cols="10" name="adminAddMemo"
					>${adminDto.adminAddMemo}</textarea>
		</div>
		<div class="row center mt-30">
			<a class="btn btn-neutral" href="adminList">목록</a>
			<button class="btn btn-neutral" type="submit">수정</button>
			<a class="btn btn-negative" href="adminDelete?adminId=${adminDto.adminId}">삭제</a>
		</div>
	</form>
	
</div>
	
</section>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>