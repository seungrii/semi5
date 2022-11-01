<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/views/admin/admin-template/adminHeader.jsp">
<<<<<<< HEAD
	<jsp:param value="관리자계정 추가" name="title"/>
	<jsp:param value="1:1문의내역" name="title"/>
</jsp:include>
<section class="w-980">
	<div class="row mt-40 mb-40">
		<div class="row center">
			<h1>1:1 문의내역</h1>
		</div>
		<table class="table table-slit">
			<thead>
				<tr>
					<th>번호</th>
					<th width="45%">제목</th>
					<th>작성자</th>
					<th>작성일</th>
					<th>처리상태</th>
				</tr>
			</thead>
			<tbody class="center">
				<c:forEach var="oneQnaDto" items="${oneQnaDto}">
					<tr>
						<td>${oneQnaDto.askingNo}</td>
						<td><a href="../user/oneQnaDetail?askingNo=${oneQnaDto.askingNo}">${oneQnaDto.askingTitle}</a></td>
						<td>${oneQnaDto.userId}</td>
						<td>${oneQnaDto.askingWriteTime}</td>
						<td>
							<c:choose>
								<c:when test="${oneQnaDto.askingAnswer == null}">
									처리 전
								</c:when>
								<c:otherwise>
									처리완료
								</c:otherwise>
							</c:choose>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</section>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>