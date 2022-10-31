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
	.p-kids{
		font-size: 23px;
		margin: 30px;
	}
</style>

</head>
<body>

	<div class="container mt-50">
		<div class="container mt-50">
			<h1>키즈관</h1>
		</div>
		<div class="container center mt-50">
			<img width="900px" src="/image/kids.jpeg">
			<div class="p-kids">
				<p>어린이/가족 관람객을 위한 ‘자동차석’, ’어린이석’, ‘일반석’으로 구성된 상영관으로 아이들이 취향에 맞게 좌석을 선택하여 영화를 관람하고, 보호자는 일반석에서 아이와 함께 영화를 관람할 수 있습니다.</p>
			</div>
		</div>
		
	</div>
</body>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>