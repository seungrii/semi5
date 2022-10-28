<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<jsp:include page="/WEB-INF/views/template/header.jsp">
	<jsp:param value="공지 수정" name="title"/>
</jsp:include>

<link rel="stylesheet" type="text/css" href="/css/semi-commons.css">


<style>
        /*
            textarea는 기본적으로 폭 조절이 가능하여 디자인에 어려움이 많다
            - 높이만 조절되게 하던가
            - 아예 조절이 안되게 하던가
            - resize 속성
        */
        textarea.input {
            resize: vertical;
        }
        textarea.input.fix-size {
            resize: none;
        }
</style>

<form action="edit" method="post">
<!-- input[type=hidden]은 form 안에 위치해야 한다 -->
<input type="hidden" name="noticeNo" value="${noticeDto.noticeNo}">

<div class="container mt-40">
	<div class="row center">
		<h1>게시글 수정</h1>
	</div>
	
	<div class="row left">
		<input class="input w-100" type="text" name="noticeTitle" required value="${noticeDto.noticeTitle}" placeholder="제목을 입력해 주세요." autocomplete="off">
	</div>
	
	<div class="row left">
		<textarea class="input w-100" name="noticeContents" rows="10" required placeholder="내용을 입력하세요." value="${noticeDto.noticeContents}">${noticeDto.noticeContents}</textarea>
	</div>
	
	<div class="row right">
		<a class="btn btn-neutral" href="list">목록으로</a>
		<button class="btn btn-positive" type="submit">수정하기</button>
	</div>
</div>

</form>