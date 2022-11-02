<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/user-login-template/loginHeader.jsp">    
	<jsp:param value="메인화면" name="title"/>
</jsp:include>

	<section class="container mt-50">
	<div class="admin-box">
	
	<!-- 회원메뉴 사이드바 -->
    	<aside class="sidebar-css">
    		<div class="container-150">
    			<div class="row">
    				<h2>상태창</h2>
    			</div>
    			<%-- <div class="row">
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
		<div class="row mt-50 center">
			<h1>비밀번호 변경</h1>
		</div>
		<form action="changePw" method="post">
			<div class="row">
				<input class="change-input input-user" id="change-pw" type="password" name="userPw" placeholder="새 비밀번호">
				<span class="find-fail">사용할 수 없는 형식입니다.</span>
			</div>
			<div class="row">
				<input class="change-input input-user" id="change-pw-find" type="password" name="userPwFind" placeholder="비밀번호 확인">
				<span class="find-success">비밀번호가 일치합니다.</span>
				<span class="find-fail">비밀번호가 일치하지 않습니다.</span>	
			</div>
			<div>
				<button class="btn btn-positive" type="submit">변경</button>
			</div>
		</form>
		</div>
	</section>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>