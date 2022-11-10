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
	.p-imax{
		font-size: 23px;
		margin: 30px;
	}
</style>

</head>
<body>

	<div class="container mt-50">
		<div class="container mt-50">
			<h1>Imax</h1>
		</div>
		<div class="container center mt-50">
			<img src="${pageContext.request.contextPath}/image/imax.jpeg">
			<div style="margin-bottom: 100px">
				<p class="p-imax">대형 스크린에 맞는 맞춤형 설계로 모든 좌석에서 최고의 몰입 가능</p>
				<p class="p-imax">완벽하게 조율된 소리와 핀 포인트 정확도로 최적의 사운드를 제공</p>		
			</div>
		</div>
		
	</div>
</body>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>