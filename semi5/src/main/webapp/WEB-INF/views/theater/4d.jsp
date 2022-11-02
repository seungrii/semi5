<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<link rel="stylesheet" type="text/css" href="/css/semi-commons.css">


<head>
<jsp:include page="/WEB-INF/views/template/header.jsp">
	<jsp:param value="특별관" name="title"/>
</jsp:include>
<style>
	.p-4d{
		font-size: 23px;
		margin: 30px;
	}
</style>

</head>
<body>

	<div class="container mt-50">
		<div class="container mt-50">
			<h1>4d</h1>
		</div>
		<div class="container center mt-50">
			<img src="/image/4d.jpeg" width="980px">
			<div style="margin-bottom: 100px">
				<p class="p-4d">4DX 상영관은 영화의 장면에 맞추어 움직이는 모션시트와 더불어</p>
				<p class="p-4d">바람, 빛, 안개, 향기, 진동 등의 다양한 환경 효과를 느낄 수 있는</p>		
				<p class="p-4d">오감 체험 특별 상영관입니다.</p>		
			</div>
		</div>
		
	</div>
</body>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>