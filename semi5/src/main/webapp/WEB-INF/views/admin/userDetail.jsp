<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="/WEB-INF/views/template/header.jsp">
	<jsp:param value="회원 상세" name="title"/>
</jsp:include>
<section class="w-980 test-css">
<div class="admin-box">

<jsp:include page="/WEB-INF/views/template/sidebar.jsp"></jsp:include>

<div class="container">
<table class="table table-slit center mt-50">
	<tr>
		<td colspan="2"><img src="download?userId=${userDto.userId}" width="100" height="100"></td>
		<%-- <td>${userDto.userId}</td> --%>
	</tr>
	<tr>
		<td>아이디</td>
		<td>${userDto.userId}</td>
	</tr>
	<tr>
		<td>이름</td>
		<td>${userDto.userName}</td>
	</tr>
	<tr>
		<td>성별</td>
		<td>${userDto.userGender}</td>
	</tr>
	<tr>
		<td>이메일</td>
		<td>${userDto.userEmail}</td>
	</tr>
	<tr>
		<td>등급</td>
		<td>${userDto.userRank}</td>
	</tr>
	<tr>
		<td>전화번호</td>
		<td>${userDto.userTel}</td>
	</tr>
	<tr>
		<td>생년월일</td>
		<td>${userDto.userBirth}</td>
	</tr>
	
</table>

<div class="center mt-30 mb-50">
	<a class="btn btn-neutral" href="userList">회원 목록</a>
</div>
</div>
</div>
</section>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>