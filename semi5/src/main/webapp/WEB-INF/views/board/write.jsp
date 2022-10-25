<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%-- <jsp:include page="/WEB-INF/views/template/header.jsp">
	<jsp:param value="자유 게시판" name="title"/>
</jsp:include> --%>


<form action="write" method="post">
	<div class="container-800 mt-40">
	
	
		<div class="row left">
			<label>말머리</label>
			<select class="input w-100" name="boardHead">
					<option value="">선택</option>
					<option>사담</option>
					<option>영화정보</option>
					<option>영화리뷰</option>
					<option>극장후기</option>
					
					
					
					
			</select>
		</div>
		
		<div class="row left">
		<label>제목</label>
		<input class="input w-100" type="text" name="boardTitle" required>
		</div>
		
		<div class="row left">
		<label>내용</label>
		<textarea name="boardContents" rows="10" required></textarea>
		</div>
		
		<div class="row right">
		<a class="btn btn-neutral" href="list">목록으로</a>
		<button class="btn btn-positive" type="submit">등록하기</button>
	</div>
		
	</div>
</form>

<div class="row">
	<h2>상태창</h2>	
	</div>
	<div class="row">
	loginId : ${sessionScope.LoginId}
	</div>
	<div class="row">
		로그인 : ${sessionScope.LoginId != null}
	</div>
	<div class="row">
		mg : ${sessionScope.ug}
	</div>
	<div class="row">
		관리자 : ${sessionScope.ug == '관리자'}
	</div>

<%-- <jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include> --%>
