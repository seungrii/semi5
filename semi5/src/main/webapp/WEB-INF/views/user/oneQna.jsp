<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<jsp:include page="/WEB-INF/views/user-login-template/loginHeader.jsp">
	<jsp:param value="로그인" name="title"/>
</jsp:include>
	<section class="w-980">
	<div class="admin-box">
	
	<!-- 회원메뉴 사이드바 -->
    	<aside class="sidebar-css">
    		<div class="container-150">
    			<div class="row">
    				<h2>상태창</h2>
    			</div>
    			<div class="row">
    				login : ${sessionScope.LoginId}
    			</div>
    			<div class="row">
    				admin : ${sessionScope.loginGrade}
    			</div>
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
		<div class="row center mt-40 mb-40">
			<h1>1:1 문의</h1>
		</div>
		<form action="oneQna" method="post">
			<div class="row">
				<label>문의 제목:</label>
				<input class="input input-underline w-50" type="text" name="askingTitle">
			</div>
			<div class="row">
				<h2>문의 내용</h2>
			</div>
			<div class="row">
				<textarea class="fix-size" rows="20" cols="70%" name="askingContents"></textarea>
			</div>
			<div class="row">
				<button class="btn btn-positive" type="submit">문의하기</button>
				<button id="btn-qna-back" class="btn btn-neutral " type="button">뒤로가기</button>
			</div>
		</form>
		</div>
	</section>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>