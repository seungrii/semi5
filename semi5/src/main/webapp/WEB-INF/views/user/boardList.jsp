<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/views/template/header.jsp">
	<jsp:param value="메인화면" name="title"/>
</jsp:include>
	<section class="w-980">
		<div class="row center mt-40 mb-40">
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
	</section>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>