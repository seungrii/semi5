<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/template/header.jsp">
	<jsp:param value="메인화면" name="title"/>
</jsp:include>
	<section class="w-980 test-css">
		loginId : ${sessionScope.LoginId}
		
	</section>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>