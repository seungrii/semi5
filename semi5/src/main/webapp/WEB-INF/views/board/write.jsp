<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<jsp:include page="/WEB-INF/views/template/header.jsp">
	<jsp:param value="자유 게시판" name="title"/>
</jsp:include>

<style>
        /*
            입력창은 버튼과 같이 등장하므로 비율이나 크기등이 같아야 한다
        */
        .input {
            font-size: 20px;
            padding: 0.75em;
            outline: none;
            border:1px solid gray;
        }
        .input:focus {
            border-color: black;
        }
        /* input이라는 클래스가 있으면서 input-underline 클래스가 있다면 */
        .input.input-underline {
            border: none;
            border-bottom: 1px solid gray;
        }
        .input.input-underline:focus {
            border-color: black;
        }

        /* 배경이미지가 들어가는 입력창 */
        .input.input-icon {
            padding-left: 2.5em;
            /* background-image: url("./image/search-icon.png"); */
            background-size: 1em;
            background-repeat: no-repeat;
            background-position-x: 0.75em;
            background-position-y: center;
        }

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

        .search-input {
            background-image: url("./image/search-icon.png");
        }
    </style>


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
			<textarea class="input w-100" name="boardContents" rows="10" required></textarea>
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

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>
