<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/views/template/header.jsp">
	<jsp:param value="메인화면" name="title"/>
</jsp:include>
	<section class="w-980">
		<div class="row">
			${oneQnaDto.askingNo}
		</div>
		<div class="row">
			${oneQnaDto.askingContents}
		</div>
		<c:if test="${loginGrade == '관리자' && oneQnaDto.askingAnswer == null}">
			<form action="oneQnaDetail" method="get">
				<div class="row">
					<textarea rows="5" cols="30"></textarea>	
				</div>
				<div class="row">
					<button type="submit">답변하기</button>
				</div>
			</form>
		</c:if>
	</section>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>