<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<jsp:include page="/WEB-INF/views/template/header.jsp">
	<jsp:param value="공지 게시판" name="title"/>
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


<form action="write" method="post">
	<div class="container mt-40 center">
		<div class="row left">
			<input class="input w-100" type="text" name="noticeTitle" required placeholder="제목을 입력해 주세요.">
		</div>
		
		<div class="row left">
			<textarea class="input w-100" name="noticeContents" rows="20" required placeholder="내용을 입력하세요."></textarea>
		</div>
		<div class="row right">
			<a class="btn btn-neutral" href="#">목록으로</a>
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





<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>
