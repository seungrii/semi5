<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/admin/admin-template/adminHeader.jsp">
	<jsp:param value="관리자계정 추가" name="title"/>
</jsp:include>
<section class="w-980 test-css">
	
<div class="container">
	
	<form action="addAdmin" method="post">
		<div>
			<label>ID</label>
			<input class="input" name="adminId" type="text" required autocomplete="off">
		</div>
		<div>
			<label>PW</label>
			<input name="adminPw" type="password" required autocomplete="off">
		</div>
		<div>
			<label>사원번호</label>
			<input name="EmployeeNo" type="number" required autocomplete="off">
		</div>
		<button type="submit">추가</button>
	</form>
	
</div>
	
</section>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>