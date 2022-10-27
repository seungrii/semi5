<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="/WEB-INF/views/admin/admin-template/adminHeader.jsp">
	<jsp:param value="회원 상세" name="title"/>
</jsp:include>
<section class="w-980 test-css">

<div class="container">

	<div class="row center">
		<h1>회원 상세</h1>
	</div>
	<div>
		<img src="download?userId=${userDto.userId}" width="100" height="100">
	</div>
	<div class="row">${userDto.userId}</div>
	<div class="row">${userDto.userName}</div>
	<div class="row">${userDto.userGender}</div>
	<div class="row">${userDto.userEmail}</div>
	<div class="row">${userDto.userRank}</div>
	<div class="row">${userDto.userTel}</div>
	<div class="row">${userDto.userBirth}</div>
	<div class="center">
		<a class="btn btn-neutral" href="userList">회원 목록</a>
	</div>


</div>

</section>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>