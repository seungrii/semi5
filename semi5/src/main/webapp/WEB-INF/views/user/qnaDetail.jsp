<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/views/template/header.jsp">
	<jsp:param value="메인화면" name="title"/>
</jsp:include>
	<section class="w-980">
		<div class="row center">
			<table class="table table-slit">
				<tbody>
					<tr>
						<th width="25%">번호</th>
						<td>${oneQnaDto.askingNo}</td>
					</tr>
					<tr>
						<th>제목</th>
						<td>${oneQnaDto.askingTitle}</td>
					</tr>
					<tr>
						<th height="200" valign="top">내용</th>
						<td>${oneQnaDto.askingContents}</td>
					</tr>
					<tr>
						<th>작성일</th>
						<td>${oneQnaDto.askingWriteTime}</td>
					</tr>
					<tr>
						<th>답변</th>
						<td>${oneQnaDto.askingAnswer}</td>
					</tr>
					<tr>
						<th colspan="2" >
							<c:if test="${loginGrade == '관리자' && oneQnaDto.askingAnswer == null}">
								<form action="oneQnaDetail" method="post">
									<input name="askingNo" type="hidden" readonly value="${oneQnaDto.askingNo}">
									<textarea class="fix-size" name="askingAnswer" rows="5" cols="100%"></textarea>	
									<button class="btn btn-positive " type="submit">답변하기</button>
								</form>
							</c:if>
						</th>
					</tr>
				</tbody>
			</table>
		</div>
	</section>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>