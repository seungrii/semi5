<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/views/template/header.jsp">
	<jsp:param value="메인화면" name="title"/>
</jsp:include>
	
<section class="w-980">
<div class="admin-box">
	
	<!-- 회원메뉴 사이드바 -->
    	<aside class="sidebar-css">
    		<div class="container-150">
    			<%-- <div class="row">
    				<h2>상태창</h2>
    			</div>
    			<div class="row">
    				login : ${sessionScope.LoginId}
    			</div>
    			<div class="row">
    				admin : ${sessionScope.loginGrade}
    			</div> --%>
	 		    <div class="row center">
					<h1>마이페이지</h1>
				</div>
					<div class="row">
						<a href="delete">회원탈퇴</a>
					</div>
					<div class="row">
						<a href="changePwFind">비밀번호 변경</a>
					</div>
					<div class="row">
						<a href="change">개인정보 수정</a>
					</div>
					<div class="row">
						<a href="oneQna">1:1 문의</a>
					</div>
					<div class="row">
						<a href="oneQnaList">1:1 문의내역</a>
					</div>
					<div class="row">
						<a href="ticketing">예매내역</a>
					</div>
    		</div>
    	</aside>
		
<div class="container center mt-50 mb-50">
		<!-- 지점 이미지 첨부 -->
		<!--<div>
			<img src="download?userId=${userDto.userId}" width="100" height="100">
		</div> -->
	<table class="table table-slit">
		<tr>
		<td colspan="2">
		<c:if test="${!attachments.isEmpty()}">
			<div class="row">
				<div class="mt-10">
				<c:forEach var="imageDto" items="${attachments}">
					<span class="ms-10 mt-10">
					<img src="/attachment/download/${imageDto.fileNumber}" width="100" height="100">
					</span>
				</c:forEach>
				</div>
			</div>
		</c:if>
		</td>
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
	<div class="center mt-50 mb-50">
			<button class="btn"><a href="boardList">내가 작성한 글</a></button>
	</div>		


</div>
		</div>
	</section>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>