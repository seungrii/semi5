<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/views/user-login-template/loginHeader.jsp">    
	<jsp:param value="내 게시글" name="title"/>
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
	
		<div class="row center mt-50 mb-40">
			<h1>내가 작성한 게시글</h1>
		</div>
		
		<div class="row center">
			<table class="table table-slit">
				<thead>
					<tr>
						<th>글번호</th>
						<th>분류</th>
						<th>제목</th>
						<th>작성자</th>
						<th>작성일</th>
					</tr>
				</thead>
				<tbody class="center">
					<c:forEach var="boardDto" items="${boardDto}">
						<tr>
							<td>${boardDto.boardNo}</td>
							<td>${boardDto.boardHead}</td>
							<td><a href="../board/detail?boardNo=${boardDto.boardNo}">${boardDto.boardTitle}</a></td>
							<td>${boardDto.boardWriter}</td>
							<td>${boardDto.boardWriteTime}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		</div>
	</section>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>