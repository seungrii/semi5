<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/template/header.jsp">
	<jsp:param value="자유 게시판" name="title"/>
</jsp:include>
 
 
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/semi-commons.css">


<form action="edit" method="post">
<!-- input[type=hidden]은 form 안에 위치해야 한다 -->
<input type="hidden" name="boardNo" value="${boardDto.boardNo}">

<div class="container-800 mt-40">
	<div class="row center">
		<h1>게시글 수정</h1>
	</div>
	
	<div class="row left">
		<label>말머리</label>
		<select class="input w-100" name="boardHead">
			<option value="">선택</option>
			<option <c:if test="${boardDto.boardHead == '사담'}">selected</c:if>>사담</option>
			<option <c:if test="${boardDto.boardHead == '영화정보'}">selected</c:if>>영화정보</option>
			<option <c:if test="${boardDto.boardHead == '영화리뷰'}">selected</c:if>>영화리뷰</option>
			<option <c:if test="${boardDto.boardHead == '극장후기'}">selected</c:if>>극장후기</option>
		</select>
	</div>
	
	<div class="row left">
		<label>제목</label>
		<input class="input w-100" type="text" name="boardTitle" required value="${boardDto.boardTitle}" autocomplete="off">
	</div>
	
	<div class="row left">
		<label>내용</label>
		<textarea class="input w-100" name="boardContents" rows="10" required>${boardDto.boardContents}</textarea>
	</div>
	
	<div class="row right">
		<a class="btn btn-neutral" href="list">목록으로</a>
		<button class="btn btn-positive" type="submit">수정하기</button>
	</div>
</div>

</form>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>
