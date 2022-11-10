<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/semi-commons.css">


<head>
<jsp:include page="/WEB-INF/views/template/header.jsp">
	<jsp:param value="특별관" name="title"/>
</jsp:include>
<style>
	.p-suite{
		font-size: 23px;
		margin: 30px;
	}
</style>

</head>
<body>

	<div class="container mt-50">
		<div class="container mt-50">
			<h1>스위트관</h1>
		</div>
		<div class="container center mt-50">
			<img width="900px" src="${pageContext.request.contextPath}/image/suite.jpeg">
			<div style="margin-bottom: 100px">
				<p class="p-suite">호텔 스위트룸을 극장 안에 옮긴 듯 독립된 공간과 세련된 인테리어로</p>
				<p class="p-suite">쾌적한 영화 관람 환경을 선사합니다. 소중한 이들과 특별한 영화 여행을 떠나보세요</p>
			</div>
		</div>
		
	</div>
</body>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>