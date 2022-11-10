<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/views/template/header.jsp">
	<jsp:param value="메인화면" name="title"/>
</jsp:include>
	<section class="w-980">
	<div class="admin-box">
	
	<!-- 회원메뉴 사이드바 -->
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
	
		<div class="row center mt-40 mb-40">
			<h1>1:1 문의내역</h1>
		</div>
		<div class="row center">
			<table class="table table-slit">
				<thead>
					<tr>
						<th>번호</th>
						<th>제목</th>
						<th>작성일</th>
					</tr>
				</thead>
				<tbody class="center">
					<c:forEach var="oneQnaDto" items="${oneQnaDto}">
						<tr>
							<td>${oneQnaDto.askingNo}</td>
							<td>
								<c:choose>
									<c:when test="${oneQnaDto.askingAnswer == null}">
										<a href="oneQnaDetail?askingNo=${oneQnaDto.askingNo}">${oneQnaDto.askingTitle}</a>
									</c:when>
									<c:otherwise>
										<a href="oneQnaDetail?askingNo=${oneQnaDto.askingNo}">${oneQnaDto.askingTitle}[처리완료]</a>
									</c:otherwise>
								</c:choose>
							</td>
							<td>${oneQnaDto.askingWriteTime}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		</div>
	</section>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>