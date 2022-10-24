<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/admin/admin-template/adminHeader.jsp">
	<jsp:param value="관리자계정 정보" name="title"/>
</jsp:include>
<section class="w-980 test-css">

<div class="container">
	
	<form action="addAdmin" method="post">
		<input name="adminId" type="text" required autocomplete="name">
		<input name="adminPw" type="password" required autocomplete="name">
		<input name="EmployeeNo" type="number" required autocomplete="name">
		<button type="submit"></button>
	</form>
	
</div>

</section>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>