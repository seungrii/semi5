<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<jsp:include page="/WEB-INF/views/user-login-template/loginHeader.jsp">
	<jsp:param value="로그인" name="title"/>
</jsp:include>
	<section class="w-980">
		<div class="row">
			<h1>1:1 문의</h1>
		</div>
		<form action="oneQna" method="post">
			<div class="row">
				<label>문의 제목</label>
				<input type="text" name="askingTitle">
			</div>
			<div class="row">
				<label>문의 내용</label>
				<textarea rows="10" cols="20" name="askingContents"></textarea>
			</div>
			<div class="row">
				<button type="submit">문의하기</button>
			</div>
		</form>
		<c:if test="${ug != null}">
			<form action="">
				<div class="row">
					<label>답변</label>
					<textarea rows="10" cols="20"></textarea>
				</div>
				<div class="row">
					<button type="submit">답변하기</button>
				</div>
			</form>
		</c:if>
	</section>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>