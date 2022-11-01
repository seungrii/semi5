<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/views/template/header.jsp">
	<jsp:param value="메인화면" name="title"/>
</jsp:include>
	<section class="w-980">
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
										<a href="oneQnaDetail?askingNo=${oneQnaDto.askingNo}">${oneQnaDto.askingTitle}[1]</a>
									</c:otherwise>
								</c:choose>
							</td>
							<td>${oneQnaDto.askingWriteTime}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</section>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>