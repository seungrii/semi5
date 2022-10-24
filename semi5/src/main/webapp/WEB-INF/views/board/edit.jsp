<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<form action="edit" method="post">
<!-- input[type=hidden]은 form 안에 위치해야 한다 -->
<input type="hidden" name="boardNo" value="${dto.boardNo}">

<div class="container-800 mt-40">
	<div class="row center">
		<h1>게시글 수정</h1>
	</div>
	
	<div class="row left">
		<label>말머리</label>
		<select class="input w-100" name="boardHead">
			<option value="">선택</option>
			<option <c:if test="${dto.boardHead == '사담'}">selected</c:if>>사담</option>
			<option <c:if test="${dto.boardHead == '영화정보'}">selected</c:if>>영화정보</option>
			<option <c:if test="${dto.boardHead == '영화리뷰'}">selected</c:if>>영화리뷰</option>
			<option <c:if test="${dto.boardHead == '극장후기'}">selected</c:if>>극장후기</option>
			
			<c:if test="${mg == '관리자'}">
			<option <c:if test="${dto.boardHead == '공지'}">selected</c:if>>공지</option>
			</c:if>
		</select>
	</div>
	
	<div class="row left">
		<label>제목</label>
		<input class="input w-100" type="text" name="boardTitle" required value="${dto.boardTitle}" autocomplete="off">
	</div>
	
	<div class="row left">
		<label>내용</label>
		<!-- 
			textarea는 value 속성이 없고 시작태그와 종료태그 사이에 작성
			(주의) pre 태그와 동일하므로 엔터나 띄어쓰기 조심
		-->
		<textarea class="input w-100" name="boardContents" rows="10" required>${dto.boardContents}</textarea>
	</div>
	
	<div class="row right">
		<a class="btn btn-neutral" href="list">목록으로</a>
		<button class="btn btn-positive" type="submit">수정하기</button>
	</div>
</div>

</form>