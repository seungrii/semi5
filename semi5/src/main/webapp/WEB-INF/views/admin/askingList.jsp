<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/views/admin/admin-template/adminHeader.jsp">
	<jsp:param value="1:1문의내역" name="title"/>
</jsp:include>
<section class="w-980">
	<c:forEach var="oneQnaDto" items="${oneQnaDto}">
		<div class="row">
			${oneQnaDto.askingNo}
		</div>
		<div class="row">
			<a href="../user/oneQnaDetail?askingNo=${oneQnaDto.askingNo}">${oneQnaDto.askingTitle}</a>
		</div>
	</c:forEach>
</section>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>