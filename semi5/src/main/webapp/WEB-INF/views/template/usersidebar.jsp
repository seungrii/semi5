<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 관리자메뉴 사이드바 -->
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